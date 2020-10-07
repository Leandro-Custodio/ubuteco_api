class CreateWineStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :wine_styles do |t|
      t.string :name
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :wine_styles, :deleted_at
  end
end
