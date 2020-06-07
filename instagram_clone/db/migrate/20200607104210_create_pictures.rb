class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    drop_table :pictures
    create_table :pictures do |t|
      t.string :text

      t.timestamps
    end
  end
end
