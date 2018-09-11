class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    @speed = 0
    @strength = 0

    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end

    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def encounter
    your_speed = rand(@@max_speed+1)
    your_strength = rand(@@max_strength+1)

    if(outrun_zombie?(your_speed))
      puts "You escaped unscathe!"
    elsif (survive_attack?(your_strength))
      puts "You beat the zombie but it bit you so you became a zombie"
    else
      puts "You died"
    end
  
  end

  def outrun_zombie?(speed)
    if speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?(strength)
    if strength > @strength
      return true
    else
      return false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    self.some_die_off()
    self.spawn()
    self.increase_plage_level()
  end

  def self.some_die_off()
    #repeat the loop 0 to 10 times
    rand(11).times do |iteration|
      @@horde.delete_at(rand(@@horde.size)) ##delete a random element (zombie) from array
    end
  end

  def self.spawn()
    number_of_zombies = rand(@@plague_level+1)

    number_of_zombies.times do |zombie_number|
      @@horde << Zombie.new(rand(@@max_speed+1), rand(@@max_strength+1))
    end
  end

  def self.increase_plage_level
    @@plague_level += rand(3)
  end

end

puts"-----"
Zombie.new_day()
p Zombie.all().length
puts"-----"
Zombie.new_day()
p Zombie.all().length
puts"-----"
Zombie.new_day()
p Zombie.all().length
puts"-----"
