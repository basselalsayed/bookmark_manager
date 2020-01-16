require 'user_bookmarks'

describe Bookmarks do
  let(:subject) { Bookmarks }
  
  describe '#initialization' do
    it { expect(subject.all).to be_a Array }
  end

  describe '#all' do
    it { expect(subject.all[0]).to include "http://www.google.com" }
  end

  describe "#create" do
    it "allows a new bookmark to be created" do
      subject.create("http://www.facebook.com")
      expect(subject.all[-1]).to include "http://www.facebook.com"
    end
  end
end
