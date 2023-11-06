import UIKit

// Defining an enum for predefined expense categories
enum ExpenseCategory {
    case groceries
    case utilities
    case diningOut
    case transportation
    // Here I can Add more predefined categories as needed

    // Custom method to return a user-friendly description
    func description() -> String {
        switch self {
        case .groceries:
            return "Groceries"
        case .utilities:
            return "Utilities"
        case .diningOut:
            return "Dining Out"
        case .transportation:
            return "Transportation"
    
        }
    }
}

// Define a class for Expense
class Expense {
    var name: String
    var amount: Double
    var date: Date
    var category: ExpenseCategory
    var notes: String?
    var tags: Set<String> // Using a set to store tags
    var isDeductible: Bool // Property to indicate if the expense is deductible

    init(name: String, amount: Double, date: Date, category: ExpenseCategory, notes: String? = nil, isDeductible: Bool = false, tags: Set<String> = []) {
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
        self.notes = notes
        self.tags = tags
        self.isDeductible = isDeductible
    }
}

// Define a class for User Profiles
class UserProfile {
    var username: String
    var email: String
    var fullName: String
    var profilePicture: UIImage?
    var expenses: [Expense] = []
    var predefinedCategories: [ExpenseCategory] = []
    var customCategories: [String] = []

    init(username: String, email: String, fullName: String, profilePicture: UIImage? = nil) {
        self.username = username
        self.email = email
        self.fullName = fullName
        self.profilePicture = profilePicture
    }

    // Add an expense to the user's profile
    func addExpense(expense: Expense) {
        expenses.append(expense)
    }

    // Add a predefined category to the user's profile
    func addPredefinedCategory(category: ExpenseCategory) {
        predefinedCategories.append(category)
    }

    // Add a custom category to the user's profile
    func addCustomCategory(category: String) {
        customCategories.append(category)
    }
}

// Example usage:
let user1 = UserProfile(username: "user1", email: "user1@example.com", fullName: "User One")
let user2 = UserProfile(username: "user2", email: "user2@example.com", fullName: "User Two")

// Add predefined and custom categories to user1
user1.addPredefinedCategory(category: .diningOut)
user1.addPredefinedCategory(category: .utilities)
user1.addCustomCategory(category: "Entertainment")

// Add expenses with categories, tags, and deductibility
let deductibleExpense = Expense(name: "Business lunch", amount: 60.0, date: Date(), category: .diningOut, isDeductible: true, tags: ["business"])
let nonDeductibleExpense = Expense(name: "Personal dinner", amount: 40.0, date: Date(), category: .diningOut, isDeductible: false, tags: ["personal"])

user1.addExpense(expense: deductibleExpense)
user1.addExpense(expense: nonDeductibleExpense)

let expense3 = Expense(name: "Entertainment", amount: 20.0, date: Date(), category: .utilities, notes: "Movie night", tags: ["movies", "entertainment"])
user1.addExpense(expense: expense3)

let expense4 = Expense(name: "Utility bill", amount: 100.0, date: Date(), category: .diningOut, notes: "Electricity bill", tags: ["bills", "utilities"])
user2.addExpense(expense: expense4)

// Print user profiles, categories, and expenses
print("User 1 Profile:")
print("Username: \(user1.username)")
print("Email: \(user1.email)")
print("Full Name: \(user1.fullName)")
print("Predefined Categories: \(user1.predefinedCategories.map { $0.description() }.joined(separator: ", "))")
print("Custom Categories: \(user1.customCategories.joined(separator: ", "))")

print("\nUser 2 Profile:")
print("Username: \(user2.username)")
print("Email: \(user2.email)")
print("Full Name: \(user2.fullName)")

print("\nUser 1 Expenses:")
for expense in user1.expenses {
    print("- \(expense.name): $\(expense.amount), Category: \(expense.category.description()), Tags: \(expense.tags.joined(separator: ", ")), Deductible: \(expense.isDeductible ? "Yes" : "No")")
}

print("\nUser 2 Expenses:")
for expense in user2.expenses {
    print("- \(expense.name): $\(expense.amount), Category: \(expense.category.description()), Tags: \(expense.tags.joined(separator: ", ")), Deductible: \(expense.isDeductible ? "Yes" : "No")")
}

