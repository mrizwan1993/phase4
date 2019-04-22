require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)

  # # Test basic validations
  should validate_presence_of(:name)

  #   # Establish context
  # # Testing other methods with a context
  context "Creating a context for flavors" do
    # create the objects I want with factories
    setup do 
      create_flavors
    end
    
    # and provide a teardown method as well
    teardown do
      remove_flavors
    end
  
    # now run the tests:
    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "Strawberry", @strawberry.name
      assert @chocolate.active
      assert_equal false, @garlic.active
    end

    # test the scope 'alphabetical'
    should "shows that there are five flavors in alphabetical order" do
      assert_equal ["Chocolate", "Chocolate Chip", "Garlic", "Ginger", "Strawberry"], Flavor.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are three active flavors" do
      assert_equal 3, Flavor.active.size
      assert_equal ["Chocolate", "Chocolate Chip", "Strawberry"], Flavor.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there are two inactive flavors" do
      assert_equal 2, Flavor.inactive.size
      assert_equal ["Garlic", "Ginger"], Flavor.inactive.alphabetical.map{|s| s.name}
    end
  
    #test the make_inactive method
    should "shows that Chocolate is no longer active" do
      @chocolate.make_inactive
      assert_equal false, (@chocolate.active)
    end
    
    #test the rollback callback
    should "make the flavor inactive if tried to delete" do
      @strawberry.destroy
      assert_equal false, (@strawberry.active)
    end
  end
end
