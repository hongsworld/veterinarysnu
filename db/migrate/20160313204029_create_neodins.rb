class CreateNeodins < ActiveRecord::Migration
  def change
    create_table :neodins do |t|
      t.datetime	:in_date
      t.datetime	:out_date
      t.string		:hospital
      t.string		:patient_name
      t.string		:species
      t.string		:breeds
      t.string		:sex
      t.string		:age
      t.string		:site
      t.string		:macro
      t.timestamps null: false
    end
  end
end
