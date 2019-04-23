module Contexts
  module ShiftJobContexts
    # Context for shiftjobs (assumes contexts for shifts, jobs)
    def create_shiftjobs
      @shiftjob1 = FactoryBot.create(:shift, job: @mopfloors, shift: @earlymorning)
      @shiftjob2 = FactoryBot.create(:shift, job: @cleanmachines, shift: @earlymorning)
      @shiftjob3 = FactoryBot.create(:shift, job: @eatgarbage, shift: @night)
      @shiftjob4 = FactoryBot.create(:shift, job: @mopfloors, shift: @afternoon)
      @shiftjob5 = FactoryBot.create(:shift, job: @mopfloors, shift: @night)
      @shiftjob6 = FactoryBot.create(:shift, job: @changetissues, shift: @evening)

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