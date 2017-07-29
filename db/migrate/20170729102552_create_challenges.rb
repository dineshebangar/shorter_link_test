class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :url
      t.integer :count , :default => 0

      t.timestamps
    end
  end
end
