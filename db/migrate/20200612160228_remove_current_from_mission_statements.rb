class RemoveCurrentFromMissionStatements < ActiveRecord::Migration[6.0]
  def change
    remove_column :mission_statements, :current, :boolean
  end
end
