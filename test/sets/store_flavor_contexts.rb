module Contexts
  module StoreFlavorContexts
    # Context for flavors 
    def create_store_flavors
      @storeflavor1 = FactoryBot.create(:store_flavor, flavor: @strawberry, store: @cmu)
      @storeflavor2 = FactoryBot.create(:store_flavor, flavor: @strawberry, store: @oakland)
      @storeflavor3 = FactoryBot.create(:store_flavor, flavor: @strawberry, store: @hazelwood)
    end
    
    def remove_store_flavors
      @storeflavor1.destroy
      @storeflavor2.destroy
      @storeflavor3.destroy
    end

    def create_additional_store_flavors
 
    end

    def remove_additional_store_flavors

    end
  end
end