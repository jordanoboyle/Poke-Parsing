# just getting some access to free pokemon api
require "http"

# p pokemon_info.keys

# p pokemon_info["game_indices"]
# p '------'

# p "this is version?"
# p pokemon_info["game_indices"][0]["version"]["name"]

# p '------'

def which_version()
  p "Choose a pokemon: "
  pokemon = gets.chomp.downcase
  pokemon_info = HTTP.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/").parse
  
  
  versions_appeared = []
  pokemon_info["game_indices"].each do |element|
    version = element["version"]["name"]
    versions_appeared << version
  end
  return "#{pokemon.capitalize} appeared in these in: #{versions_appeared.join(", ")}"
end

# p which_version

poke_list = (HTTP.get("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0").parse)["results"].map {|species| species["name"]}
p poke_list


# poke_list["results"]
# i = 0
# while i < poke_list["results"].length
#   species = poke_list["results"]
#   p species[i]["name"]
#   i += 1
# end