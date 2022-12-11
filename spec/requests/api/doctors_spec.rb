require 'swagger_helper'

RSpec.describe 'api/doctors', type: :request do
  
    path '/doctors' do

        post 'Creates a doctor' do
          tags 'Doctors'
          consumes 'application/json'
          parameter name: :doctor, in: :body, schema: {
            type: :object,
            properties: {
              first_name: { type: :string },
              last_name: { type: :string },
              city: { type: :string },
              phone: { type: :integer },
              email: { type: :string },
              bio: { type: :string },
              specialization: { type: :string },
              photo: { type: :string }
            },
            required: [ 'first_name', 'email' ]
          }
    
          response '201', 'doctor created' do
            let(:doctor) { 
                { 
                 first_name: 'Doctor1',
                 last_name: 'Doctor Name',
                 city: 'Berlin',
                 phone: 132445545,
                 email: 'doc@gmail.com',
                 bio: 'I am a doctor',
                 specialization: 'dentist',
                 photo: 'picture',
                 } }
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:doctor) { { first_name: 'doctor' } }
            run_test!
          end
        end

        get 'List All doctors' do
            tags 'Doctors'
            consumes 'application/json'
            response '200', 'doctors displayed' do
              run_test!
            end
          end
        
    end

    path '/doctors/{id}' do

        get 'Retrieves a doctor' do
          tags 'Doctors', 'Another Tag'
          produces 'application/json', 'application/xml'
          parameter name: :id, in: :path, type: :string
    
          response '200', 'doctor found' do
            schema type: :object,
            properties: {
                first_name: { type: :string },
                last_name: { type: :string },
                city: { type: :string },
                phone: { type: :integer },
                email: { type: :string },
                bio: { type: :string },
                specialization: { type: :string },
                photo: { type: :string }
              },
              required: [ 'email', 'first_name', 'last_name' ]
    
            let(:id) { Doctor.create(first_name: 'foo',
                 last_name: 'bar',
                 city: 'city',
                 phone: 233449989,
                 email: 'e.@gmailcom',
                 bio: 'doctor bio',
                 specialization: 'special dentist',
                 photo: 'picture',

                ).id }
            run_test!
          end
    
          response '404', 'doctor not found' do
            let(:id) { 'invalid' }
            run_test!
          end
        end

        delete 'Delete a doctor' do
            tags 'Doctors', 'Another Tag'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :string
      
            response '200',  'doctor deleted' do
        
              let(:id) { Doctor.create(first_name: 'foo',
                   last_name: 'bar',
                   city: 'city',
                   phone: 233449989,
                   email: 'e.@gmailcom',
                   bio: 'doctor bio',
                   specialization: 'special dentist',
                   photo: 'picture',
  
                  ).id }
              run_test!
            end
      
            response '404', 'blog not found' do
              let(:id) { 'invalid' }
              run_test!
            end
          end
      end
      
      
end
