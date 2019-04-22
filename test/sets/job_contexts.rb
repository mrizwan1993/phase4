module Contexts
  module JobContexts
    # Context for jobs 
    def create_jobs
      @mopfloors = FactoryBot.create(:job, name: "Mop Floors", description: "Mop all the floors in the building", active: true)
      @cleanmachines = FactoryBot.create(:job, name: "Clean the Machines", description: "Clean all the machines in the store", active: false)
      @eatgarbage = FactoryBot.create(:job, name: "Eat Garbage", description: "Become the waste disposal", active: false)
      @changetissues = FactoryBot.create(:job, name: "Change Tissues", description: "Change the tissues in the boxes", active: true)
    end
    
    def remove_jobs
      @mopfloors.destroy
      @cleanmachines.destroy
      @eatgarbage.destroy
      @changetissues.destroy
    end

    def create_additional_jobs
    end

    def remove_additional_jobs
    end
  end
end