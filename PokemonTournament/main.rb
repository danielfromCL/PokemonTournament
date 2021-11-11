require 'json'
require 'rest-client'
Dir["./PokemonTypes/*.rb"].each {|file| require file }
require_relative './Pokemon'

pkmns = []
puts "Commencing the tournament!"
puts "Presenting all the participants: "
for a in 0..7 do
  x = rand(151)+1
  url = "https://pokeapi.co/api/v2/pokemon/#{x}"

  response = RestClient.get url

  response = RestClient::Request.new(
    :method => :get,
    :url => url
  ).execute

  result = JSON.parse response.to_str

  name = result['forms'][0]['name']
  hp = result['stats'][0]['base_stat']
  attack = result['stats'][1]['base_stat']
  defense = result['stats'][2]['base_stat']
  sp_attack = result['stats'][3]['base_stat']
  sp_defense = result['stats'][4]['base_stat']
  speed = result['stats'][5]['base_stat']
  # I'll consider that pokemons only have one type as a simplification
  type = result['types'][0]['type']['name']

  if type == "bug"
    pkmn = BugPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "dragon"
    pkmn = DragonPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "electric"
    pkmn = ElectricPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "fighting"
    pkmn = FightingPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "fire"
    pkmn = FirePkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "flying"
    pkmn = FlyingPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "ghost"
    pkmn = GhostPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "grass"
    pkmn = GrassPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "ground"
    pkmn = GroundPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "ice"
    pkmn = IcePkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "normal"
    pkmn = NormalPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "poison"
    pkmn = PoisonPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "psychic"
    pkmn = PsychicPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "rock"
    pkmn = RockPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  elsif type == "water"
    pkmn = WaterPkmn.new(name, hp, attack, defense, sp_attack, sp_defense, speed)
  end

  pkmns.append(pkmn)
  puts "Our participant number #{a+1} is a truly formidable foe!"
  puts "#{name}, of the #{type} type, with the following stats: "
  puts "#{hp} HP, #{attack} Att, #{defense} Def, #{sp_attack} Sp_Attack, #{sp_defense} Sp_Defense and #{speed} Speed!"
  

end


# Let's simulate the first round
i = 0
k = 1
puts "COMMENCING THE FIRST ROUND!"
winners = []
while i<=7
  puts "# -------------------------------------------------------------------- #"
  puts " "
  puts "For our match number #{k}, we have: #{pkmns[i]} versus #{pkmns[i+1]}"
  while pkmns[i].stillAlive and pkmns[i+1].stillAlive #While neither has been defeated
    puts "Current life points: #{pkmns[i]}       #{pkmns[i+1]}"
    if pkmns[i].speed >= pkmns[i+1].speed # The faster pokemon attacks first
      puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
      pkmns[i].attack(pkmns[i+1])
      if pkmns[i+1].stillAlive # The second pokemon can attack back
        puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
        pkmns[i+1].attack(pkmns[i])
      end
    else
      puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
      pkmns[i+1].attack(pkmns[i])
      if pkmns[i].stillAlive # The second pokemon can attack back
        puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
        pkmns[i].attack(pkmns[i+1])
      end
    end
  end
  if pkmns[i].stillAlive
    puts "#{pkmns[i].name} has won the battle! It advances to the next round."
    puts "Recovering the participant..."
    pkmns[i].recover
    winners.append(pkmns[i])
    puts "All done! Advancing to the next match..."
  else
    puts "#{pkmns[i+1].name} has won the battle! It advances to the next round."
    puts "Recovering the participant..."
    pkmns[i+1].recover
    winners.append(pkmns[i+1])
    puts "All done! Advancing to the next match..."
  end
  i = i+2
  k = k+1
end

puts "COMMENCING THE SECOND ROUND!"
pkmns = winners
winners2 = []
i=0
while i<=3
  puts "# -------------------------------------------------------------------- #"
  puts " "
  puts "For our match number #{k}, we have: #{pkmns[i]} versus #{pkmns[i+1]}"
  while pkmns[i].stillAlive and pkmns[i+1].stillAlive #While neither has been defeated
    puts "Current life points: #{pkmns[i]}       #{pkmns[i+1]}"
    if pkmns[i].speed >= pkmns[i+1].speed # The faster pokemon attacks first
      puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
      pkmns[i].attack(pkmns[i+1])
      if pkmns[i+1].stillAlive # The second pokemon can attack back
        puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
        pkmns[i+1].attack(pkmns[i])
      end
    else
      puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
      pkmns[i+1].attack(pkmns[i])
      if pkmns[i].stillAlive # The second pokemon can attack back
        puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
        pkmns[i].attack(pkmns[i+1])
      end
    end
  end
  if pkmns[i].stillAlive
    puts "#{pkmns[i].name} has won the battle! It advances to the next round."
    puts "Recovering the participant..."
    pkmns[i].recover
    winners2.append(pkmns[i])
    puts "All done! Advancing to the next match..."
  else
    puts "#{pkmns[i+1].name} has won the battle! It advances to the next round."
    puts "Recovering the participant..."
    pkmns[i+1].recover
    winners2.append(pkmns[i+1])
    puts "All done! Advancing to the next match..."
  end
  i = i+2
  k = k+1
end

puts "AND FINALLY, THE FINAL ROUND!"
puts "Who will be the champion? Let's find out!"
pkmns = winners2
i=0
puts "# -------------------------------------------------------------------- #"
puts " "
puts "For our final match, we have: #{pkmns[i]} versus #{pkmns[i+1]}"
while pkmns[i].stillAlive and pkmns[i+1].stillAlive #While neither has been defeated
  puts "Current life points: #{pkmns[i]}       #{pkmns[i+1]}"
  if pkmns[i].speed >= pkmns[i+1].speed # The faster pokemon attacks first
    puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
    pkmns[i].attack(pkmns[i+1])
    if pkmns[i+1].stillAlive # The second pokemon can attack back
      puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
      pkmns[i+1].attack(pkmns[i])
    end
  else
    puts "#{pkmns[i+1].name} attacked #{pkmns[i].name}"
    pkmns[i+1].attack(pkmns[i])
    if pkmns[i].stillAlive # The second pokemon can attack back
      puts "#{pkmns[i].name} attacked #{pkmns[i+1].name}"
      pkmns[i].attack(pkmns[i+1])
    end
  end
end
if pkmns[i].stillAlive
  puts "Congratulations to #{pkmns[i].name} on winning both the battle and the Tournament!"
else
  puts "Congratulations to #{pkmns[i+1].name} on winning both the battle and the Tournament!"
end
puts "And congratulations to all the participants for a splendid show!"



