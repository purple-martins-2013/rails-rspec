require 'spec_helper'


describe Post do

  context "before save" do
    let(:post) { Post.create(:title => "new post!", :content => "A great story")}
    it "title should be automatically titleized before save" do
      expect(post.title).to eq 'New Post!'
    end
  end

  context "#is_published" do
    let(:post) { Post.create(:title => "new post!", :content => "A great story", :is_published => false)}
    it "post should be unpublished by default" do
        expect(post.is_published).to be false
        post.is_published = true
    end
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  context '#slug' do
    let(:post) {Post.new(:title => "new post!", :content => "A great story!")}
    it "slug should be automatically generated" do
      post.slug.should be_nil
      post.save

      post.slug.should eq "new-post"
    end
  end
end
