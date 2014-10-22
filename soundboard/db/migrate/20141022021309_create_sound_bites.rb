class CreateSoundBites < ActiveRecord::Migration
  def change
    create_table :sound_bites do |t|
      t.string :title
      t.string :transcript
      t.integer :length
      t.binary :audiofile
      t.datetime :recording_date

      t.timestamps
    end
  end
end
