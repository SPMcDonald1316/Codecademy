struct SwiftBank {
  private let password: String

  init(password: String) {
    self.password = password
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    return enteredPassword == self.password
  }
}