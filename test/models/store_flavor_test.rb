require 'test_helper'

class StoreFlavorTest < ActiveSupport::TestCase
  should belong_to(:flavor)
  should belong_to(:store)
  

  context "Creating a context for store_flavors" do
  # create the objects I want with factories
    setup do
      @teststore=FactoryBot.create(:store)
      @testflavor=FactoryBot.create(:flavor, name:"Test Flavor", active: true)
      @teststoreflavor=FactoryBot.create(:store_flavor, store: @teststore, flavor: @testflavor)
    end
    
    # and provide a teardown method as well
    teardown do
      @teststoreflavor.destroy
      @testflavor.destroy
      @teststore.destroy
    end
    
    
        # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal @teststore, @teststoreflavor.store
      assert_equal "Test Flavor", @teststoreflavor.flavor.name
      assert_equal true, @teststoreflavor.flavor.active
    end
  end
  
  
end
