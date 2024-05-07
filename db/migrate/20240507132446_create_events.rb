class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :starting
      t.text :description

      t.timestamps
    end
  end
end
