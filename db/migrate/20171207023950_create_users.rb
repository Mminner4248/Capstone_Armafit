class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.references :gym, foreign_key: true
      t.references :image, foreign_key: true
      t.boolean :coach_auth
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :gender

      t.timestamps
    end
  end
end
