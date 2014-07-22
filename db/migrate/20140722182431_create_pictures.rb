class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :gadget, index: true

      t.timestamps
    end
  end
end
