module Contexts
  module FlavorContexts
    # Context for flavors 
    def create_flavors
      @strawberry = FactoryBot.create(:flavor, name: "Strawberry", active: true)
      @chocolate = FactoryBot.create(:flavor, name: "Chocolate", active: true)
      @chocolatechip = FactoryBot.create(:flavor, name: "Chocolate Chip", active: true)
      @garlic = FactoryBot.create(:flavor, name: "Garlic", active: false)
      @ginger = FactoryBot.create(:flavor, name: "Ginger", active: false)
      @vanilla = FactoryBot.create(:flavor)
      @caramel = FactoryBot.create(:flavor)
    end
    
    def remove_flavors
      @strawberry.destroy
      @chocolate.destroy
      @chocolatechip.destroy
      @garlic.destroy
      @ginger.destroy
      @vanilla.destroy
      @caramel.destroy
    end

    def create_additional_flavors
      @mintchocolate = FactoryBot.create(:flavor, name: "Mint Chocolate", active: true)
      @phenyle = FactoryBot.create(:flavor, name: "Phenyle", active: false)
      @coffee = FactoryBot.create(:flavor, name: "Coffee", active: true)     
    end

    def remove_additional_flavors
      @mintchocolate.destroy
      @phenyle.destroy
      @coffee.destroy
    end
  end
end