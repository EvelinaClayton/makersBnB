require 'listing'
describe Listing do

  describe '.create' do
    it 'adds property to database' do
      connection = PG.connect(dbname: 'makers_bnb_test')
      listing = Listing.create(title: 'home', city: 'london')
      expect(listing.title).to eq('home')
      expect(listing.city).to eq('london')
    end
  end
  end