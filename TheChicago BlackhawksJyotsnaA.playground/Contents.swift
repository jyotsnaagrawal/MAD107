import Foundation

// Define a dictionary of team members with their numbers as keys
var teamMembers: [Int: [String: Any]] = [
    15: ["name": "Joey Anderson", "age": 25, "country": "USA", "height": 6.0, "birthday": "1998-06-19"],
    89: ["name": "Andreas Athanasiou", "age": 31, "country": "Canada", "height": 6.2, "birthday": "1994-08-06"],
    98: ["name": "Connor Bedard", "age": 18, "country": "Canada", "height": 5.10, "birthday": "2005-07-17"],
    43: ["name": "Colin Blackwell", "age": 25, "country": "USA", "height": 5.9, "birthday": "1993-03-28"],
    28: ["name": "Colton Dach", "age": 31, "country": "USA", "height": 6.4, "birthday": "1994-08-06"],
    16: ["name": "Jason Dickinson", "age": 24, "country": "Canada", "height": 6.2, "birthday": "1995-07-04"],
    8: ["name": "Ryan Donato", "age": 23, "country": "USA", "height": 6.0, "birthday": "1996-04-09"],
    58: ["name": "MacKenzie Entwistle", "age": 31, "country": "Canada", "height": 6.3, "birthday": "1999-07-14"],
    92: ["name": "Michal Teply", "age": 22, "country": "CZE", "height": 6.3, "birthday": "2001-05-27"],
    // Add more players here...
]

// Create empty arrays to store player information
var playersByAge: [[String: Any]] = []
var playersByCountry: [[String: Any]] = []
var birthdaysByMonth: [String: Int] = [:]

// Iterate through team members to fill player arrays and calculate averages
var totalAge = 0
var totalHeight = 0.0

for (_, player) in teamMembers {
    playersByAge.append(player)
    playersByCountry.append(player)
    
    totalAge += player["age"] as! Int
    totalHeight += player["height"] as! Double
}

// Implement custom sorting functions
func sortByAge(player1: [String: Any], player2: [String: Any]) -> Bool {
    let age1 = player1["age"] as! Int
    let age2 = player2["age"] as! Int
    return age1 < age2
}

func sortByCountry(player1: [String: Any], player2: [String: Any]) -> Bool {
    let country1 = player1["country"] as! String
    let country2 = player2["country"] as! String
    return country1 < country2
}

// Sort players by age and country using custom sorting functions
playersByAge.sort(by: sortByAge)
playersByCountry.sort(by: sortByCountry)

// Calculate average age and height
let averageAge = Double(totalAge) / Double(teamMembers.count)
let averageHeight = totalHeight / Double(teamMembers.count)

// Determine the month with the most birthdays
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

var maxMonthCount = 0
var mostCommonMonth = ""

for (_, player) in teamMembers {
    if let birthdayString = player["birthday"] as? String,
       let birthdayDate = dateFormatter.date(from: birthdayString) {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: birthdayDate)
        let monthName = DateFormatter().monthSymbols[month - 1]

        if let count = birthdaysByMonth[monthName] {
            birthdaysByMonth[monthName] = count + 1
            if count + 1 > maxMonthCount {
                maxMonthCount = count + 1
                mostCommonMonth = monthName
            }
        } else {
            birthdaysByMonth[monthName] = 1
        }
    }
}

// Print results
print("Players sorted by age:")
for player in playersByAge {
    print("\(player["name"] ?? "") - Age: \(player["age"] ?? "")")
}

print("\nPlayers sorted by country:")
for player in playersByCountry {
    print("\(player["name"] ?? "") - Country: \(player["country"] ?? "")")
}

print("\nAverage Age of Players: \(String(format: "%.2f", averageAge))")
print("Average Height of Players: \(String(format: "%.2f", averageHeight))")

print("\nMonth with Most Birthdays: \(mostCommonMonth)")

