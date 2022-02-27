//
//  PhraseCompApp.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

@main
struct PhraseCompApp: App {
    var body: some Scene {
        WindowGroup {
            SettingsView(dropDown: DropDown())
//            PhraseVoiceView()
//                .environmentObject(SpeechRecognizer())
//                .preferredColorScheme(.dark)
        }
    }
}
