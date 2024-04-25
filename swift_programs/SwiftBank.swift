struct SwiftBank {
  private let password: String
  private var balance: Double = 0
  static let depositBonusRate = 0.01

  init(password: String, initialDeposit: Double) {
    self.password = password
    makeDeposit(depositAmount: initialDeposit)
  }

  private func isValid(_ enteredPassword: String) -> Bool {
    return enteredPassword == self.password
  }

  private func finalDepositWithBonus(deposit: Double) -> Double {
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  mutating func makeDeposit(depositAmount: Double) {
    let depositWithBonus = finalDepositWithBonus(deposit: depositAmount)
    print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus)")
    self.balance += depositWithBonus
  }
}