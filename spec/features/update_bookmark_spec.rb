feature 'bookmark/update' do
  scenario 'bookmark update' do
    visit '/bookmarks'
    click_button("Update#{Bookmark.all.first.id}")
    fill_in :title, with: 'Twitter'
    fill_in :url, with: 'http://www.twitter.com'
    click_button 'Save and Update'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link 'Google'
    expect(page).to have_link 'Twitter'
  end
end