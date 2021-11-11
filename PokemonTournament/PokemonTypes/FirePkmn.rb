require_relative '../Pokemon'
class FirePkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByFire(self)
  end

  #Fire pokemons are weak against Water, Ground and Rock pokemons.
  def attackedByWater(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByGround(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByRock(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end
  #Fire pokemons are resistant against Bug, Grass and Fire pokemons.
  def attackedByBug(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByGrass(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByFire(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end
end
