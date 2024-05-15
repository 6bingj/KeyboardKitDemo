//
//  HeroView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import SwiftUI

struct HeroView: View {
    
    var body: some View {
        VStack(alignment:.center){
            Image(systemName: "person.line.dotted.person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .opacity(0.8)
                .frame(height:40)
                .padding()
            
            VStack(alignment: .leading){
                
                VStack(alignment:.leading, spacing: 10){
                    Text("A Keyboard for Quick Networking")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                    Text("This keyboard simplifies your online networking by allowing you to insert pre-saved snippets into anywhere you type. ")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(10)
                        .minimumScaleFactor(0.9)
                        .multilineTextAlignment(.leading)
                }
               


            }
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
    
}

#Preview {
    List {
        HeroView()
    }
}
