//
//  Tone.swift
//  MyApp
//
//  Created by Nidya Anifa on 30/10/26.
//

enum Tone: String, CaseIterable {
    case professional  = "Professional"
    case friendly      = "Friendly"
    case politeButFirm = "Polite but firm"
    case casual        = "Casual"
    case concise       = "Concise"
 
    var guidance: String {
        switch self {
        case .professional:
            "Use clear, formal business language. Be courteous and confident. No slang, no emoji."
        case .friendly:
            "Be warm and upbeat, like writing to a colleague you like. Exclamation marks are fine."
        case .politeButFirm:
            "Be courteous but direct. Clearly state what is needed. Do not apologize or sound rude."
        case .casual:
            "Be relaxed and conversational, like texting a friend. Use contractions and short sentences."
        case .concise:
            "Make it as short as possible while keeping every important fact and request."
        }
    }
 
    var example: String {
        switch self {
        case .professional:
            "Hello, I have not yet received the document. Could you please send it at your earliest convenience, as I need it to move forward? Thank you."
        case .friendly:
            "Hey! Just checking in on the document. Could you send it over when you get a chance? I need it to keep things moving. Thanks so much!"
        case .politeButFirm:
            "Hi! I wanted to follow up on the document, as I need it to proceed with the next steps. Could you please send it over as soon as possible? Thank you!"
        case .casual:
            "Hey, still waiting on that doc. Can you send it over soon? Need it to keep going."
        case .concise:
            "Please send the document now. I need it to proceed."
        }
    }
}
