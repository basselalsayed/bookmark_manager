feature 'bookmark/delete' do
  scenario 'bookmark deleted' do
    visit '/bookmarks'
    click_button("#{Bookmark.all.first.id}")
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Google'
  end
end