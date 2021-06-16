//
//  ProfileView.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
//    @Binding var isProfileShow: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Text("Account")
                    .font(.headline)
                
                HStack {
                    Spacer()
                }
            }
            
            Text("This feature is not open yet")
                .font(.body)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity)
                .foregroundColor(.black)
            
        }
        .padding()
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
