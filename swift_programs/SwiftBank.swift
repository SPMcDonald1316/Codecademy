struct SwiftBank {
  private let password: String
  private var balance: Double = 0 {
    didSet {
      if balance < 100 { displayLowBalanceMessage() }
    }
  }
  private var firstThousandDeposit = true
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

  private func displayLowBalanceMessage() {
    print("Alert: Your balance is under $100")
  }

  mutating func makeDeposit(depositAmount: Double) {
    if depositAmount > 0 {
      if depositAmount >= 1000 && firstThousandDeposit {
        let depositWithBonus = finalDepositWithBonus(deposit: depositAmount)
        print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus)")
        balance += depositWithBonus
        firstThousandDeposit = false
      } else {
        print("Making a deposit of $\(depositAmount)")
        balance += depositAmount
      }
    } else {
      print("Error: Invalid deposit amount.")
      return
    }
  }

  func displayBalance(password: String) {
    if isValid(password) {
      print("Your current balance is $\(balance)")
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    }
  }

  mutating func makeWithdrawal(withdrawalAmount: Double, password: String) {
    if isValid(password) {
      if withdrawalAmount > 0 && withdrawalAmount < balance {
        balance -= withdrawalAmount
        print("Making a $\(withdrawalAmount) withdrawal.")
      } else {
        print("Error: Invalid withdrawal amount.")
      }
    } else {
      print("Error: Invalid password. Cannot retrieve balance.")
      return
    }
  }
}

// Test code
var myAccount = SwiftBank(password: "password", initialDeposit: 500.00)
myAccount.makeDeposit(depositAmount: 50)

// password validation
myAccount.makeWithdrawal(withdrawalAmount: 100, password: "hello")
myAccount.makeWithdrawal(withdrawalAmount: 100, password: "password")
myAccount.displayBalance(password: "password")