//
//  DictationDemoView.swift
//  KeyboardDemo
//
//  Created by Bingjian Liu on 5/13/24.
//

import SwiftUI

struct AIImprovementDemo: View {
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            HStack(alignment:.top){
                Spacer()
                
                Text("AI Rewrite")
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Label("dismiss", systemImage: "chevron.down")
                        .labelStyle(.iconOnly)
                        .padding(10)
                        .background(Circle().fill(Color.gray))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            Spacer()

            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<5) { i in
                        ZStack(alignment:.center) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.gray.opacity(0.5))
                                .padding(.bottom)
                                .padding(.horizontal,4)

                            VStack {
                                Text("Option \(i+1)")
                                    .padding()
                                    .opacity(0.5)
                                Spacer()
                            }
                            ProgressView()
                        }
                        .frame(width: 300)

                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 40)
        }
    }
}

#Preview {
    AIImprovementDemo()
}
