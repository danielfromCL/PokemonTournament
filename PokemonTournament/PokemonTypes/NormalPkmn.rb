require_relative '../Pokemon'
class NormalPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByNormal(self)
  end

  #Normal pokemons are weak against Fighting pokemons.
  def attackedByFighting(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Normal pokemons are immune against Ghost pokemons.
  def attackedByGhost(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

end