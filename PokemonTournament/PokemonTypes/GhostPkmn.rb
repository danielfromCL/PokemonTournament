require_relative '../Pokemon'
class GhostPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByGhost(self)
  end

  #Ghost pokemons are weak against Ghost pokemons.
  def attackedByGhost(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Ghost pokemons are resistant against Poison and Bug pokemons.
  def attackedByPoison(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByBug(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  #Ghost pokemons are immune against Normal and Fighting pokemons.
  def attackedByNormal(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

  def attackedByFighting(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

end