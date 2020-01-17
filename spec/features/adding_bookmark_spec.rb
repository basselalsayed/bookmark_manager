feature '/' do 
  scenario 'add a bookmark and expect it to load' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Reddit'
    fill_in :url, with: 'http://www.reddit.com'
    click_button 'Save and View'
    expect(page).to have_link 'Reddit'
    expect(page).to have_link 'Google'
  end
end
