class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.string :name
      t.string :unit,     default: 'd'
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :timers, :date
  end
end
