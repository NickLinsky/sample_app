require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    goto_signin_page

    describe "with invalid information" do
      normalized_invalid_signin

      describe "after visiting another page" do
        go_home

        it { should_not be_error_page }
      end
    end

    describe "with valid information" do
      normalized_valid_signin

      describe "followed by signout" do
        normalized_signout
      end
    end
  end
end
