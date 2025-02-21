import Foundation

struct BusinessCard: Identifiable, Codable {
    let id: UUID
    var fullName: String
    var contactNumber: String
    var emailAddress: String
    
    init(id: UUID = UUID(), fullName: String = "", contactNumber: String = "", emailAddress: String = "") {
        self.id = id
        self.fullName = fullName
        self.contactNumber = contactNumber
        self.emailAddress = emailAddress
    }
    
    var isValid: Bool {
        !fullName.isEmpty &&
        !contactNumber.isEmpty &&
        isValidEmail(emailAddress)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
} 