class AddStatesToProfile < ActiveRecord::Migration
  def change
    add_column :mentee_profiles, :snapshot_state, :string
    add_column :mentee_profiles, :develop_state, :string
    add_column :mentee_profiles, :lifelist_state, :string
  end
end
