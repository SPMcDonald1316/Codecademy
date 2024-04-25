struct SwiftBank {
  private let password: String
  private var balance: Double = 0
  static let depositBonusRate = 0.01

  init(password: String) {
    self.password = password
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    return enteredPassword == self.password
  }

  private func finalDepositWithBonus(deposit: Double) -> Double {
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }
}