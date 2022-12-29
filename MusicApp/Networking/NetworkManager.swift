//
//  NetworkManager.swift
//  MusicApp
//
//  Created by 박다미 on 2022/12/29.
//

import Foundation

//MARK: - 네트워크에서 발생할 수 있는 에러 정의

//MARK: - Networking (서버와 통신하는) 클래스 모델

// 실제 Request하는 함수 (비동기적 실행 ===> 클로저 방식으로 끝난 시점을 전달 받도록 설계)

// 받아본 데이터 분석하는 함수 (동기적 실행)
    // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
    // (JSON 데이터 ====> MusicData 구조체)
