require 'bookmark'

describe Bookmark do
  let(:subject) { Bookmark }
  
  describe '#initialization' do
    it { expect(subject.all).to be_a Array }
  end

  describe '.all' do
    it { expect(subject.all[0].url).to eq "http://www.google.com" }
    it { expect(subject.all[0]).to be_a Bookmark }
    it { expect(subject.all[0].title).to eq 'Google' }
  end

  describe ".create" do
    it "allows a new bookmark to be created" do
      subject.create(title: 'Facebook', url: 'http://www.facebook.com')
      expect(subject.all[-1].url).to eq "http://www.facebook.com"
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      subject.delete(id: subject.all.first.id) 
      expect(subject.all).to be_empty
    end
  end
end
