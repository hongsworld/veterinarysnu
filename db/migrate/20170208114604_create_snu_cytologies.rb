class CreateSnuCytologies < ActiveRecord::Migration
  def change
    create_table :snu_cytologies do |t|
      t.datetime	:date
      t.string		:patient_name
      t.string		:patient_id
      t.string		:species
      t.string		:breeds
      t.string		:sex
      t.string		:age
      t.string		:lesion
      t.string		:dx

      t.timestamps null: false
    end
  end
end
