require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)

  # # Test basic validations
  should validate_presence_of(:name)

  #   # Establish context
  # # Testing other methods with a context
  context "Creating a context for jobs" do
    # create the objects I want with factories
    setup do 
      create_jobs
    end
    
    # and provide a teardown method as well
    teardown do
      remove_jobs
    end
  
    # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "Mop Floors", @mopfloors.name
      assert_equal false, @cleanmachines.active
      assert_equal false, @eatgarbage.active
    end

    # test the scope 'alphabetical'
    should "shows that there are three jobs in alphabetical order" do
      assert_equal ["Change Tissues", "Clean the Machines", "Eat Garbage", "Mop Floors"], Job.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are two active jobs" do
      assert_equal 2, Job.active.size
      assert_equal ["Change Tissues", "Mop Floors"], Job.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there are two inactive flavors" do
      assert_equal 2, Job.inactive.size
      assert_equal ["Clean the Machines", "Eat Garbage"], Job.inactive.alphabetical.map{|s| s.name}
    end
  
    #test the make_inactive method
    should "shows that Change Tissues is no longer active" do
      @changetissues.make_inactive
      assert_equal false, (@changetissues.active)
    end
    
    #test the rollback callback
  end
end
