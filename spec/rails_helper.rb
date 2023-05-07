require 'database-cleaner'
shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include FactoryBot::syntax::Methods
  config.include FactoryBot::syantax::Methods
  config.before(:suite) do
    Databasecleaner.clean_with(:truncation)
    Databasecleaner.strategy = :truncation
  end

  config.around(:each) do |example|
    Databasecleaner.cleaning do
      example.run
    end
  end
  end
  
