class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :sc_user_name
      t.string :sc_user_id

      t.timestamps
    end
  end
end
