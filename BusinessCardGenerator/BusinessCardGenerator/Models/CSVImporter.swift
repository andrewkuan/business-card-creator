import Foundation

enum CSVImportError: Error {
    case invalidFile
    case missingRequiredColumns
    case invalidData(String)
}

class CSVImporter {
    static func importCards(from url: URL) throws -> [BusinessCard] {
        let csvString = try String(contentsOf: url, encoding: .utf8)
        let rows = csvString.components(separatedBy: .newlines)
        
        guard let headerRow = rows.first,
              !headerRow.isEmpty else {
            throw CSVImportError.invalidFile
        }
        
        let headers = headerRow.lowercased().components(separatedBy: ",")
        guard let nameIndex = headers.firstIndex(of: "name"),
              let phoneIndex = headers.firstIndex(of: "phone"),
              let emailIndex = headers.firstIndex(of: "email") else {
            throw CSVImportError.missingRequiredColumns
        }
        
        return try rows.dropFirst().compactMap { row in
            guard !row.isEmpty else { return nil }
            
            let fields = row.components(separatedBy: ",")
            guard fields.count >= [nameIndex, phoneIndex, emailIndex].max()! + 1 else {
                throw CSVImportError.invalidData("Invalid number of fields in row: \(row)")
            }
            
            return BusinessCard(
                fullName: fields[nameIndex].trimmingCharacters(in: .whitespacesAndNewlines),
                contactNumber: fields[phoneIndex].trimmingCharacters(in: .whitespacesAndNewlines),
                emailAddress: fields[emailIndex].trimmingCharacters(in: .whitespacesAndNewlines)
            )
        }
    }
} 