feature '/bookmarks' do 
  scenario 'it shows a heading' do
    visit '/'
    click_button 'Add Bookmark'
    click_button 'Save and View'
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link 'Google'
  end
end