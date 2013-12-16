Given(/^an unregistered user named "(.*?)"$/) do |user_name|
  visit('/')
  @user_name = user_name
  click_on "Sign up"
end

When(/^Judy signs up for the site$/) do
  fill_in(:user_name, with: @user_name)
  click_on "Create Account"
end

Then(/^she should have an account$/) do
  user = User.where(name: @user_name).first
  expect(user).to be_valid
end

Then(/^it should say "(.*?)"$/) do |welcome_message|
  expect(page).to have_content(welcome_message)
end

Given(/^an unregistered user visits the site$/) do
  visit root_path
end

When(/^they sign up without a name$/) do
  click_on "Sign up"
  fill_in(:user_name, with: "")
  @user_count = User.count
  click_on "Create Account"
end

Then(/^they should not have an account$/) do
  expect(@user_count).to_not eq @user_count + 1
end

Then(/^it should give an error that says "(.*?)"$/) do |arg1|

end
