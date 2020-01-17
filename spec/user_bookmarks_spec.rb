require 'user_bookmarks'

describe Bookmark do
  let(:subject) { Bookmark }
  
  describe '#initialization' do
    it { expect(subject.all).to be_a Array }
  end

  describe '#all' do
    it { expect(subject.all[0].url).to eq "http://www.google.com" }
  end

  describe "#create" do
    it "allows a new bookmark to be created" do
      subject.create(title: 'Facebook', url: 'http://www.facebook.com')
      expect(subject.all[-1].url).to include "http://www.facebook.com"

    end
  end
end
