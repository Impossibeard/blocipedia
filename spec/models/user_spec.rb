require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:wikis) }

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:username)
    end
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
    it "should respond to role" do
      expect(user).to respond_to(:role)
    end
    it "should respond to admin?" do
      expect(user).to respond_to(:admin?)
    end
    it "should respond to standard?" do
      expect(user).to respond_to(:standard?)
    end
  end

  describe "roles" do
  it "should be standard by default" do
    expect(user.role).to eql("standard")
  end

  context "standard user" do
    it "should return true for #standard?" do
      expect(user.standard?).to be_truthy
    end
    it "should return false for #premium?" do
      expect(user.premium?).to be_falsey
    end
    it "should return false for #admin?" do
      expect(user.admin?).to be_falsey
    end
  end

  context "premium user" do
    before do
      user.premium!
    end
    it "should return false for #standard?" do
      expect(user.standard?).to be_falsey
    end
    it "should return true for #premium?" do
      expect(user.premium?).to be_truthy
    end
    it "should return false for #admin?" do
      expect(user.admin?).to be_falsey
    end
  end

  context "admin user" do
    before do
      user.admin!
    end
    it "should return false for #standard?" do
      expect(user.standard?).to be_falsey
    end
    it "should return false for #premium?" do
      expect(user.premium?).to be_falsey
    end
    it "should return true for #admin?" do
      expect(user.admin?).to be_truthy
    end
  end
end

end
