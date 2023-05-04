# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

films = [
  { name: "Forrest Gump", year: 1994},
  { name: "Pulp Fiction", year: 1994},
  { name: "The Matrix", year: 1999},
  { name: "Fight Club", year: 1999},
  { name: "The Silence of the Lambs", year: 1991},
  { name: "Inception", year: 2010},
  { name: "The Prestige", year: 2006},
  { name: "Gladiator", year: 2000},
  { name: "Goodfellas", year: 1990},
  { name: "Titanic", year: 1997},
  { name: "The Terminator", year: 1984},
  { name: "Jurassic Park", year: 1993}
]

films.each do |film|
    Film.create(film)
end