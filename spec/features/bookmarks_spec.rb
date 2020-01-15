feature '/bookmarks' do 
  scenario 'it shows a heading' do
    visit '/'
    click_button 'Save and View'
    expect(page).to have_content 'Bookmarks:'
    expect(page).to have_content 'google'
  end
end