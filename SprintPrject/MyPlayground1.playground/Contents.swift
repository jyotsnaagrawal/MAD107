import UIKit

// Define a User class to represent a user's profile
class User {
    var username: String  // Declare a property to store the username.
    var email: String     // Declare a property to store the email.
    var fullName: String  // Declare a property to store the full name.

    init(username: String, email: String, fullName: String) {
        self.username = username   // Initialize the username property with the provided value.
        self.email = email         // Initialize the email property with the provided value.
        self.fullName = fullName   // Initialize the full name property with the provided value.
    }
}

// Define a UserDatabase to manage user accounts
class UserDatabase {
    var users: [User] = []  // Declare an array to store user objects.

    // Register a new user
    func register(username: String, email: String, password: String) -> User? {
        // Check if the email is already registered
        if users.contains(where: { $0.email == email }) {
            return nil // Return nil if the email is already in use (registration failed).
        }

        let newUser = User(username: username, email: email, fullName: username)  // Create a new User object.
        users.append(newUser)  // Add the new user to the array of users.
        return newUser  // Return the newly registered user.
    }

    // Login a user
    func login(email: String, password: String) -> User? {
        if let user = users.first(where: { $0.email == email }) {
            // Check password (not implemented here for simplicity)
            return user  // Return the user if the email is found in the user database.
        }
        return nil  // Return nil if login is unsuccessful (user not found).
    }
}
    
let userDatabase = UserDatabase()  // Create an instance of the UserDatabase.

// Register a new user
if let newUser = userDatabase.register(username: "Jyotsna", email: "jyotsna@gmail.com", password: "password123") {
    print("Registration successful! User: \(newUser.fullName)")  // Print a success message with the user's full name.
} else {
    print("Registration failed. Email already in use.")  // Print a failure message (email already in use).

}

// Login
if let loggedInUser = userDatabase.login(email: "jyotsna@gmail.com", password: "password123") {
    print("Login successful! Welcome, \(loggedInUser.fullName)")  // Print a success message with the user's full name.
} else {
    print("Login failed. Invalid email or password.")  // Print a failure message (login failed).
}
