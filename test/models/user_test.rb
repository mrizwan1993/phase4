require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to(:employee)
  
  # Test basic validations
  should have_secure_password

  # test one of each factory (not really required, but not a bad idea)
  should "show that all factories are properly created" do
    assert_equal "cindy@a&m.com", @cindyUser.email
    assert_equal "ralphpassword", @ralphUser.password_digest
    assert_equal @ben, @benUser.employee
  end
  # tests for email
 
  should allow_value("test@testemail.com").for(:email)
  should allow_value("test12341512@testemail.com").for(:email)
  should allow_value("12315415test@testemail.com").for(:email)
  should_not allow_value("....test@testemail.com").for(:email)
  should_not allow_value("/////test@testemail.com").for(:email)
  should_not allow_value("----test@testemail.com").for(:email)
  should_not allow_value("412-268-3259").for(:email)
  should_not allow_value("412.268.3259").for(:email)
  should_not allow_value("(412) 268-3259").for(:email)
  should_not allow_value(nil).for(:email)
  should_not allow_value("2683259").for(:email)
  should_not allow_value("14122683259").for(:email)
  should_not allow_value("4122683259x224").for(:email)
  should_not allow_value("800-EAT-FOOD").for(:email)
  should_not allow_value("412/268/3259").for(:email)
  should_not allow_value("412-2683-259").for(:email)


  context "Creating a context for users" do
    # create the objects I want with factories
    setup do
      create_employees
      create_users
    end
    
    # and provide a teardown method as well
    teardown do
      remove_users
      remove_employees
    end
  end
end
