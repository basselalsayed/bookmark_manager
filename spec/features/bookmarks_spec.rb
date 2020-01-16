feature '/bookmarks' do 
  scenario 'it shows a heading' do
    visit '/'
    click_button 'Add Bookmark'
    click_button 'Save and View'
    expect(page).to have_content 'Bookmarks:'
    expect(page).to have_link 'Google'
  end
end