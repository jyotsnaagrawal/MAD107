import UIKit

// Define a User class to represent a user's profile
class User {
    var username: String
    var email: String
    var fullName: String

    init(username: String, email: String, fullName: String) {
        self.username = username
        self.email = email
        self.fullName = fullName
    }
}

// Define a UserDatabase to manage user accounts
class UserDatabase {
    var users: [User] = []

    // Register a new user
    func register(username: String, email: String, password: String) -> User? {
        // Check if the email is already registered
        if users.contains(where: { $0.email == email }) {
            return nil // Email already in use
        }

        let newUser = User(username: username, email: email, fullName: username)
        users.append(newUser)
        return newUser
    }

    // Login a user
    func login(email: String, password: String) -> User? {
        if let user = users.first(where: { $0.email == email }) {
            // Check password (not implemented here for simplicity)
            return user
        }
        return nil
    }
}

// Example usage
let userDatabase = UserDatabase()

// Register a new user
if let newUser = userDatabase.register(username: "JohnDoe", email: "john@example.com", password: "password123") {
    print("Registration successful! User: \(newUser.fullName)")
} else {
    print("Registration failed. Email already in use.")
}

// Login
if let loggedInUser = userDatabase.login(email: "john@example.com", password: "password123") {
    print("Login successful! Welcome, \(loggedInUser.fullName)")
} else {
    print("Login failed. Invalid email or password.")
}
