//
//  SentencesView.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 4/9/22.
//

import SwiftUI

//enum of types of words (Subject, DO, ID, verb). Word bank + w/o?????
//COMPLETING SENTENCES
//GIVING DIRECTIONS

//ask for claire to elaborate. fill in the blank (too hot or too ...)? just make a random sentence? Have three words and drag them in the correct order or choose a sentence out of a word bank?
//for word in sentence...
//let text = "The ripe taste of cheese improves with age."
//let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
//tagger.string = text
//let range = NSRange(location: 0, length: text.utf16.count)
//let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
//tagger.enumerateTags(in: range, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange, _ in
//    if let tag = tag {
//        let word = (text as NSString).substring(with: tokenRange)
//        print("\(word): \(tag)")
//    }
//}
class Sentence: ObservableObject {
    @Published var sentence: [String] = ["queen"]
}


var sentence = ["whatever", "confusion"]

func sentenceUpdate() {
//    SentencesView.sentenceButInside = ["NEW WORD"]
//    print("SNCETNE: \(sentence)")
//    print("SENTNEC BUT INCIDE: \(SentencesView.sentenceButInside)")
}

var words = ["hey", "i", "want", "to", "eat", "my", "food"]

struct SentencesView: View {

    @StateObject var sentenceButInside = Sentence()
    
    var body: some View {
        VStack(spacing: 50) {
            ProgressView(value: 0.5).padding(.horizontal, 100.0)
            Spacer()
            Text("You’re at a restaurant and your salad arrives. However, you don’t have any utensils. You turn to your waiter and say…")
                .padding()
            Spacer()
            
            ZStack(alignment: .topLeading) {
                VStack(spacing: 75) {
                    Divider().background(.gray)
                    Divider().background(.gray)
                    Divider().background(.gray)
                }.padding(.horizontal, 20)
                
                TextView(items: sentenceButInside.sentence)
            }
        
            TagsView(items: words).environmentObject(sentenceButInside)
            Spacer()
        
        }
    }
}

struct TagsView: View {
    
    @EnvironmentObject var sentenceButInside: Sentence
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = createGroupedItems(items)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 55) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        return groupedItems
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        ZStack {
                            Button {
                                print("word")
                                sentence.append(word)
//                                sentenceUpdate()
                            } label: {
                            Text(word)
                                .bold()
                                .fixedSize()
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("ButtonOutline"))
                                )
                            }
                            
                            Button {
                                print(word)
                                self.sentenceButInside.sentence.append(word)
                            } label: {
                            Text(word)
                                .bold()
                                .fixedSize()
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            }
                                
                                //onClick adds to an array of strings. state var, each time string changed, re-rendered (can you specify the x,y position of a Text). For each loop puts words on lines (curWidth + x), breaking when the width (var gets updates each time for loop is run) is bigger than the line. Get width by ????. Ontap, word is removed from the string array, hence rer-render.
                            //maybe taking same logic as this.
                            //or GeometryReader { (geometry) in
                            //var width += self.geometry.width + 5
                            
//                          }
                        }
                    }
                }
            }
            

        }
    }
    
}

struct TextView: View {
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = createGroupedItems(items)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 32
            
            if (width + labelWidth + 55) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        return groupedItems
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        VStack {
                            Divider()
                            Text(word)
                                .bold()
                                .fixedSize()
                                .padding()
                            //change later
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            

        }
    }
    
}

//LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4)) {
//    ForEach(words, id: \.self) { word in
//        ZStack {
//            Text(word).font(.system(size: 25))
//                .padding(11)
//                .overlay(                      RoundedRectangle(cornerRadius: 5)
//                    .fill(Color("ButtonOutline"))
//                )
//            Text(word).font(.system(size: 25))
//                .overlay(                       RoundedRectangle(cornerRadius: 5)
//                        .fill(.white)
//                )
//            Text(word).font(.system(size: 25)).padding(.horizontal, 10.0)
//        }
//    }
//}

struct SentencesView_Previews: PreviewProvider {
    static var previews: some View {
        SentencesView()
    }
}
