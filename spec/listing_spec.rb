require 'listing'

describe Listing do

  describe '.create' do
    it 'adds property to database' do
      
      listing = Listing.create('home','london', 'this is the details', 35, "2019-10-01", "2019-10-28")
      expect(listing.title).to eq('home')
      expect(listing.city).to eq('london')
    end

    it 'should have a price per night' do 
      
      listing = Listing.create('loft','paris',  'this is a super flat in paris, please come visit', 105, "2019-10-01","2019-10-28")
      expect(listing.pricepernight).to eq(105)
      expect(listing.details).to eq('this is a super flat in paris, please come visit')
    end
  end

  describe '.delete' do
    it 'can delete a property listing' do 
      listing = Listing.create('home','london', 'this is the details', 35, "2019-10-01", "2019-10-28")
      Listing.delete(1)
      expect(Listing.all).to eq([])
    end

    it 'can only delete one entry' do 
      listing = Listing.create('home','london', 'this is the details', 35, "2019-10-01", "2019-10-28")
      listing = Listing.create('loft','paris',  'this is a super flat in paris, please come visit', 105, "2019-10-01","2019-10-28")
      Listing.delete(1)
      expect(Listing.all).not_to eq([])
    end
  end

  describe '.edit' do 
    it 'can edit a listing' do 
      listing = Listing.create('home','london', 'this is the details', 35, "2019-10-01", "2019-10-28")
      Listing.edit('nothome','london','this is the details',35, "2019-10-01", "2019-10-28")
      expect(Listing.all).to eq([{"id" => "1", "title" => 'nothome', "city" => 'london', "details" => 'this is the details', "pricepernight" => "35", "date_from" => "2019-10-01", "date_till" => "2019-10-28", "user_id" => nil}])
    end
  end
end