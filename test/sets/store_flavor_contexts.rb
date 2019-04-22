module Contexts
  module StoreFlavorContexts
    # Context for flavors 
    def create_flavors
      @storeflavor1 = FactoryBot.create(:flavor, name: "Strawberry", active: true)
      @storeflavor2 = FactoryBot.create(:flavor, name: "Chocolate", active: true)
      @storeflavor3 = FactoryBot.create(:flavor, name: "Chocolate Chip", active: true)
      @storeflavor4 = FactoryBot.create(:flavor, name: "Garlic", active: false)
      @storeflavor5 = FactoryBot.create(:flavor, name: "Ginger", active: false)
    end
    
    def remove_flavors
      @storeflavor1.destroy
      @storeflavor2.destroy
      @storeflavor3.destroy
      @storeflavor4.destroy
      @storeflavor5.destroy
    end

    def create_additional_flavors
 
    end

    def remove_additional_flavors

    end
  end
end