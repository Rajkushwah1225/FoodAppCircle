require 'rails_helper'
RSpec.describe Cuisine ,type: :model do
    it{should_validate_presence_of(:name)}
end