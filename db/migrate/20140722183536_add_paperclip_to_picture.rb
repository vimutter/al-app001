class AddPaperclipToPicture < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.attachment :image
    end
  end
end
