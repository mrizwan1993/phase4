class Flavor < ApplicationRecord
    has_many :store_flavors
    has_many :stores, through: :store_flavors
 
    validates_presence_of :name
    
    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }
    scope :inactive,     -> { where(active: false) }
    
    before_destroy: dont_destroy
    after_rollback :make_inactive
    
    def dont_destroy
        self.errors.add(:base, 'cannot delete a flavor')
        throw(:abort)
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
    

end
