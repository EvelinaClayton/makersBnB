require 'listing'
describe Listing do

  describe '.create' do
    it 'adds property to database' do
      
      listing = Listing.create(title: 'home', city: 'london', details: 'this is the details', pricepernight: 35)
      expect(listing.title).to eq('home')
      expect(listing.city).to eq('london')
    end

    it 'should have a price per night' do 
      
      listing = Listing.create(title: 'loft', city: 'paris', details: 'this is a super flat in paris, please come visit', pricepernight: 105)
      expect(listing.pricepernight).to eq(105)
      expect(listing.details).to eq('this is a super flat in paris, please come visit')
    end
  end

  describe '.delete' do
    it 'can delete a property listing' do 
      listing = Listing.create(title: 'home', city: 'london', details: 'this is the details', pricepernight: 35)
      Listing.delete(1)
      expect(Listing.all).to eq([])
    end

    it 'can only delete one entry' do 
      listing = Listing.create(title: 'home', city: 'london', details: 'this is the details', pricepernight: 35)
      listing = Listing.create(title: 'loft', city: 'paris', details: 'this is a super flat in paris, please come visit', pricepernight: 105)
      Listing.delete(1)
      expect(Listing.all).not_to eq([])
    end
  end
end