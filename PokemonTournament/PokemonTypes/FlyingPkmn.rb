require_relative '../Pokemon'
class FlyingPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByFlying(self)
  end

  #Flying pokemons are weak against Electric, Ice and Rock pokemons.
  def attackedByElectric(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByIce(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByRock(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Flying pokemons are resistant against Grass, Fighting and Psychic pokemons.
  def attackedByGrass(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByFighting(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByPsychic(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  #Flying pokemons are immune against Ground pokemons.
  def attackedByGround(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

end