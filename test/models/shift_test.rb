require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  # Test relationships
   should belong_to(:assignment)
   should have_one(:employee), through: :assignment
   should have_one(:store), through: :assignment
   should have_many(:shift_jobs)
   should have_many(:jobs), through: :shift_jobs

  # # Test basic validations
  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:assignment_id)


  # # for start date
  should allow_value(7.weeks.ago.to_date).for(:date)
  should allow_value(2.years.ago.to_date).for(:date)
  should allow_value(2.years.from_now.to_date).for(:date)
  should allow_value(1.week.from_now.to_date).for(:date)
  should_not allow_value("bad").for(:date)
  should_not allow_value(nil).for(:date)

  # # Need to do the rest with a context
  context "Creating a context for shifts" do
    setup do

    end

    teardown do

    end
    
    
    should "end_time cannot be less than start_time" do
      
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.build(:shift)
      @testshift3.end_time = @testshift3.start_time - 10.hours
      assert !@testshift3.valid?
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy

    end

    should "date is not in the past" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.build(:shift, date: Date.today - 10.days)
      assert !@testshift3.valid?
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end

    should "shift cannot be added to an inactive assignment" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.build(:assignment, employee: @testemployee3, store: @teststore3, end_date: Date.today - 10.days)
      @testshift3 = FactoryBot.build(:shift, assignment: @testassignment3)
      assert !@testshift3.valid?
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "past shift cant be deleted" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, employee: @testemployee3, store: @teststore3, start_date: 6.months.ago.to_date, 
      end_date: nil)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Time.now - 100.hours)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Time.now + 100.hours)
      @testshift3.destroy
      assert !@testshift3.destroyed?
      @testshift4.destroy
      assert @testshift4.destroyed?
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "Check if completed? works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.build(:assignment, employee: @testemployee3, store: @teststore3,
      end_date: Date.today - 10.days)
      @testshift3 = FactoryBot.build(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      assert @testshift3.completed?
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end

    should "Check if end_time automatically set" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.build(:assignment, employee: @testemployee3, store: @teststore3)
      @testshift3 = FactoryBot.build(:shift, assignment: @testassignment3, start_time: Time.now)
      assert_in_delta 1, @testshift3.end_time.to_i, Time.now.to_i + 3.hours.to_i
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "Check if start_now works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.build(:assignment, employee: @testemployee3, store: @teststore3)
      @testshift3 = FactoryBot.build(:shift, assignment: @testassignment3, start_time: Time.now)
      @testshift3.start_now
      assert_in_delta 1, @testshift3.start_time.to_i, Time.now.to_i
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end

    should "Check if end_now works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.build(:assignment, employee: @testemployee3, store: @teststore3)
      @testshift3 = FactoryBot.build(:shift, assignment: @testassignment3, start_time: Date.current + 2.hours)
      @testshift3.end_now
      assert_in_delta 1, @testshift3.start_time.to_i, Time.now.to_i
      @testshift3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    
    should "have a scope completed that works" do
      @teststore2=FactoryBot.create(:store)
      @testemployee2=FactoryBot.create(:employee)
      @testassignment2=FactoryBot.create(:assignment, store: @teststore2, employee: @testemployee2)
      @testshift2 = FactoryBot.create(:shift, assignment: @testassignment2, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment2, date: Date.today + 10.days)
      @testjob2 = FactoryBot.create(:job)
      @testshiftjob2 = FactoryBot.create(:shift_job, shift: @testshift2, job: @testjob2)

      assert_equal [1], Shift.completed.map{|shift| shift.id}
      @testshift2.destroy
      @testshift4.destroy
      @testjob2.destroy
      @testshiftjob2.destroy
      @testassignment2.destroy
      @testemployee2.destroy
      @teststore2.destroy
    end
    
    
    should "have a scope incomplete that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)

      assert_equal [1,2], Shift.incomplete.map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    
    should "have a scope for_store that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1, 2], Shift.for_store(1).map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end

    should "have a scope for_employee that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1,2], Shift.for_employee(1).map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    
    should "have scope for past that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1], Shift.past.map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "have scope for upcoming that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [2], Shift.upcoming.map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "have a scope for_next_days that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [2], Shift.for_next_days(10).map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end

    should "have a scope for_past_days that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1], Shift.for_past_days(100).map{|shift| shift.id}.sort
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "have a scope by_store that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1, 2], Shift.by_store.map{|shift| shift.id}
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "have a scope by_employee that works" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3=FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3)
      @testshift3 = FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)
      @testshift4=FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today + 10.days)
      @testjob3 = FactoryBot.create(:job)
      @testshiftjob3 = FactoryBot.create(:shift_job, shift: @testshift3, job: @testjob3)
      assert_equal [1,2], Shift.by_employee.map{|shift| shift.id}
      @testshift3.destroy
      @testshift4.destroy
      @testjob3.destroy
      @testshiftjob3.destroy
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
    
    should "not allow shift to be added to past assignment" do
      @teststore3=FactoryBot.create(:store)
      @testemployee3=FactoryBot.create(:employee)
      @testassignment3= FactoryBot.create(:assignment, store: @teststore3, employee: @testemployee3, start_date: 4.months.ago.to_date, end_date: 2.months.ago.to_date)
      assert_raise(Exception) {FactoryBot.create(:shift, assignment: @testassignment3, date: Date.today - 100.days)}
      @testassignment3.destroy
      @testemployee3.destroy
      @teststore3.destroy
    end
  end
end
