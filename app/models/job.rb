class Job < ApplicationRecord
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    validates_presence_of :name
    
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    
    
    before_destroy :destroy_or_not
    after_rollback :make_inactive
    
    def destroy_or_not
        if worked_on?
            self.errors.add([:base], "cannot 
            delete a job if an employee has 
            worked on it")
            throw(:abort)
        end
    end
    
    def worked_on?
        self.shift_jobs.size > 0
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
  
end