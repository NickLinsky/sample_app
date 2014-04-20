require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user, email: "other@example.com") }
  
  before { sign_in user }
  after(:all) { User.delete_all }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
        it { should have_content('0 microposts') }
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end
  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it { should have_content('delete') }
      it { should have_content('1 micropost') }
      it { should_not have_content('1 microposts') }
      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as other user" do
      before { 
        sign_in user2
        visit user_path(user)
      }

      it {
        should have_content('Micropost')
        should_not have_content('delete') 
      }
    end

  end

  describe "pagination" do
    before do
      user.microposts.delete_all  
      FactoryGirl.create(:micropost, user: user)
      visit user_path(user)
    end
    after do
      user.microposts.delete_all  
    end

    describe "fewer than one page" do
      it { should_not have_selector('div.pagination') }

      describe "then more than one pages" do
        before { 50.times { FactoryGirl.create(:micropost, user: user) }
                 visit user_path(user) }
        it {
             should have_selector('div.pagination') 
             should have_content('Microposts')
        }
      end
    end
  end
end
