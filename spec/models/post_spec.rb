require 'rails_helper'

RSpec.describe Post, :type => :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
  it { should have_many(:comments) }

  describe 'instance methods' do

    context '#likes_count' do
      let(:post) { create(:post, :with_2_likes) }

      it 'should have 2 likes' do
        expect(post.likes_count).to eq 2
      end
    end

    context '#liked_by?' do
      let(:post) { create(:post, likes: [user.id]) }
      let(:user) { create(:user) }
      let(:user_2) { create(:user) }


      it 'should be true' do
        expect(post.liked_by?(user)).to be_truthy
      end

      it 'should be true' do
        expect(post.liked_by?(user_2)).to be_falsey
      end
    end

    context "#like_by!" do
      let(:post) { create(:post) }
      let(:user) { create(:user) }

      it do
        expect { post.like_by!(user) }.to change { post.likes }.from([]).to([user.id])
      end

    end

  end


  # describe "validation" do
  #   let(:post) { Post.new }
  #
  #   context "without title" do
  #
  #     it "should not be valid" do
  #       expect(post.valid?).to be_falsey
  #       expect(post.errors).to be_present
  #       expect(post.errors.messages[:title]).to be_present
  #     end
  #   end
  #
  #   context "without body" do
  #
  #     it "should not be valid" do
  #       expect(post.valid?).to be_falsey
  #       expect(post.errors).to be_present
  #       expect(post.errors.messages[:body]).to be_present
  #     end
  #   end
  #
  #   context "with title" do
  #     let(:post) { Post.new(title: 'Title') }
  #
  #     it "should not be valid" do
  #       expect(post.valid?).to be_falsey
  #       expect(post.errors).to be_present
  #       expect(post.errors.messages[:title]).to be_empty
  #       expect(post.errors.messages[:body]).to be_present
  #     end
  #
  #     context 'with body' do
  #       let(:post) { Post.new(title: 'Title', body: 'Body', user_id: 1) }
  #
  #       it do
  #         expect(post.valid?).to be_truthy
  #         expect(post.errors).not_to be_present
  #         expect(post.errors.messages[:title]).to be_empty
  #         expect(post.errors.messages[:body]).to be_empty
  #       end
  #     end
  #   end
  # end
end
