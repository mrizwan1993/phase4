class StoreFlavor < ApplicationRecord
    belongs_to :flavor
    belongs_to :store
end
