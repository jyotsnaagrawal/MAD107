import UIKit


// Mortgage Calculator Playground

// =======================
//  (Input Variables)
// =======================

// Principal Amount (Initial Loan Amount)
let principalAmount = 200000.0

// Annual Interest Rate (in percentage)
let annualInterestRate = 4.5

// Loan Term (in years)
let loanTermInYears = 30.0

// =======================
//  (Operations)
// =======================

// Function to calculate the monthly mortgage payment
func calculateMortgagePayment(principal: Double, annualInterestRate: Double, years: Double) -> Double {
    let monthlyInterestRate = annualInterestRate / 12.0 / 100.0
    let numberOfPayments = years * 12.0
    let numerator = principal * monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfPayments)
    let denominator = pow(1 + monthlyInterestRate, numberOfPayments) - 1
    let monthlyPayment = numerator / denominator
    return monthlyPayment
}

// Calculate the monthly mortgage payment
let monthlyPayment = calculateMortgagePayment(principal: principalAmount, annualInterestRate: annualInterestRate, years: loanTermInYears)

// =======================
// (Result Display)
// =======================

// Display the result
print("Mortgage Calculator Results:")
print("============================")
print("Principal Amount: $\(principalAmount)")
print("Annual Interest Rate: \(annualInterestRate)%")
print("Loan Term: \(loanTermInYears) years")
print("-----------------------------")
print("Monthly Mortgage Payment: $\(monthlyPayment.rounded())")


