import Foundation
import CoreGraphics
import AppKit

enum ImageExportError: Error {
    case renderingFailed
    case savingFailed
}

class ImageExporter {
    static let cardWidth: CGFloat = 3.5 * 300  // 3.5 inches at 300 DPI
    static let cardHeight: CGFloat = 2.0 * 300 // 2.0 inches at 300 DPI
    
    static func exportCard(_ card: BusinessCard, to url: URL) throws {
        guard let context = CGContext(
            data: nil,
            width: Int(cardWidth),
            height: Int(cardHeight),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpace(name: CGColorSpace.sRGB)!,
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else {
            throw ImageExportError.renderingFailed
        }
        
        // Set white background
        context.setFillColor(CGColor.white)
        context.fill(CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight))
        
        // Set text attributes
        let nameFont = NSFont.systemFont(ofSize: 24, weight: .bold)
        let detailFont = NSFont.systemFont(ofSize: 16, weight: .regular)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // Draw name
        let nameAttrs: [NSAttributedString.Key: Any] = [
            .font: nameFont,
            .foregroundColor: NSColor.black,
            .paragraphStyle: paragraphStyle
        ]
        
        let detailAttrs: [NSAttributedString.Key: Any] = [
            .font: detailFont,
            .foregroundColor: NSColor.black,
            .paragraphStyle: paragraphStyle
        ]
        
        let nameString = NSAttributedString(string: card.fullName, attributes: nameAttrs)
        let phoneString = NSAttributedString(string: card.contactNumber, attributes: detailAttrs)
        let emailString = NSAttributedString(string: card.emailAddress, attributes: detailAttrs)
        
        // Calculate positions
        let centerY = cardHeight / 2
        nameString.draw(at: CGPoint(x: cardWidth/2 - nameString.size().width/2, y: centerY + 30))
        phoneString.draw(at: CGPoint(x: cardWidth/2 - phoneString.size().width/2, y: centerY - 10))
        emailString.draw(at: CGPoint(x: cardWidth/2 - emailString.size().width/2, y: centerY - 50))
        
        // Create image and save
        guard let image = context.makeImage() else {
            throw ImageExportError.renderingFailed
        }
        
        let bitmap = NSBitmapImageRep(cgImage: image)
        guard let data = bitmap.representation(using: .png, properties: [:]) else {
            throw ImageExportError.renderingFailed
        }
        
        try data.write(to: url)
    }
    
    static func exportCards(_ cards: [BusinessCard], to directoryURL: URL) throws {
        try cards.forEach { card in
            let fileName = card.fullName.replacingOccurrences(of: " ", with: "_")
            let fileURL = directoryURL.appendingPathComponent("\(fileName).png")
            try exportCard(card, to: fileURL)
        }
    }
} 