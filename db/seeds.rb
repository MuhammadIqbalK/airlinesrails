# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create([
    {
        name: "Tangguh W",
        email: "tangguh@example.com",
        contact: "0812248293029",
        password: "1234",
        role: 1,
        gender: 1
    }
])