struct Exercise {
  var name: String
  var muscleGroups: String
  var reps: Int
  var sets: Int
  var totalReps: Int

  init(name: String, muscleGroups: String, reps: Int, sets: Int) {
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = reps * sets
  }
}