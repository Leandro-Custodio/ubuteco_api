class AddOrganizationToFoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :foods, :organization, foreign_key: true, on_delete: :cascade
  end
end
