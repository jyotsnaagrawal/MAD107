import SwiftUI

// Define an enumeration for burger types
enum BurgerType: String {
    case classic = "Classic Burger" // Define a classic burger type with a raw value
    case cheese = "Cheeseburger"   // Define a cheeseburger type with a raw value
    case veggie = "Veggie Burger"  // Define a veggie burger type with a raw value
}

// Define a structure to represent a burger item
struct BurgerItem {
    let type: BurgerType  // Define a property to store the burger type
    let price: Double    // Define a property to store the burger price
}

// Create a dictionary to store burger items
var menu: [BurgerType: BurgerItem] = [
    .classic: BurgerItem(type: .classic, price: 8.99), // Initialize a classic burger item
    .cheese: BurgerItem(type: .cheese, price: 9.99),   // Initialize a cheeseburger item
    .veggie: BurgerItem(type: .veggie, price: 7.99)    // Initialize a veggie burger item
]

// Define a function to display the menu
func displayMenu() {
    print("Welcome to Your Gourmet Burger Bistro!")  // Display a welcome message
    print("MENU:")                                   // Display a menu section header
    
    for (type, item) in menu {
        print("\(type.rawValue): $\(item.price)")    // Display each burger type and its price
    }
}

// Define a function to simulate user input
var userInputIndex = 0
let userInputValues = ["Cheeseburger", "Classic Burger", "Veggie Burger"] // Predefined input values

func getUserInput() -> String {
    let input = userInputValues[userInputIndex]         // Get the next predefined input value
    userInputIndex = (userInputIndex + 1) % userInputValues.count
    return input
}

// Define a function to take orders
func takeOrder() -> BurgerItem? {
    print("\nWhat type of burger would you like? (Enter the burger name)") // Prompt the user for input
    displayMenu()                                                           // Display the menu
    
    let input = getUserInput()                  // Get simulated user input
    
    if let selectedType = BurgerType(rawValue: input) {
        if let selectedItem = menu[selectedType] {
            return selectedItem                   // Return the selected burger item
        } else {
            print("Sorry, we don't have that burger on the menu.") // Display an error message
        }
    } else {
        print("Invalid input. Please choose a burger from the menu.") // Display an error message for invalid input
    }
    
    return nil
}

// Main loop for taking orders
while true {
    if let order = takeOrder() {
        print("You ordered a \(order.type.rawValue). Your total is $\(order.price)") // Display order details
        print("Thank you for dining with us!")                                      // Display a thank you message

        // You can add more logic here for payment, order history, etc.

        break // Exit the loop after taking an order
    }
}
