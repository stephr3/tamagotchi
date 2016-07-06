require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get('/') do
  @pets = Tamagotchi.all()
  erb(:index)
end

post('/main') do
  name = params.fetch('name')
  @pet = Tamagotchi.new(name)
  @pet.save()
  erb(:main)
end

get('/main') do
  @pets = Tamagotchi.all()
  @pet = @pets[0]
  erb(:main)
end

get('/stats') do
  @pets = Tamagotchi.all()
  @pet = @pets[0]
  @pet.time_passes()
  erb(:stats)
end

get('/feed') do
  @pets = Tamagotchi.all()
  @pet = @pets[0]
  @pet.feed()
  erb(:feed)
end

get('/sleep') do
  @pets = Tamagotchi.all()
  @pet = @pets[0]
  @pet.rest()
  erb(:sleep)
end

get('/play') do
  @pets = Tamagotchi.all()
  @pet = @pets[0]
  @pet.play()
  erb(:play)
end
