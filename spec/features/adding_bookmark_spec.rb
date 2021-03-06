feature '/' do 
  scenario 'add a bookmark and expect it to load' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Reddit'
    fill_in :url, with: 'http://www.reddit.com'
    click_button 'Save and View'
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link 'Reddit'
    expect(page).to have_link 'Google'
  end
  scenario 'add a bookmark with a false url' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Reddit'
    fill_in :url, with: 'reddit'
    click_button 'Save and View'
    expect(page).to have_content 'Please enter a valid URL'
  end
end
