class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni

      t.timestamps
    end
  end
end
