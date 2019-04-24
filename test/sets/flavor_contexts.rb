module Contexts
  module FlavorContexts
    # Context for flavors 
    def create_flavors
      @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: true)
      @chocolate = FactoryBot.create(:flavor, name: "Chocolate", active: true)
      @chocolatechip = FactoryBot.create(:flavor, name: "Chocolate Chip", active: true)
      @garlic = FactoryBot.create(:flavor, name: "Garlic", active: false)
      @ginger = FactoryBot.create(:flavor, name: "Ginger", active: false)
    end
    
    def remove_flavors
      @strawberry.destroy
      @chocolate.destroy
      @chocolatechip.destroy
      @garlic.destroy
      @mintchocolate.destroy
    end

    def create_additional_flavors
 
    end

    def remove_additional_flavors

    end
  end
end