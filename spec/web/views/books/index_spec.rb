require_relative '../../../spec_helper'

describe Web::Views::Books::Index do
  let(:exposures) { Hash[books: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it '#booksがexposeされている' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe '本が登録されていないとき' do
    it 'プレースホルダメッセージが表示される' do
      rendered.must_include('<p class="placeholder">まだ本がありません。</p>')
    end
  end

  describe '本が登録されているとき' do
    let(:book1) { Book.new(title: 'Refactoring', author: 'Martin Fowler')}
    let(:book2) { Book.new(title: 'Domain Driven Design', author: 'Eric Evans')}
    let(:exposures) { Hash[books: [book1, book2]] }

    it 'すべて表示される' do
      rendered.scan(/class="book"/).count.must_equal 2
      rendered.must_include('Refactoring')
      rendered.must_include('Domain Driven Design')
    end

    it 'プレースホルダメッセージが表示されない' do
      rendered.wont_include('<p class="placeholder">まだ本がありません。</p>')
    end 
  end
end
