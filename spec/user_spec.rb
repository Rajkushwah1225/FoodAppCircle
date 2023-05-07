RSpec.describe User, type: :model do
    # your tests will go here
    it "is not valid without a name" do
        user = User.new(name: nil)
        expect(user).to_not be_valid
      end
  end