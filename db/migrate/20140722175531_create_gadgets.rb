class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name
      t.belongs_to :user
      t.text :description

      t.timestamps
    end
  end
end
