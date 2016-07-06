require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end

  describe('#initialize') do
    it('sets name and life levels of new pet') do
      test_tama = Tamagotchi.new('Bob')
      expect(test_tama.name()).to(eq('Bob'))
      expect(test_tama.food_level()).to(eq(10))
      expect(test_tama.sleep_level()).to(eq(10))
      expect(test_tama.activity_level()).to(eq(10))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a new pet to the array of pets') do
      test_tama = Tamagotchi.new('Sally')
      test_tama.save()
      expect(Tamagotchi.all()).to(eq([test_tama]))
    end
  end

  describe('.clear') do
    it('empties out the saved pets') do
      Tamagotchi.new('Bob').save()
      Tamagotchi.clear()
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe('#is_alive') do
    it('is alive if food, sleep, and activity level is over 0') do
      test_tama = Tamagotchi.new('Bob')
      expect(test_tama.is_alive()).to(eq(true))
    end

    it('is dead if the food, sleep, and activity level is 0') do
      test_tama = Tamagotchi.new('Bob')
      test_tama.set_food_level(0)
      expect(test_tama.is_alive()).to(eq(false))
    end
  end

  describe('#time_passes') do
    it('decreases food, sleep, and activity level by 1') do
      test_tama = Tamagotchi.new('Bob')
      test_tama.time_passes
      expect(test_tama.food_level()).to(eq(10))
      expect(test_tama.sleep_level()).to(eq(10))
      expect(test_tama.activity_level()).to(eq(10))
    end
  end

  describe('#feed') do
    it('increases food level by 1') do
      test_tama = Tamagotchi.new('Gus')
      test_tama.set_food_level(8)
      test_tama.feed()
      expect(test_tama.food_level()).to(eq(9))
    end
  end

  describe('#rest') do
    it('increases sleep level by 1') do
      test_tama = Tamagotchi.new('Gus')
      test_tama.set_sleep_level(8)
      test_tama.rest()
      expect(test_tama.sleep_level()).to(eq(9))
    end
  end

  describe('#play') do
    it('increases activity level by 1') do
      test_tama = Tamagotchi.new('Gus')
      test_tama.set_activity_level(8)
      test_tama.play()
      expect(test_tama.activity_level()).to(eq(9))
    end
  end
end
