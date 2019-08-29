require 'user'

describe User do

  describe '.create' do
    
    it 'adds user to database' do
      user = User.create(email: "lol@u.n00000b", password: "12345")
      expect(user.email).to eq("lol@u.n00000b")
      expect(user.id.to_i).to be_a_kind_of(Numeric)
    end
  end
  end