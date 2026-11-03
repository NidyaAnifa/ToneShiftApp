//  MyApp
//
//  Created by Nidya Anifa on 30/10/26.

import SwiftUI
import FoundationModels

struct ContentView: View {
    @State private var message = ""
    @State private var tone: Tone = .politeButFirm
    @State private var result = ""
    @State private var isGenerating = false
 
    var body: some View {
        NavigationStack {
            Form {
                Section("Message") {
                    TextField("Type your message", text: $message, axis: .vertical)
                        .lineLimit(3...6)
                }
 
                Section("Tone") {
                    Picker("Tone", selection: $tone) {
                        ForEach(Tone.allCases, id: \.self) { tone in
                            Text(tone.rawValue)
                        }
                    }
                }
 
                Button("Rewrite") {
                    Task { try? await rewrite() }
                }
                .disabled(message.isEmpty || isGenerating)
 
                if !result.isEmpty {
                    Section("Result") {
                        Text(result)
                        ShareLink(item: result)   // share sheet also has "Copy"
                    }
                }
            }
            .navigationTitle("ToneShift")
        }
    }
 
    func rewrite() async throws {
        isGenerating = true
        defer { isGenerating = false }
 
        // 1. Instructions: the model's job, the tone guidance and one example
        let session = LanguageModelSession(instructions: """
            You rewrite messages in a requested tone.
            Keep the original meaning. Reply with only the rewritten message.
            
            Tone: \(tone.rawValue)
            Guidance: \(tone.guidance)
            
            Example
            Original: Hey, you haven't sent the document. I need it now.
            Rewritten: \(tone.example)
            """)
 
        // 2. Prompt: the user's message, in the same format as the example
        let prompt = "Original: \(message)\nRewritten:"
 
        // 3. Generate with streaming: text appears as it's written
        for try await partial in session.streamResponse(to: prompt) {
            result = partial.content
        }
    }
}
