// Import the UIKit framework (used for iOS development)
import UIKit

// Ingredients
var current = 1 // Initialize the current Fibonacci number to 1
var previous = 0 // Initialize the previous Fibonacci number to 0
let n = 10 // Change 'n' to the number of Fibonacci numbers you want to generate

// Function to calculate Fibonacci numbers
func generateFibonacciNumbers(_ count: Int) {
    print("Fibonacci Numbers:") // Print a header for the Fibonacci numbers
    
    // Check if we should print the first Fibonacci number (0)
    if count >= 1 {
        print("0")
    }
    
    // Check if we should print the second Fibonacci number (1)
    if count >= 2 {
        print("1")
    }
    
    // Generate the rest of the Fibonacci numbers
    if count >= 3 { // We start generating from the third Fibonacci number onwards
        for _ in 3...count {
            let next = current + previous // Calculate the next Fibonacci number
            print(next) // Print the next Fibonacci number
            
            // Update 'previous' and 'current' for the next iteration
            previous = current
            current = next
        }
    }
}

// Generate and print Fibonacci numbers
generateFibonacciNumbers(n) // Call the function with 'n' as the count of Fibonacci numbers to generate
