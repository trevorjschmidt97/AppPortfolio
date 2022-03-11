//
//  AppView.swift
//  AppPortfolio
//
//  Created by Trevor Schmidt on 3/3/22.
//

import SwiftUI

struct AppView: View {
    
    var app: AppModel
    var size = 80.0
    
    @State private var isIcon = true
    
    var body: some View {
        HStack(alignment: .top) {
            
            AsyncImage(url: URL(string: isIcon ? app.appIcon : app.qrCode)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 3)
            } placeholder: {
                ProgressView()
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 3)
            }
                .onTapGesture {
                    if app.published {
                        isIcon.toggle()
                    }
                }
                .padding(.trailing, 3)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("\(app.order)")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.trailing, 3)
                    VStack(alignment: .leading) {
                        Text("\(app.name)")
                            .font(.headline)
                        Text("\(app.description)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        
                        Text("\(app.framework) - \(app.architecture)")
                    }
                    Spacer()
                    if app.published {
                    VStack {
                        Spacer()
                        Button(action: {
                            if let url = URL(string: "\(app.link)") {
                               UIApplication.shared.open(url)
                            } else {
                                print("ERROR")
                            }
                        }) {
                            Text("VIEW")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
//                        .tint(.blue)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .controlSize(.small)

                        Spacer()
                    }
                    }
                }
                
                
                Spacer()
                Divider()
            }
            Spacer()
        }
        
        .padding(.horizontal)
        .padding(.top)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(app: AppModel(name: "w8trkr", order: 1, appIcon: "https://firebasestorage.googleapis.com/v0/b/appportfolio-c816f.appspot.com/o/blue1240.png?alt=media&token=6b54acff-e1c3-4f48-8443-cf3efe080886", qrCode: "https://firebasestorage.googleapis.com/v0/b/appportfolio-c816f.appspot.com/o/w8trkr-qrCode.png?alt=media&token=83e25c9e-5029-43ba-a5ca-5ee21a6ae055", link: "https://apps.apple.com/us/app/w8trkr/id1604125138", framework: "SwiftUI", architecture: "MVVM", description: "The 1st Social Weight Tracker", published: true))
    }
}
