require_relative '../../../spec_helper'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  let(:params) { Hash[book: { title: '初めてのRuby', author: 'Yugui' }] }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  it '新しい本を作成する' do
    action.call(params)
    book = repository.last

    book.id.wont_be_nil
    book.title.must_equal params.dig(:book, :title)
  end

  it '本の一覧にリダイレクトされる' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/books'
  end
end
