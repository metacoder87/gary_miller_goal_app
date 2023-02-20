require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject(:user) do
    User.create!(
      username: "thomas",
      password: "password"
    )
  end

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(username: "billy", password: "pastword")
      user = User.find_by(username: "billy")
      expect(user.password).not_to be("pastword")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "billy", password: "pastword")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:goals) }
  it { should have_many(:cheers_given) }
  it { should have_many(:cheers_received).through(:goals) }
  
end
