include ApplicationHelper

def goto_signin_page
    before { visit signin_path }
end

def normalized_valid_signin
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
end

def go_home
  before { click_link "Home" }
end

def be_error_page
  have_selector('div.alert.alert-error')
end

def normalized_invalid_signin
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }
end

def normalized_signout
  before { click_link "Sign out" }
  it { should have_link('Sign in', href: signin_path) }
end


def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def test_profile_page
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
end

def test_signup_page
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
end

def visit_signup_page
  visit signup_path
end


RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

def submit_invalid_user_info
    before { click_button submit }
    it { should have_title('Sign up') }
    it { should have_content('error') }
end

def confirm_no_change_user_count
  expect { click_button submit }.not_to change(User, :count)
end
