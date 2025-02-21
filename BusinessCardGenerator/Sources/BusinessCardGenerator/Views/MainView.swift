import SwiftUI

struct MainView: View {
    @State private var card = BusinessCard()
    @State private var showingCSVPicker = false
    @State private var showingExportDialog = false
    @State private var importedCards: [BusinessCard] = []
    @State private var errorMessage: String?
    @State private var showingError = false
    
    var body: some View {
        NavigationSplitView {
            List {
                Section("Single Card") {
                    InputFormView(card: $card)
                }
                
                Section("Batch Import") {
                    Button("Import CSV") {
                        showingCSVPicker = true
                    }
                    
                    if !importedCards.isEmpty {
                        Text("\(importedCards.count) cards imported")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Business Card Generator")
        } detail: {
            VStack {
                CardPreviewView(card: card)
                    .frame(maxWidth: 600, maxHeight: 400)
                    .padding()
                
                HStack {
                    Button("Export Single Card") {
                        exportSingleCard()
                    }
                    .disabled(!card.isValid)
                    
                    if !importedCards.isEmpty {
                        Button("Export All Cards") {
                            exportAllCards()
                        }
                    }
                }
                .padding()
            }
        }
        .fileImporter(
            isPresented: $showingCSVPicker,
            allowedContentTypes: [.commaSeparatedText]
        ) { result in
            handleCSVImport(result)
        }
        .alert("Error", isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text(errorMessage ?? "An unknown error occurred")
        }
    }
    
    private func handleCSVImport(_ result: Result<URL, Error>) {
        do {
            let url = try result.get()
            importedCards = try CSVImporter.importCards(from: url)
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
        }
    }
    
    private func exportSingleCard() {
        let panel = NSSavePanel()
        panel.allowedContentTypes = [.png]
        panel.nameFieldStringValue = "\(card.fullName.replacingOccurrences(of: " ", with: "_")).png"
        
        guard panel.runModal() == .OK,
              let url = panel.url else { return }
        
        do {
            try ImageExporter.exportCard(card, to: url)
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
        }
    }
    
    private func exportAllCards() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        panel.message = "Choose export directory"
        
        guard panel.runModal() == .OK,
              let url = panel.url else { return }
        
        do {
            try ImageExporter.exportCards(importedCards, to: url)
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
        }
    }
} 