import UIKit

// Constants
let coffeePrice: Double = 2.5
let sugarPrice: Double = 0.5

// Variables
var coffeeType: String = "Espresso"
var cupSize: String = "Small"
var addSugar: Bool = false

// Calculate the total cost
var totalCost: Double = coffeePrice

// Function to calculate the total cost
func calculateTotalCost() {
    totalCost = coffeePrice
    
    if cupSize == "Medium" {
        totalCost += 1.0
    } else if cupSize == "Large" {
        totalCost += 2.0
    }
    
    if addSugar {
        totalCost += sugarPrice
    }
}

// Update the variables
coffeeType = "Cappuccino"
cupSize = "Large"
addSugar = true

// Calculate the total cost
calculateTotalCost()

// Display the order details
print("Coffee Type: \(coffeeType)")
print("Cup Size: \(cupSize)")
print("Add Sugar: \(addSugar ? "Yes" : "No")")
print("Total Cost: $\(totalCost)")


