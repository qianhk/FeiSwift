//
//  TestForView.swift
//  FeiPhoneInfo
//
//  Created by 钱红凯 on 2019/11/6.
//  Copyright © 2019 Njnu. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("fox")
                .resizable()
                .frame(width: 160, height: 160)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 1))
        }
        .padding()
            
    }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif

