require 'rails_helper'
describe Post do
  describe '#create' do
    it "全ての項目がある場合は投稿できること" do
      user = create(:user)
      user_id = User.first.id
      genre = create(:genre)
      genre_id = Genre.first.id
      post = build(:post, user_id: user_id, genre_id: genre_id)
      expect(post).to be_valid
    end

    it "titleがない場合は投稿できないこと" do
      user = create(:user)
      user_id = User.first.id
      genre = create(:genre)
      genre_id = Genre.first.id
      post = build(:post, user_id: user_id, genre_id: genre_id, title: "")
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "textがない場合は投稿できないこと" do
      user = create(:user)
      user_id = User.first.id
      genre = create(:genre)
      genre_id = Genre.first.id
      post = build(:post, user_id: user_id, genre_id: genre_id, text: "")
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end

    it "imageがない場合は投稿できないこと" do
      user = create(:user)
      user_id = User.first.id
      genre = create(:genre)
      genre_id = Genre.first.id
      post = build(:post, user_id: user_id, genre_id: genre_id, image: "")
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end
  end
end
