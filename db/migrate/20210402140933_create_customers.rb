class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
