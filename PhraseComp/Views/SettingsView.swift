//
//  SettingsView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 2/23/22.
//

import SwiftUI

struct SettingsView: View {
    @State var picturesOn = false
    @State var isGoClicked = false
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Settings").bold().multilineTextAlignment(.center).font(.system(size: 30))
                Spacer()
                HStack {
                    Text("Pictures").font(.system(size: 15))
                    Toggle(isOn: $picturesOn) {
                        
                    }.labelsHidden()
                    .tint(picturesOn ? Color("ButtonOutline") : .gray)
                }
                
                DropDown()
                
                Spacer()
                
                FowardButton(text: "Let's Go!") {
                    isGoClicked = true
                    print(isGoClicked)
                }
                
            }.padding(.vertical, 50)
                .background(phraseNavigationLink)
                .navigationBarHidden(true)
        }
    }
    private var phraseNavigationLink : some View {
        NavigationLink(destination: PhraseView(), isActive: .constant(isGoClicked), label: {
            EmptyView()
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
