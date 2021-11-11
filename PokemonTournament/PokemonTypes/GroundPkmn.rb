require_relative '../Pokemon'
class GroundPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByGround(self)
  end

  #Ground pokemons are weak against Water, Grass and Ice pokemons.
  def attackedByWater(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByGrass(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByIce(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Ground pokemons are resistant against Poison and Rock pokemons.
  def attackedByPoison(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByRock(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  #Ground pokemons are immune against Electric pokemons.
  def attackedByElectric(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

end