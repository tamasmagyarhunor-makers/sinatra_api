require 'sinatra'

configure :development do
    set :database, {
        adapter: 'postgresql',
        database: ENV['database'],
        username: ENV['user'],
        password: ENV['password']
    }
end

set :database_file, "./config/database.yml"

get '/' do
    'hello'
end

get '/api/cars' do
    @cars = Car.all
    @cars.to_json
end

post '/api/cars' do
    data = JSON.parse request.body.read  
    @car = Car.create(
        make: data['make'],
        model: data['model'],
        fuel_type: data['fuel_type'],
        gearbox: data['gearbox'],
        year: data['year']
    )
   @car.save
   @car.to_json
end

get "/api/cars/:id" do
    @car = Car.find(params[:id])
    @car.to_json
end

put "/api/cars/:id" do
    data = JSON.parse request.body.read  
    @car = Car.find(params[:id])
    @car.update( 
        make: data['make'],
        model: data['model'],
        fuel_type: data['fuel_type'],
        gearbox: data['gearbox'],
        year: data['year']
    )
    @car.save
    @car.to_json
end    

delete "/api/cars/:id" do
    @car = Car.find(params[:id])
    @car.destroy
    @car.to_json
end