require 'test_helper'

class StoreFlavorTest < ActiveSupport::TestCase
  should belong_to(:flavor)
  should belong_to(:store)
end
