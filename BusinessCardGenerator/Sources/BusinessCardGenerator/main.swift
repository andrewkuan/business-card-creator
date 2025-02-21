import Foundation

struct BusinessCard {
    let name: String
    let title: String
    let company: String
    let email: String
    let phone: String
    
    func generateText() -> String {
        """
        ┌──────────────────────────────────┐
        │                                  │
        │  \(name.padding(toLength: 32, withPad: " ", startingAt: 0))│
        │  \(title.padding(toLength: 32, withPad: " ", startingAt: 0))│
        │  \(company.padding(toLength: 32, withPad: " ", startingAt: 0))│
        │                                  │
        │  Email: \(email.padding(toLength: 24, withPad: " ", startingAt: 0))│
        │  Phone: \(phone.padding(toLength: 24, withPad: " ", startingAt: 0))│
        │                                  │
        └──────────────────────────────────┘
        """
    }
}

print("Business Card Generator")
print("----------------------")

print("Enter your name:")
guard let name = readLine() else { exit(1) }

print("Enter your title:")
guard let title = readLine() else { exit(1) }

print("Enter your company:")
guard let company = readLine() else { exit(1) }

print("Enter your email:")
guard let email = readLine() else { exit(1) }

print("Enter your phone:")
guard let phone = readLine() else { exit(1) }

let card = BusinessCard(
    name: name,
    title: title,
    company: company,
    email: email,
    phone: phone
)

print("\nYour business card:\n")
print(card.generateText()) 