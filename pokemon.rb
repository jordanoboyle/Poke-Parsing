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

