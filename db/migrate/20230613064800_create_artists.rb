class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :celebname
      t.string :genre
      t.string :production

      t.timestamps
    end
  end
end
