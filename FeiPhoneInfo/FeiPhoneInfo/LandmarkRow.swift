//
//  LandmarkRow.swift
//  FeiPhoneInfo
//
//  Created by 钱红凯 on 2019/12/3.
//  Copyright © 2019 Njnu. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0]).previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarkData[1]).previewLayout(.fixed(width: 300, height: 70))
//            LandmarkRow(landmark: landmarkData[2]).previewLayout(.fixed(width: 300, height: 70))
        }/*.previewLayout(.fixed(width: 300, height: 70))*/

    }
}
