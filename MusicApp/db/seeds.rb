# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
# Album.destroy_all
# Track.destroy_all
# Note.destroy_all

# User
james = User.create!(email: 'james@park.com', password: 'starwars')
juung = User.create!(email: 'jung@park.com', password: 'starwars')

# Band
linkin_park = Band.create!(name: 'Linkin Park')
world_star = Band.create!(name: 'World Star')

# Album
# gonna  = Album.create!(name: 'Gonna be a big A someday!', band: little_as, year: 2017)

# Track
# track1 = gonna.tracks.create!(name: 'Why would I make my own bracket method?', ord: 1, lyrics: 'lalalalala')
# track2 = gonna.tracks.create!(name: 'I am riding the rails of majesty', ord: 2, lyrics: 'rails rails rrrrails')

# Note
# note1 = track1.notes.create!(user: fred, content: 'It\'s better that way')
# note2 = track1.notes.create!(user: daniel, content: 'Can you add some spacing here?')