import UIKit
// Function to calculate and display Fibonacci numbers up to a given limit
func calculateAndDisplayFibonacciNumbers(upTo limit: Int) {
    print("Fibonacci Numbers:")
    
    var current = 1
    var previous = 0
    
    // Handle the first two Fibonacci numbers (0 and 1)
    print("0")
    print("1")
    
    // Generate Fibonacci numbers up to the given limit
    while current + previous <= limit {
        let next = current + previous
        print(next)
        
        // Update 'previous' and 'current' for the next iteration
        previous = current
        current = next
    }
}

// Call the function to calculate and display Fibonacci numbers up to 1000
calculateAndDisplayFibonacciNumbers(upTo: 1000)
