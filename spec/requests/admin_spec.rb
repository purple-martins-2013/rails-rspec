require 'spec_helper'
# require "selenium-webdriver"
# driver = Selenium::WebDriver.for :firefox

describe 'Admin' do
  let(:post) {Post.create(title: 'Hello World', content: 'FOOBAR')}

  context "on admin homepage" do
    it "can see a list of recent posts" do
      post
      visit admin_posts_path
      page.should have_content "Hello World"
    end
    it "can edit a post by clicking the edit link next to a post" do
      post
      visit admin_posts_path
      page.should have_content "Edit"
    end
    it "can delete a post by clicking the delete link next to a post" do
      post
      visit admin_posts_path
      page.should have_content "Delete"
    end


    it "can create a new post and view it" do
     visit new_admin_post_path

     expect {
       fill_in 'post_title',   with: "Hello world!"
       fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
       page.check('post_is_published')
       click_button "Save"
       }.to change(Post, :count).by(1)

       page.should have_content "Published: true"
       page.should have_content "Post was successfully saved."
     end
   end

   context "editing post" do
    it "can mark an existing post as unpublished" do
      pending # remove this line when you're working on implementing this test

      page.should have_content "Published: false"
    end
  end

  context "on post show page" do
    it "can visit a post show page by clicking the title"
    it "can see an edit link that takes you to the edit post path"
    it "can go to the admin homepage by clicking the Admin welcome page link"
  end
end
