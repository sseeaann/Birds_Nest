class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_street
      t.string :address_apt
      t.string :address_city
      t.string :address_state
      t.integer :address_zip
      t.integer :phone
      t.string :email
      t.references :user, index: true

      t.timestamps
    end
  end
end
