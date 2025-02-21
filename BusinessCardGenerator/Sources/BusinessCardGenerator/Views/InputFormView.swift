import SwiftUI

struct InputFormView: View {
    @Binding var card: BusinessCard
    
    var body: some View {
        Form {
            TextField("Full Name", text: $card.fullName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Contact Number", text: $card.contactNumber)
                .textFieldStyle(.roundedBorder)
            
            TextField("Email Address", text: $card.emailAddress)
                .textFieldStyle(.roundedBorder)
                .overlay(alignment: .trailing) {
                    if !card.emailAddress.isEmpty && !card.isValid {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.red)
                            .padding(.trailing, 8)
                    }
                }
        }
        .padding()
    }
} 