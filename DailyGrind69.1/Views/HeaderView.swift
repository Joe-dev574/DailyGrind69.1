//
//  HeaderView.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Daily")
                .font(.title3)
                .fontWeight(.bold)
                               .padding(.leading, 10)
                               .foregroundColor(.secondary)
                               .offset(y: 2)
            Text("Grind")
                .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
            Spacer()
        }
    }
}

#Preview {
    HeaderView()
}
