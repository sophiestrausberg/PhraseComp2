//
//  vfdvfd.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 4/12/22.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score:Int = 0
}

struct ButtonOne: View {
    // Fetched from the environment on your behalf
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        HStack {
            Button("Increase Store") {
                self.settings.score += 1
            }
            Text("In ButtonOne your score is \(settings.score)")
        }
    }
}


struct ButtonTwo: View {
    // Fetched from the environment on your behalf
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        HStack {
            Button("Decrease Score") {
                self.settings.score -= 1
            }
            Text("In ButtonTwo your score is \(settings.score)")
        }
    }
}

struct ContentView: View {
    // Fetched from the environment on your behalf
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        VStack(spacing: 10) {
            Text("In master view your score is \(settings.score)")
            // Buttons inherit the environment, including the UserSettings instance.
            ButtonOne()
            ButtonTwo()
            Text("All scores refer to the same variable, so should be the same.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())  // assign environment
    }
}
