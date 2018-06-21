require_relative '../../../spec_helper'

describe Web::Controllers::Books::Index do
  let(:action) { Web::Controllers::Books::Index.new }
  let(:params) { Hash[] }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
    @book = repository.create(title: 'TDD', author: 'Kent Beck')
  end

  it '200を返す' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'booksをexposeしている' do
    action.call(params)
    action.exposures[:books].must_equal [@book]
  end
end
