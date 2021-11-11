require_relative '../Pokemon'
class PsychicPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByPsychic(self)
  end

  #Psychic pokemons are weak against Bug pokemons.
  def attackedByBug(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Psychic pokemons are resistant against Fighting and Psychic pokemons.
  def attackedByFighting(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByPsychic(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  #Psychic pokemons are immune against Ghost pokemons.
  def attackedByGhost(pkmn)
    puts "It doesn't affect #@name."
    self.damagedBy(0)
  end

end