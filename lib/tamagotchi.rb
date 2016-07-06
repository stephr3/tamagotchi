require('pry')
class Tamagotchi
  @@all_pets = []

  define_method(:initialize) do |name|
    @name = name
    @timestarted = Time.new
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:is_alive) do
    (@food_level > 0 ? true : false) && (@sleep_level > 0 ? true : false) && (@activity_level > 0 ? true : false)
  end

  define_method(:set_food_level) do |food|
    @food_level = food
  end

  define_method(:set_sleep_level) do |rest|
    @sleep_level = rest
  end

  define_method(:set_activity_level) do |activity|
    @activity_level = activity
  end

  define_method(:time_passes) do
    timenow = Time.new
    timestarted = @timestarted
    time_elapsed_min = ((timenow - timestarted)).floor()
      new_food_level = (@food_level -= ((time_elapsed_min).floor()))
      self.set_food_level(new_food_level)
      new_sleep_level = (@sleep_level -= ((time_elapsed_min).floor()))
      self.set_sleep_level(new_sleep_level)
      new_activity_level = (@activity_level -= ((time_elapsed_min).floor()))
      self.set_activity_level(new_activity_level)
    @timestarted = Time.new
  end

  define_method(:feed) do
    @food_level += 1
  end

  define_method(:rest) do
    @sleep_level += 1
  end

  define_method(:play) do
    @activity_level += 1
  end

  define_singleton_method(:all) do
    @@all_pets
  end

  define_method(:save) do
    @@all_pets.push(self)
  end

  define_singleton_method(:clear) do
    @@all_pets = []
  end
end
