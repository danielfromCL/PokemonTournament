require_relative '../Pokemon'
class IcePkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByIce(self)
  end

  #Ice pokemons are weak against Fire, Fighting and Rock pokemons.
  def attackedByFire(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByFighting(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  def attackedByRock(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Ice pokemons are resistant against Ice pokemons.
  def attackedByIce(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end
end
