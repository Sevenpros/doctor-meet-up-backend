require 'swagger_helper'


RSpec.describe 'Bookings', type: :request do
 # initialize test data
 let(:user) { User.create(name: 'name') }
 let(:doctor) { Doctor.create(
    first_name: 'foo',
    last_name: 'bar',
    city: 'city',
    phone: 233449989,
    email: 'e.@gmailcom',
    bio: 'doctor bio',
    specialization: 'special dentist',
    photo: 'picture',
 )}

 let(:booking) { Booking.create(
    date: '2021-12-02',
    time: '11:00',
    city: 'London',
    doctor_id: doctor.id,
    disease_desc: 'some disease desctiptions',
    user_id: user.id,
 )}
 #
 # Test suite for POST /category
 describe 'POST /booking' do
   context 'when the request is valid' do
     before { post "/users/#{user.id}/bookings", params: {
        booking: {
            date: '2021-12-02',
            time: '11:00',
            city: 'London',
            doctor_id: doctor.id,
            disease_desc: 'some disease desctiptions',
            user_id: user.id,
           }
     }}
     it 'creates a booking' do
       expect(JSON.parse(response.body)).to include('city')
     end
     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end
   #Test suite for GET /category
    describe 'GET /categories' do
      # make HTTP get request before each example'
      before { post "/users/#{user.id}/bookings", params: {
        booking: {
            date: '2021-12-02',
            time: '11:00',
            city: 'London',
            doctor_id: doctor.id,
            disease_desc: 'some disease desctiptions',
            user_id: user.id,
           }
     }}
      before { get "/users/#{user.id}/bookings" }
      it 'returns bookings' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(1)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

 end
end