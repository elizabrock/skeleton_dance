class CreateBones < ActiveRecord::Migration
  def change
    create_table :bones do |t|
      t.string :name
    end
  end
end
