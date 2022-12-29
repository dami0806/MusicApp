//
//  Music.swift
//  MusicApp
//
//  Created by 박다미 on 2022/12/29.
//

import Foundation
//MARK: - 데이터 모델

// 1) API에서 받게 되는 정보  MusicData

// 2) 우리가 사용하게될 음악(Music) 모델 구조체  Music
    //1. (서버에서 가져온 데이터만 표시해주면 되기 때문에 일반적으로 구조체로 만듦)
    //2.네트워크에서 주는 이름을 변환하는 방법 (원시값)
    // (서버: trackName ===> songName)


// 3) (출시 정보를 사용할껀데 날짜를 잘 계산하기 위해서) 계산 속성으로
// "2011-07-05T12:00:00Z" ===> "yyyy-MM-dd"

// 서버에서 주는 형태 (ISO규약에 따른 문자열 형태)




