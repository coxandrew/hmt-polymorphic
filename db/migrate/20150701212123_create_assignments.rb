class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :task, index: true, foreign_key: true
      t.references :target, index: true, foreign_key: true
      t.string :target_type
    end
  end
end
