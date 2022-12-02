# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#Doctors first_name last_name specilization phone email city bio photo
#Booking datetime city doctor_id user_id disease_desc
#User name email 

user1 = User.create(name: "John")
user2 = User.create(name: "Alexa")

doctor1 = Doctor.create(first_name: "John", last_name: "Doe", specialization: "Cardiologist", phone: 123456789, email: "johndoe@gmail.com", city: "London", bio: "I am a cardi", photo: "https://pngimg.com/uploads/doctor/doctor_PNG16010.png")
doctor2 = Doctor.create(first_name: "Alexa", last_name: "Smith", specialization: "Dentist", phone: 123456789, email: "smith@gmail.com", city: "London", bio: "I am a dentist", photo: "https://pngimg.com/uploads/doctor/doctor_PNG15972.png")

booking1 = Booking.create(date: "2021-12-02", time: "10:00", city: "London", disease_desc: "I have a headache", user_id: user1.id, doctor_id: doctor1.id)
booking2 = Booking.create(date: "2021-12-02", time: "11:00", city: "London", disease_desc: "I have a fever", user_id: user2.id, doctor_id: doctor2.id)