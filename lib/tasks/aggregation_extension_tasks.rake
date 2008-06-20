namespace :radiant do
  namespace :extensions do
    namespace :aggregation do
      
      desc "Runs the migration of the Aggregation extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          AggregationExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          AggregationExtension.migrator.migrate
        end
      end
    
    end
  end
end