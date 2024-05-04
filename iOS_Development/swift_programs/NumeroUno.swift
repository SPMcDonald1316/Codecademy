enum ProductType: String, CaseIterable {
  case aceRepository = "Ace Repository"
  case dealForcer = "Deal Forcer"
  case kadencePlanner = "Kadence Planner"
  case mailCannon = "Mail Cannon"

  func displayProductOfferings() {
    print("There are \(ProductType.allCases.count) products:")
    for product in ProductType.allCases {
      print(product.rawValue)
    }
  }
}

enum Edition: String {
  case basic = "Basic"
  case premium = "Premium"
  case ultimate = "Ultimate"

  mutating func upgrade() {
    switch self {
      case .basic:
        self = .premium
      case .premium:
        self = .ultimate
      case .ultimate:
        print("Can't upgrade further")
    }
  }
}