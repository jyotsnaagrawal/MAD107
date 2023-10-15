import UIKit

// Define enums for Prius models, colors, packages, and accessories
enum PriusModel: String {
    case PriusL, PriusLE, PriusXLE, PriusLimited
}

enum PriusColor: String {
    case ClassicSilver, MagneticGray, MidnightBlack, SupersonicRed, ElectricStormBlue
}

enum PriusPackage: String {
    case SafetySense, AdvancedTech, PremiumAudio
}

enum PriusAccessory: String {
    case FloorMats, RoofRack, CargoOrganizer, SeatCovers
}

// Create a struct to represent the Prius configuration
struct PriusConfiguration {
    var model: PriusModel
    var color: PriusColor
    var selectedPackages: [PriusPackage]
    var selectedAccessories: [PriusAccessory]
}

// Initialize the Prius configuration with default values
var currentPriusConfig = PriusConfiguration(model: .PriusL, color: .ClassicSilver, selectedPackages: [], selectedAccessories: [])

// Function to select the Prius model
func selectModel(_ model: PriusModel) {
    currentPriusConfig.model = model
}

// Function to select the Prius color
func selectColor(_ color: PriusColor) {
    currentPriusConfig.color = color
}

// Function to add a package to the Prius configuration
func addPackage(_ package: PriusPackage) {
    currentPriusConfig.selectedPackages.append(package) // Add the selected package to the list
}

// Function to add an accessory to the Prius configuration
func addAccessory(_ accessory: PriusAccessory) {
    currentPriusConfig.selectedAccessories.append(accessory) // Add the selected accessory to the list
}

// usage of the functions to customize the Prius configuration
selectModel(.PriusXLE) // Select the Prius model
selectColor(.MidnightBlack) // Select the Prius color
addPackage(.AdvancedTech) // Add a package
addAccessory(.RoofRack) // Add an accessory

// Display the current Prius configuration
print("Current Prius Configuration:")
print("Model: \(currentPriusConfig.model.rawValue)") // Print the selected model
print("Color: \(currentPriusConfig.color.rawValue)") // Print the selected color
// Print selected packages as a comma-separated list
print("Packages: \(currentPriusConfig.selectedPackages.map { $0.rawValue }.joined(separator: ", "))")
// Print selected accessories as a comma-separated list
print("Accessories: \(currentPriusConfig.selectedAccessories.map { $0.rawValue }.joined(separator: ", "))")
