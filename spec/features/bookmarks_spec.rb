feature '/bookmarks' do 
  scenario 'it shows a heading' do 
    visit '/'
    click_button 'View Bookmarks'
    expect(page).to have_content 'Bookmarks:'
  end
end