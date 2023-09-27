import UIKit

// Create arrays for item names and prices
let itemNames = ["Apples", "Bananas", "Milk", "Bread", "Eggs"]
let itemPrices = [2.0, 1.0, 3.0, 2.5, 2.0]

// Define a function to calculate the total cost of the shopping list
func calculateTotalCost(itemPrices: [Double], calculateTax: (Double) -> Double) -> Double {
    let totalCostWithTax = itemPrices.reduce(0.0) { total, price in
        let priceWithTax = calculateTax(price)
        return total + priceWithTax
    }
    return totalCostWithTax
}

// Define a closure to calculate 10% tax for an item
let calculateTenPercentTax: (Double) -> Double = { cost in
    return cost * 1.1
}

// Calculate the total cost of the shopping list with 10% tax
let totalCostWithTax = calculateTotalCost(itemPrices: itemPrices, calculateTax: calculateTenPercentTax)

// Print the total cost
print("Total cost with 10% tax: $\(totalCostWithTax)")
