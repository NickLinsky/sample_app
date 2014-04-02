require 'spec_helper'
require 'sessions_helper'

print "1\n"
describe "Authentication" do
print "2\n"
  subject { page }
print "3\n"

  describe "signin" do
print "4\n"

    describe "as admin user" do
print "5\n"
      deb "as admin user...\n"
      let(:admin) { FactoryGirl.create(:admin) }
it {print "5.1\n"}
print "6\n"
      let(:orig_count) { User.count }
print "7\n"
      before do
print "8\n"
        #click_link "Sign out"
        print "sign_in <" + admin.to_s + ">\n"
        sign_in admin # takes us to Utilities.sign_in
print "9\n"
       end # before do
specify { print "9.5\n"
          1==1 }
print "10\n"
      describe "deleting themselves" do
print "11\n"
        before do
print "13 delete " + user_path(admin) + "\n"
         get user_path(admin)
print "13.5\n"
         delete user_path(admin)
print "14\n"
        end # before
#        specify { expect(response).to redirect_to(root_url) }
#        specify { :orig_count == User.count }
print "15\n"
        it { print "16\n"
             1 == 1 }
        print "17\n"
      end # describe deleting themselves
        print "18\n"
    end # describe as admin user
        print "19\n"
  end # describe sign on
        print "20\n"
        it { print "21\n"
             1 == 1 }
        print "22\n"
end # describe Authentication

print "23\n"
describe "something else" do
print "24\n"
  before {
print "25\n"
  }
print "26\n"
  it { print "27\n" }
print "28\n"
end # describe something else
print "29\n"
