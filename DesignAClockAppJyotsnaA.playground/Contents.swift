import UIKit
import PlaygroundSupport

let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    print("Current Time: \(dateFormatter.string(from: currentDate))")
}

RunLoop.current.add(timer, forMode: .common)

// Keep the playground running
PlaygroundPage.current.needsIndefiniteExecution = true
