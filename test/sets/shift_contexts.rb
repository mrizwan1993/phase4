module Contexts
  module ShiftContexts
    # Context for shifts (assumes contexts for stores, employees)
    def create_shifts
      @basic_shift = FactoryBot.create(:shift, assignment: @assign_cindy)      
      @earlymorning = FactoryBot.create(:shift, assignment: @assign_ed)
      @morning = FactoryBot.create(:shift, assignment: @assign_ed)
      # @afternoon = FactoryBot.create(:shift, assignment: @prmoite_ben)
      @earlyevening = FactoryBot.create(:shift, assignment: @assign_cindy)
      @evening = FactoryBot.create(:shift, assignment: @assign_cindy)
      @night = FactoryBot.create(:shift, assignment: @assign_kathryn)

    end
    
    def remove_shifts
      @earlymorning.destroy
      @morning.destroy
      @afternoon.destroy
      @earlyevening.destroy
      @evening.destroy
      @night.destroy
      @basic_shift.destroy
    end

    def create_additional_shifts

    end

    def remove_additional_shifts

    end

  end
end