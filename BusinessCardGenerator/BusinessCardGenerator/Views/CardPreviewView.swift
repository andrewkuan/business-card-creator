import SwiftUI

struct CardPreviewView: View {
    let card: BusinessCard
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(radius: 4)
            
            VStack(spacing: 16) {
                Text(card.fullName)
                    .font(.system(size: 24, weight: .bold))
                
                VStack(spacing: 8) {
                    Text(card.contactNumber)
                        .font(.system(size: 16))
                    
                    Text(card.emailAddress)
                        .font(.system(size: 16))
                }
                .foregroundColor(.secondary)
            }
            .padding()
        }
        .aspectRatio(1.75, contentMode: .fit)
        .padding()
    }
} 