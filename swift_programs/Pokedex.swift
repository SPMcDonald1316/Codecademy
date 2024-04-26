class Pokemon {
  var num = 0
  var name = ""
  var type = [""]
  var ability = [""]

  init(num: Int, name: String, type: [String], ability = [String]) {
    self.num = num
    self.name = name
    self.type = type
    self.ability = ability
  }
}

var bulbasaur = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass", "Poison"], ability: ["Overgrow"])
var charmander = Pokemon(num: 4, name: "Charmander", type: ["Fire"], ability: ["Blaze"])
var squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water"], ability: ["Torrent"])