class AddUserToBands < ActiveRecord::Migration[5.0]
  def change
    add_reference :bands, :user, index: true
  end
end
