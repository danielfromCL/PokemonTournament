class Pokemon
  def initialize(name, hp, att, defe, spatt, spdef, speed)
    @name = name
    @hpmax = hp
    @hp = hp
    @att = att
    @defe = defe
    @spatt = spatt
    @spdef = spdef
    @speed = speed
  end

  attr_reader :hpmax

  attr_reader :hp

  attr_reader :name

  attr_reader :att

  attr_reader :defe

  attr_reader :speed
  
  def to_s
    "#@name #@hp/#@hpmax HP"
  end

  #Checks whether the pokemon's alive or defeated.
  def stillAlive
    @hp > 0
  end

  # Inflicts the amount of damage to a Pokemon's life.
  def damagedBy(dmg)
    puts "#@name took #{dmg} damage."
    @hp = @hp - dmg #it takes the damage
    if @hp < 0 #pokemons can't have negative life
      @hp = 0
    end
    puts "#@name has #@hp life points remaining."
    if not self.stillAlive
      puts "#@name has been defeated!"
    end
  end

  # Recovers the pokemon's HP.
  def recover
    @hp = @hpmax
  end
  
  # The base damage (without regard for type) will be calculated as
  # the attacker's attack stat divided by the defender's defense stat plus 5 
  # of base damage.
  # It's also rounded so that pokemons can't have decimal life points.
  # For attacks that are effective against that type, the damage will be doubled.
  # For attacks that are ineffective against that type, the damage will be halved.
  def attackedByNormal(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByFire(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByWater(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByElectric(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByGrass(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByIce(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByFighting(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByPoison(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByGround(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByFlying(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByPsychic(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByBug(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByRock(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByGhost(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

  def attackedByDragon(pkmn)
    self.damagedBy(((pkmn.att/@defe)+5).round)
  end

end