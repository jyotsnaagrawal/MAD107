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

// Create a subclass of User for Admin users with additional properties
class AdminUser: User {
    var isAdmin: Bool  // Declare a property to specify if the user is an admin.

    init(username: String, email: String, fullName: String, isAdmin: Bool) {
        self.isAdmin = isAdmin  // Initialize the isAdmin property with the provided value.
        super.init(username: username, email: email, fullName: fullName)  // Initialize the inherited properties from User.
    }
}

// Define a UserDatabase to manage user accounts
class UserDatabase {
    var users: [User] = []  // Declare an array to store user objects.

    // Register a new user
    func register(user: User) -> User? {
        if users.contains(where: { $0.email == user.email }) {
            return nil  // Return nil if the email is already in use (registration failed).
        }

        users.append(user)  // Add the user to the array of users.
        return user  // Return the newly registered user.
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
let newUser = User(username: "Jyotsna", email: "jyotsna@gmail.com", fullName: "Jyotsna")  // Create a new User object.
if let registeredUser = userDatabase.register(user: newUser) {
    print("Registration successful! User: \(registeredUser.fullName)")  // Print a success message with the user's full name.
} else {
    print("Registration failed. Email already in use.")  // Print a failure message (email already in use).
}

// Create an AdminUser
let adminUser = AdminUser(username: "Jyotsna", email: "Jyotsna@gmail.com", fullName: "Jyotsna Agrawal", isAdmin: true)  // Create a new AdminUser object.
if let registeredAdmin = userDatabase.register(user: adminUser) {
    print("User registration successful! User: \(registeredAdmin.fullName)")  // Print a success message for admin user registration.
} else {
    print("User registration failed. Email already in use.")  // Print a failure message (admin email already in use).
}
