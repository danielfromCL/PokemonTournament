require_relative '../Pokemon'
class RockPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByRock(self)
  end

  #Rock pokemons are weak against Water, Grass, Fighting and Ground pokemons.
  def attackedByWater(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByGrass(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByFighting(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByGround(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Rock pokemons are resistant against Normal, Fire, Poison and Flying pokemons.
  def attackedByNormal(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByFire(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByPoison(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByFlying(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

end
  