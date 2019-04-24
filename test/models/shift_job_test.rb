require 'test_helper'

class ShiftJobTest < ActiveSupport::TestCase
  should belong_to(:shift)
  should belong_to(:job)
  
  
  context "Creating a context for shift_jobs" do
  # create the objects I want with factories
    setup do
      @teststore = FactoryBot.create(:store)
      @testemployee = FactoryBot.create(:employee, first_name: "Test", last_name: "Employee", role: "manager", phone: "949-786-4786")
      @testassignment = FactoryBot.create(:assignment, employee: @testemployee, store: @teststore, start_date: 6.months.ago.to_date, end_date: nil)
      @testshift = FactoryBot.create(:shift, assignment: @testassignment)
      @testjob = FactoryBot.create(:job, name: "Test Job", active: true)
      @testshiftjob = FactoryBot.create(:shift_job, job: @testjob, shift: @testshift)
    end
    
    # and provide a teardown method as well
    teardown do
      @testshiftjob.destroy
      @testjob.destroy
      @testshift.destroy
      @testassignment.destroy
      @testemployee.destroy
      @teststore.destroy
    end
    
    
        # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal @testjob, @testshiftjob.job
      assert_equal @testassignment, @testshiftjob.shift.assignment
      assert_equal true, @testjob.active
    end
  end
end
