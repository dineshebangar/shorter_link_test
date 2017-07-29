class AddBitCodeToChallenges < ActiveRecord::Migration[5.1]
  def change
  	add_column :challenges , :bit_code , :string
  end
end
