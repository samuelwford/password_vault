require 'csv'

namespace :import do
  desc "Import CSV to Accounts"
  task :csv => :environment do
    CSV.foreach('accounts.csv', :headers => true) do |row|
      Account.import!(row.to_hash)
    end
  end
end
