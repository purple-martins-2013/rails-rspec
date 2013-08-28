require 'spec_helper'


describe Post do

  let(:title)     {"New post!"}
  let(:content)   {"A great story"}
  let(:post)      { Post.new(title, content) }

  # it "title should be automatically titleized before save" do
  #   pending
  # end

  # it "post should be unpublished by default" do
  #   pending
  # end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  describe '#slug' do
    context "with valid input" do
      it "slug should be automatically generated" do
        post = Post.new
        post.title   = "New post!"
        post.content = "A great story"
        post.slug.should be_nil
        post.save

        post.slug.should eq "new-post"
      end
    end
  end
end
