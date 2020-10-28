class CreateArtists < ActiveRecord::Migration[5.2]
    # defines the code to execute when migration is run (do)

    def change
        create_table :artists do |t|
            t.string :name
            t.string :genre
            t.integer :age
            t.string :hometown
        end
    end

    def up
    end
   
    # define the code to execute when migration is rolled bacxk (undo)
    def down
    end
  end