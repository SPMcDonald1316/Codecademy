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