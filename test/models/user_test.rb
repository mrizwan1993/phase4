require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to(:employee)
  
  # Test basic validations
  should have_secure_password

  # test one of each factory (not really required, but not a bad idea)

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
    end
    
    # and provide a teardown method as well
    teardown do
    end
    
    
    #test scopes and methods 
    should "Assure that user can only be added to an active employee" do
      @testemployee = FactoryBot.create(:employee, active: true)
      @testemployee2=FactoryBot.create(:employee, active: false)
      @testuser = FactoryBot.create(:user, email:"testuser@test.com", employee: @testemployee)
      assert @testuser.valid?
      @testuser2= FactoryBot.create(:user, email:"testuser2@test.com", employee: @testemployee2)
      assert !@testuser2.valid?
      @testuser.destroy
      @testuser2.destroy
      @testemployee.destroy
      @testemployee2.destroy
    end
    
    should "Show that user is automatically deleted when employee is deleted" do
      @testemployee = FactoryBot.create(:employee, active: true)
      @testuser = FactoryBot.create(:user, email:"testuser@test.com", employee: @testemployee)
      @testemployee.destroy
      assert @testemployee.destroyed?
      assert @testuser.destroyed?
    end
    
    should "make sure user_role function works" do
      @testemployee = FactoryBot.create(:employee, first_name: "test", last_name: "employee", ssn: "123-67-8236", phone: "949-675-2317", role: "manager")
      @testuser = FactoryBot.create(:user, email:"test@test.com", employee: @testemployee) 
      assert_equal "manager", @testuser.user_role
      @testuser.destroy
      @testemployee.destroy
    end    
  end
end
