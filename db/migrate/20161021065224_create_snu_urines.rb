class CreateSnuUrines < ActiveRecord::Migration
  def change
    create_table :snu_urines do |t|
      t.datetime	:date
      t.string		:patient_name
      t.string		:patient_id
      t.string		:species
      t.string		:breeds
      t.string		:sex
      t.string		:age
      t.string		:color
      t.string		:turbidity
      t.string		:dx_type

      t.timestamps null: false
    end
  end
end
