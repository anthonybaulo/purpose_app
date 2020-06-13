class CreateMissionStatements < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_statements do |t|
      t.text :content
      t.boolean :public,  default: false
      t.boolean :current, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mission_statements, [:user_id, :created_at]
  end
end
