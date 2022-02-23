//
//  SettingsView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

struct SettingsView: View {
    @State private var selectedFlavor = Flavor.chocolate
    var body: some View {
        VStack {
            Text("Settings").bold().multilineTextAlignment(.center).font(.system(size: 30))

            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
//            Text("Selected flavor: \(selectedFlavor.rawValue)")
            
            Spacer()
            FowardButton(text: "Start") {
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
