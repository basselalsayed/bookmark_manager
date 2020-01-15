feature '/' do 
  scenario 'add a bookmark and expect it to load' do
    visit '/'
    fill_in :url, with: 'http://www.reddit.com'
    click_button 'Save and View'
    expect(page).to have_content 'http://www.reddit.com'
  end
end
