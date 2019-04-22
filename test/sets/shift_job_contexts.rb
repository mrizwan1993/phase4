module Contexts
  module ShiftJobContexts
    # Context for shifts (assumes contexts for stores, employees)
    def create_shifts
      @earlymorning = FactoryBot.create(:shift, date: 10.days.from_now, start_time: 15.hours.ago, end_time: 1.hour.from_now)
      @morning = FactoryBot.create(:shift, date: 8.days.from_now, start_time: 8.hours.ago, end_time: 2.hours.from_now)
      @afternoon = FactoryBot.create(:shift, date: 6.days.from_now, start_time: 6.hours.ago, end_time: 4.hours.from_now)
      @earlyevening = FactoryBot.create(:shift, date: 4.days.from_now, start_time: 4.hours.ago, end_time: 6.hours.from_now)
      @evening = FactoryBot.create(:shift, date: 2.days.from_now, start_time: 2.hours.ago, end_time: 8.hours.from_now)
      @night = FactoryBot.create(:shift, date: 1.day.from_now, start_time: 1.hours.ago, end_time: 10.hours.from_now)

    end
    
    def remove_shifts
      @earlymorning.destroy
      @morning.destroy
      @afternoon.destroy
      @earlyevening.destroy
      @evening.destroy
      @night.destroy
    end

    def create_additional_shifts

    end

    def remove_additional_shifts

    end

  end
end