require_relative '../Pokemon'
class ElectricPkmn < Pokemon
  #Making use of double dispatch for attacking
  def attack(pkmn)
    pkmn.attackedByElectric(self)
  end

  #Electric pokemons are weak against Ground pokemons.
  def attackedByGround(pkmn)
    puts "It's very effective!"
    self.damagedBy((((pkmn.att/@defe)+5)*2).round)
  end

  #Electric pokemons are resistant against Electric and Flying pokemons.
  def attackedByElectric(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end

  def attackedByFlying(pkmn)
    puts "It's not very effective..."
    self.damagedBy((((pkmn.att/@defe)+5)*0.5).round)
  end
end