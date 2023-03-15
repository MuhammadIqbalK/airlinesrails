# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

<<<<<<< Updated upstream

User.create([

{
 "name" => "Tangguh",
 "email" => "tangguh@gmail.com",
 "password" => "12345678",
 "contact" => "08731212312",
 "gender" => 1,
 "role" => 1

},

{
 "name" => "widodo",
 "email" => "widodo@gmail.com",
 "password" => "12345678",
 "contact" => "083166166381",
 "gender" => 1,
 "role" => 2
    
},

{
 "name" => "iqbal",
 "email" => "iqbal@gmail.com",
 "password" => "12345678",
 "contact" => "0863716317381",
 "gender" => 1,
 "role" => 1
        
},

{
 "name" => "maulana",
 "email" => "maulana@gmail.com",
 "password" => "12345678",
 "contact" => "08736466616172",
 "gender" => 1,
  "role" => 2
            
  }

])

Airport.create([

    {
     "name" => "Bandara Ngurah rai",
     "city" => "Denpasar"
    },
    
    {
     "name" => "Bandara Juanda",
     "city" => "Surabay"
    },
    
    {
     "name" => "Bandara Adisucipto",
     "city" => "Yogyakarta"
    },
    
    {
     "name" => "Bandara soekarno-hatta",
     "city" => "jakarta"
                
      }
    
    ])

    Airline.create([

 {
  "name" => "Sriwijaya Air",
  "code" => "SJ"
 },
        
 {
   "name" => "Lion Air",
   "code" => "JT"
 },
        
 {
    "name" => "Batik Air",
    "code" => "ID"
 },
        
 {
  "name" => "Citilink",
  "code" => "QG"
                    
 }
        
 ])

  Flight.create([

 {
     "departure_airport" => 2,
     "arrival_airport" => 1,
     "departure_time" => null,
     "arrival_time" => null,
     "airline_id" => 2,
     "price" => 130000,
     "created_by" => 1
 },

 {
    "departure_airport" => 3,
    "arrival_airport" => 2,
    "departure_time" => null,
    "arrival_time" => null,
    "airline_id" => 1,
    "price" => 160000,
    "created_by" => 3
},           


  ])


  Ticket.create([

    {
       "total_passenger" => 100,
       "flight_id" => 1
       "user_id" => 2
    },
   
    {
        "total_passenger" => 200,
        "flight_id" => 2
        "user_id" => 4
     },
         
   
   
     ])