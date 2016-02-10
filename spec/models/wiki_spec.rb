require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { create(:user) }
  let(:wiki) { create(:wiki, user: user) }
  let(:private_wiki) { create(:private_wiki, user: user) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5) }

  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(20) }

  describe "attributes" do
    it "should respond to title" do
      expect(wiki).to respond_to(:title)
    end
    it "should respond to body" do
      expect(wiki).to respond_to(:body)
    end
  end

  describe "scopes" do
    before do
      @public_wiki = Wiki.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph, private: false, user: user)
      @private_wiki = Wiki.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph, private: true, user: user)
    end

    describe "visible_to(user)" do
      it "returns all wikis if the user is present" do
        user = User.new
# #2
        expect(Wiki.visible_to(user)).to eq(Wiki.all)
      end

      it "returns only public topics if user is nil" do
# #3
        expect(Wiki.visible_to(nil)).to eq([@public_wiki])
      end
    end
  end

end
