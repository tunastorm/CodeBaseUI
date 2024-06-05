//
//  Data.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import Foundation

struct Lotto: Decodable {
    
    let returnValue: String
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}
