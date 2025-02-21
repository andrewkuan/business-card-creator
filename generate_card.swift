#!/usr/bin/env swift

struct BusinessCard {
    let name: String
    let title: String
    let company: String
    let email: String
    let phone: String
    
    func padString(_ str: String, length: Int) -> String {
        if str.count >= length {
            return String(str.prefix(length))
        }
        return str + String(repeating: " ", count: length - str.count)
    }
    
    func generateText() -> String {
        """
        ╔══════════════════════════════════╗
        ║                                  ║
        ║  \(padString(name.uppercased(), length: 32))║
        ║  \(padString(title, length: 32))║
        ║  \(padString(company.uppercased(), length: 32))║
        ║                                  ║
        ║  ✉️  \(padString(email, length: 30))║
        ║  📱  \(padString(phone, length: 30))║
        ║                                  ║
        ╚══════════════════════════════════╝
        """
    }
}

func main() {
    print("\n📇  Business Card Generator")
    print("------------------------")

    print("\nEnter your name:")
    guard let name = readLine() else { 
        print("Error reading input")
        return
    }

    print("Enter your title:")
    guard let title = readLine() else {
        print("Error reading input")
        return
    }

    print("Enter your company:")
    guard let company = readLine() else {
        print("Error reading input")
        return
    }

    print("Enter your email:")
    guard let email = readLine() else {
        print("Error reading input")
        return
    }

    print("Enter your phone:")
    guard let phone = readLine() else {
        print("Error reading input")
        return
    }

    let card = BusinessCard(
        name: name,
        title: title,
        company: company,
        email: email,
        phone: phone
    )

    print("\nYour business card:\n")
    print(card.generateText())
    print("\nTip: Copy and paste this card into a text editor to see it properly formatted!")
}

main() 