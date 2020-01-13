require 'user_bookmarks'

describe UserBookmarks do
  let(:subject) { described_class.new('plato', ["www.google.com", "www.reddit.com", "www.bbc.co.uk"]) }
  describe '#initialization' do
    it { expect(subject.author).to eq 'plato' }
    it { expect(subject.bookmarks).to be_a Array }
  end
end
