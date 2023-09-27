//
//  NumeroUno.swift
//  Module10-Project1-NumeroUno
//
//  Created by Alex Archer on 8/21/23.
//

/*
 PROJECT DIRECTIONS:
1) Create an enumeration called ProductType with raw values of type String.
2) Add cases to ProductType: aceRepository, dealForcer, kadencePlanner, and mailCannon with respective values.
3) Make the ProductType enumeration conform to the protocol that enables iteration.
4) Define method displayProductOfferings() to print all available product types.
5) Create an enumeration called Edition with raw values of String type.
6) Define three cases in Edition: basic, premium, and ultimate with raw values equal to case names.
7) Create a mutating method upgrade() to set the Edition one step higher, or print "Can't upgrade further" if at highest.
8) Create an enumeration called DeliveryMethod for delivery options.
9) Create two cases in DeliveryMethod: cloudDigital with Bool isLifetime, and shipping with Int weight.
10) Create computed Int property shippingCost to calculate cost based on delivery method.
11) Define method sendOrderConfirmation with arguments: productType, edition, deliveryMethod.
12) In sendOrderConfirmation, print a thank-you message with edition and productType.
13) In sendOrderConfirmation, print shipping cost if delivery method is shipping.
14) In sendOrderConfirmation, print either lifetime access or subscription info for cloudDigital delivery method.
15) Start by calling the displayProductOfferings() method.
16) Create variable myEdition from Edition, set to basic, and call the upgrade method on it.
17) Call sendOrderConfirmation with specific arguments: ProductType.aceRepository, myEdition, DeliveryMethod.shipping(weight: 1).
*/

import Foundation

// Write your code below
enum ProductType: String, CaseIterable {
  case aceRepository = "Ace Repository"
  case dealForcer = "Deal Forcer"
  case kadencePlanner = "Kadence Planner"
  case mailCannon = "Mail Cannon"

  static func displayProductOfferings() {
    print("There are \(ProductType.allCases.count) products:")
    for product in ProductType.allCases {
      print(product.rawValue)
    }
  }
}

enum Edition {
  case basic
  case premium
  case ultimate

  mutating func upgrade() {
    switch self {
    case .basic:
      self = .premium
    case .premium:
      self = .ultimate
    case .ultimate:
      print("Can’t upgrade further")
    }
  }
}

enum DeliveryMethod {
  case cloudDigital(isLifetime: Bool)
  case shipping(weight: Int)
  
  var shippingCost : Int {
    switch self {
    case .cloudDigital:
      return 0
    case .shipping(let weight):
      return weight * 2
    }
  }

  func sendOrderConfirmation(of productType: ProductType, in edition: Edition, by deliveryMethod: DeliveryMethod) {
    switch deliveryMethod {
    case .cloudDigital(let isLifetime):
        if isLifetime {
            print("Your order has been confirmed. Product: \(productType), Edition: \(edition), Delivery method: Cloud Digital. You have lifetime cloud access.")
        } else {
            print("Your order has been confirmed. Product: \(productType), Edition: \(edition), Delivery method: Cloud Digital. You can access your subscription information on the cloud.")
        }
    case .shipping(let weight):
        let cost = weight * 2
        print("Your order has been confirmed. Product: \(productType), Edition: \(edition), Delivery method: Shipping. Your order will be shipped to you at a cost of \(cost).")
    }
  }
}

ProductType.displayProductOfferings()

var myEdition = Edition.basic
myEdition.upgrade()

DeliveryMethod.shipping(weight: 1).sendOrderConfirmation(of: .aceRepository, in: myEdition, by: .shipping(weight: 1))
