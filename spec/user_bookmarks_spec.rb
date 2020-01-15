require 'user_bookmarks'

describe Bookmarks do
  subject(:bm) { described_class.new('plato', ["www.google.com", "www.reddit.com", "www.bbc.co.uk"]) }
  describe '#initialization' do
    it { expect(bm.author).to eq 'plato' }
    it { expect(bm.all).to be_a Array }
  end

  describe '#retrieve' do 
    it { expect(subject.all).to include "4: http://www.google.com " }
  end
end
