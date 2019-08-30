require 'user'

describe User do

  describe '.create' do
    
    it 'adds user to database' do
      user = User.create("h@h.h", "12345")
      expect(user.email).to eq("h@h.h")
      expect(user.id.to_i).to be_a_kind_of(Numeric)
    end
    
  end

end
