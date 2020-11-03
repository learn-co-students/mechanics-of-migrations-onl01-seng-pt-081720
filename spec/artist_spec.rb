require_relative './spec_helper'

describe "Artist" do
  let(:artist) {Artist.new(name: 'Justice', genra: 'Electronic', age: Time.now.strftime("%Y").to_i - 2003, hometown: "Paris")}

  it "can instantiate a new instance" do
    expect(Artist.new.is_a?(Object)).to eq(true)
  end

  it "can instantiate with a name, genre, age and hometown" do

    expect(artist.name).to eq("Justice")
    expect(artist.genra).to eq("Electronic")
    expect(artist.age).to eq(Time.now.strftime("%Y").to_i - 2003)
    expect(artist.hometown).to eq("Paris")
  end

  it "can be saved to the database" do
    artist.genra = "Electronic"

    expect(artist.save).to eq(true)
  end

  it "can instantiate and save at the same time with create" do
    artist = Artist.create(name: 'Justice', genra: "Electronic", age: Time.now.strftime("%Y").to_i - 2003, hometown: "Paris")

    expect(Artist.all.last.name).to eq("Justice")
  end

  it "can find an Artist by name" do
    weeknd = Artist.create(name: 'The Weeknd', genra: "Alternative R&B", age: Time.now.strftime("%Y").to_i - 2010, hometown: "Toronto")
    taytay = Artist.create(name: 'Taylor Swift', genra: "Pop / Country", age: Time.now.strftime("%Y").to_i - 2006, hometown: "Reading")
    queen = Artist.create(name: 'Queen', genra: "Rock", age: Time.now.strftime("%Y").to_i - 1973, hometown: "London")

    expect(Artist.find_by(name: "Taylor Swift")).to eq(taytay)
  end

  context "after applying a `db:rollback` command that removes the favorite_food attribute" do
   it "no longer has a favorite_food column in the 'artists' table" do
      expect(Artist.column_names).to eq(["id", "name", "genra", "age", "hometown"])
    end
  end
end
