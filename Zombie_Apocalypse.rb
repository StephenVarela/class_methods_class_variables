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
      puts "You are now a zombie"
      @@horde << Zombie.new(rand(@@max_speed+1), rand(@@max_strength+1))
      puts
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



puts "---------------Starting Game---------------------"
Zombie.new_day
day1 = Zombie.all
puts "There are #{day1.size} zombies at the start of day 1"
day1.each do |zombie|
  puts zombie.encounter
end
end_day1 = Zombie.all
puts "There are #{end_day1.size} zombies at the end of day 1"

puts "---------------End Game---------------------"

#
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
# puts zombie1.encounter # You are now a zombie
# puts zombie2.encounter # You died
# puts zombie3.encounter # You died
# Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
# puts zombie1.encounter # You got away
# puts zombie2.encounter # You are now a zombie
# puts zombie3.encounter # You died
