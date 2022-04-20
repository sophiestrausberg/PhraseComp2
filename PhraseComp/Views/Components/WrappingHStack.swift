//
//  WrappingHStack.swift
//  PhraseComp
//
//  Created by Sophie Strausberg on 4/10/22.
//

import Foundation
import SwiftUI

struct TestWrappedHStackView: View {
    
    let words = ["Action", "Horror one", "🐇", "IT 2", "Comedy is good", "Adventure Park", "Kids", "Science Fiction", "Drama", "Romance", "ET", "Silicon Valley", "Fantasy", "Spotlight", "Facebook", "I know what you did last summer", "Money Ball", "Seinfeld", "Raymond", "Thriller movies are the best movies!", "IT 3"]

    var body: some View {
        TagsView(items: words)
    }
}

struct TestWrappedHStackView_Previews: PreviewProvider {
    static var previews: some View {
        TestWrappedHStackView()
    }
}


