class Trip < ApplicationRecord
  self.table_name = 'TRIPS_FOR_USE'
  self.primary_key = :trip_id
end
