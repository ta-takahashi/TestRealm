//
//  TodoModel.swift
//  TestRealm2
//
//  Created by 高橋 辰之 on 2019/04/18.
//  Copyright © 2019年 TatsuyukiTakahashi. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object{
    @objc dynamic var itemName: String? = nil
}
