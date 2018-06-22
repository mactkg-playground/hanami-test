require 'features_helper'

describe '本を作成する' do
    after do
        BookRepository.new.clear
    end

    it '新しい本を作成できる' do
        visit '/books/new'

        within 'form#book-form' do
            fill_in 'タイトル', with: 'いい感じの本'
            fill_in '著者', with: 'mactkg'
            
            click_button '作成'
        end
        
        current_path.must_equal('/books')
        assert page.has_content?('いい感じの本')
    end

end