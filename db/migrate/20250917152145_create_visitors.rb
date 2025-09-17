class CreateVisitors < ActiveRecord::Migration[8.0]
  def change
    create_table :visitors do |t|
      t.inet :ip_address, null: false
      t.string :country_code
      t.string :region
      t.string :city
      t.text :user_agent
      t.string :browser_type
      t.string :os_name
      t.string :device_type
      t.timestamps
    end
  end
end
