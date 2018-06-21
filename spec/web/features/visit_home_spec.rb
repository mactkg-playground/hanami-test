require 'features_helper'

describe 'Visit home' do
    it 'タイトルが表示できる' do
        visit '/'

        page.body.must_include('Bookshelf')
    end
end
