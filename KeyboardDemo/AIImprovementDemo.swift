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
            HStack{
                Button {
                    dismiss()
                } label: {
                    Label("dismiss", systemImage: "chevron.down.square.fill")
                        .padding()
                }
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    AIImprovementDemo()
}
