//
//  UserData.swift
//  FeiPhoneInfo
//
//  Created by 钱红凯 on 2019/12/6.
//  Copyright © 2019 Njnu. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
