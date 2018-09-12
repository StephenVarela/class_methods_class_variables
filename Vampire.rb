class Vampire
@@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = true
  end

  def in_coffin
    return @in_coffin
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def in_coffin=(in_coffin)
    @in_coffin = in_coffin
  end

  def drank_blood_today=(drank_blood_today)
    @drank_blood_today = drank_blood_today
  end

  def self.create(name, age)
    vamp = Vampire.new(name,age)
    @@coven << vamp
    return vamp
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def self.sunrise
    @@coven.delete_if do |vampire|
      if (!vampire.drank_blood_today || !vampire.in_coffin)
        p "#{vampire} died!"
        true
      end
    end
    return @@coven
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin=(false)
      vampire.drank_blood_today=(false)
    end
    return @@coven
  end

end

##testing functions
stephen = Vampire.create('Stephen', 25)
simonne = Vampire.create('Simonne', 21)
puts "-------CREATING VAMPIRES----------"
p stephen
p simonne

puts ("-------SUNSET--------")
p Vampire.sunset

puts ("-------Someone Drinks Blood and goes home--------")
simonne.drink_blood
simonne.go_home
puts ("-------SUNRISE--------")
p Vampire.sunrise
puts "We can see that the other vampire died"

puts ("-------SUNSET--------")
p Vampire.sunset
puts ("-------SUNRISE--------")
p Vampire.sunrise
puts "The other vampire also died"
