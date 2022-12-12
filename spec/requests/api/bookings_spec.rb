require 'swagger_helper'

RSpec.describe 'api/bookings', type: :request do
  path '/users/1/bookings' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
    let(:user_id) { User.create(name: 'username').id }
    let(:doctor) do
      Doctor.create(first_name: 'doctor',
                    last_name: 'name',
                    city: 'city',
                    phone: 233_449_989,
                    email: 'e.@gmailcom',
                    bio: 'doctor bio',
                    specialization: 'special dentist',
                    photo: 'picture')
    end
    post('create booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          time: { type: :string },
          city: { type: :string },
          disease_desc: { type: :string },
          doctor_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[date city]
      }

      response '201', 'booking created' do
        let(:booking) do
          {
            date: '2021-12-02',
            time: '11:00',
            city: 'London',
            doctor_id: doctor.id,
            disease_desc: 'some disease desctiptions',
            user_id:
          }
        end

        run_test!
      end
      response '422', 'booking must be valid' do
        let(:booking) { { date: '2021-12-02' } }
        let(:user_id) { 1 }
        run_test!
      end
    end

    get('list bookings') do
      tags 'Bookings'
      produces 'application/json'
      response(200, 'successful') do
        let(:user_id) { 1 }
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   date: { type: :date },
                   time: { type: :text },
                   city: { type: :string },
                   disease_desc: { type: :text },
                   doctor_id: { type: :integer },
                   user_id: { type: :integer }
                 }
               }

        run_test!
      end
    end
  end
end
