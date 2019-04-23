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
    should "Alphabetically List jobs" do
      assert_equal 2, Job.alphabetical.size
      assert_equal ["Clerk", "Janitor"], Job.alphabetical.map{|job| job.name}
    end
    
    should "Show that job can only be deleted if the job has never been worked by an employee; otherwise it is made inactive" do
      @cmu = FactoryBot.create(:store)
      @faaiz = FactoryBot.create(:employee, first_name: "Faaiz", last_name: "Joad", role: "manager", phone: "949-786-4786")
      @assignment_faaiz = FactoryBot.create(:assignment, employee: @faaiz, store: @cmu, start_date: 6.months.ago.to_date, end_date: nil)
      @shift_faaiz = FactoryBot.create(:shift, assignment: @assignment_faaiz)
      @shift_job_clerk = FactoryBot.create(:shift_job, job: @clerk, shift: @shift_faaiz)

      @clerk.destroy
      assert_equal 1, Job.inactive.size
      assert_equal ["Clerk"], Job.inactive.map{|job| job.name}
      
      @shift_job_clerk.destroy
      @shift_faaiz.destroy
      @assignment_faaiz.destroy
      @faaiz.destroy
      @cmu.destroy
    end
  end
end
