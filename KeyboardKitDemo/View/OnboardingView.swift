//
//  OnboardingView.swift
//  KeyboardKitDemo
//
//  Created by Bingjian Liu on 5/14/24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selection = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            TabView(selection: $selection){
                tab1
                    .tag(1)
//              tab2
//                    .tag(2)
            }
            .edgesIgnoringSafeArea(.top)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .tint(.primary.opacity(0.8))
                    .padding()
            }
            
        }
    }
}

extension OnboardingView {
    @ViewBuilder var tab1: some View {
        VStack{
            
            Image("LinkedIn")
                .resizable()
                .scaledToFill()
                .frame(height: 350)
                .edgesIgnoringSafeArea(.top)
            
            Text("Welcome to Networking Keyboard")
                .font(.title)
                .minimumScaleFactor(0.7)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
                        
            HStack {
                Spacer()

                VStack {
                    Image(systemName: "tray.fill")
                        .font(.title2)
                        .padding(10)
                        .background(Circle().fill(Color.gray))
                        .foregroundColor(.white)
                    Text("Snippets")
                        .font(.callout)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "sparkles")
                        .font(.title2)
                        .padding(7)
                        .background(Circle().fill(Color.gray))
                        .foregroundColor(.white)
                    Text("AI Magic")
                        .font(.callout)
                }
                Spacer()

            }
            
            Text("This keyboard simplifies your online networking by allowing you to insert pre-saved snippets into anywhere you type. So you could reach out to anyone on LinkedIn and send them necessary info effortlessly(AI button is for showcasing UI only).")
                .minimumScaleFactor(0.7)
                .padding()
            
            Spacer()

            Button {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                selection += 1
                dismiss()
            } label: {
                Label("Enable Keyboard in Settings", systemImage: "gear")
            }
            .buttonStyle(OnboardingButton())
            
        }
        .padding(20)
        .ignoresSafeArea()

    }
}

struct OnboardingButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
            .foregroundStyle(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height:55)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.horizontal, 20)
            .padding(.vertical,10)
    }
}

#Preview {
    OnboardingView()
}
