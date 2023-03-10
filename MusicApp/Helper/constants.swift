//
//  constants.swift
//  MusicApp
//
//  Created by 박다미 on 2022/12/29.
//

import UIKit
// MARK: - Name Space

// 사용하게될 API 문자열 묶음
public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
    
}

// 사용하게될 Cell 문자열 묶음
public struct Cell{
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init(){}
}

// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWidth: CGFloat = 1
    static let cellColumnsk: CGFloat = 3
    private init() {}
}
