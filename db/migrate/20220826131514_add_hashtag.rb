class AddHashtag < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags do |table_1|
      table_1.string :name
    end

    add_index :hashtags, :name, unique: true

    create_table :question_hashtags do |table_2|
      table_2.references :question, null: false, foreign_key: true
      table_2.references :hashtag, null: false, foreign_key: true
    end
  end
end
