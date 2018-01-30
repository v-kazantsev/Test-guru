class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.text :gist_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
