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
      @teststore = FactoryBot.create(:store)
      @testemployee = FactoryBot.create(:employee, first_name: "Test", last_name: "Employee", role: "manager", phone: "949-786-4786")
      @testassignment = FactoryBot.create(:assignment, employee: @testemployee, store: @teststore, start_date: 6.months.ago.to_date, end_date: nil)
      @testshift = FactoryBot.create(:shift, assignment: @testassignment)
      @testjob = FactoryBot.create(:job, name: "Test Job", active: true)
      @mopfloors = FactoryBot.create(:job, name: "Mop Floors", description: "Mop all the floors in the building", active: true)
      @cleanmachines = FactoryBot.create(:job, name: "Clean the Machines", description: "Clean all the machines in the store", active: false)
      @eatgarbage = FactoryBot.create(:job, name: "Eat Garbage", description: "Become the waste disposal", active: false)
      @changetissues = FactoryBot.create(:job, name: "Change Tissues", description: "Change the tissues in the boxes", active: true)
      @testshiftjob = FactoryBot.create(:shift_job, job: @testjob, shift: @testshift)
    end
    
    # and provide a teardown method as well
    teardown do
      @testshiftjob.destroy
      @testjob.destroy
      @mopfloors.destroy
      @cleanmachines.destroy
      @eatgarbage.destroy
      @changetissues.destroy
      @testshift.destroy
      @testassignment.destroy
      @testemployee.destroy
      @teststore.destroy
    end
  
    # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "Mop Floors", @mopfloors.name
      assert_equal false, @cleanmachines.active
      assert_equal false, @eatgarbage.active
    end

    # test the scope 'alphabetical'
    should "shows that there are five jobs in alphabetical order" do
      assert_equal ["Change Tissues", "Clean the Machines", "Eat Garbage", "Mop Floors", "Test Job"], Job.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are three active jobs" do
      assert_equal 3, Job.active.size
      assert_equal ["Change Tissues", "Mop Floors", "Test Job"], Job.active.alphabetical.map{|s| s.name}
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
    should "Alphabetically List jobs" do
      assert_equal 5, Job.alphabetical.size
      assert_equal ["Change Tissues", "Clean the Machines", "Eat Garbage", "Mop Floors", "Test Job"], Job.alphabetical.map{|job| job.name}
    end
    
    should "Show that job can only be deleted if the job has never been worked by an employee; otherwise it is made inactive" do
      @testjob.destroy
      assert_equal 3, Job.inactive.size
      assert_equal [ "Test Job", "Clean the Machines", "Eat Garbage"], Job.inactive.map{|job| job.name}
    end
  end
end
