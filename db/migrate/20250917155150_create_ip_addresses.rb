class CreateIpAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :ip_addresses do |t|
      t.inet :ip_address, null: false
      t.string :country_code
      t.string :region
      t.string :city
      t.timestamps
    end
  end
end
