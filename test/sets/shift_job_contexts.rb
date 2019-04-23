module Contexts
  module ShiftJobContexts
    # Context for shiftjobs (assumes contexts for shifts, jobs)
    def create_shiftjobs
      @shiftjob1 = FactoryBot.create(:shift_job, job: @mopfloors, shift: @earlymorning)
      @shiftjob2 = FactoryBot.create(:shift_job, job: @cleanmachines, shift: @earlymorning)
      @shiftjob3 = FactoryBot.create(:shift_job, job: @eatgarbage, shift: @night)
      @shiftjob4 = FactoryBot.create(:shift_job, job: @mopfloors, shift: @afternoon)
      @shiftjob5 = FactoryBot.create(:shift_job, job: @mopfloors, shift: @night)
      @shiftjob6 = FactoryBot.create(:shift_job, job: @changetissues, shift: @evening)

    end
    
    def remove_shiftjobs
      @shiftjob1.destroy
      @shiftjob2.destroy
      @shiftjob3.destroy
      @shiftjob4.destroy
      @shiftjob5.destroy
      @shiftjob6.destroy
    end


  end
end