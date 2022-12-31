//
//  ViewController.swift
//  MusicApp
//
//  Created by 박다미 on 2022/12/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    //서치 컨트롤러 생성 네비게이션 아이템에 할당
    let searchController = UISearchController()

    // 네트워크 매니저 (싱글톤)
    var networkManager = NetworkManager.shared
    
    // (음악 데이터를 다루기 위함) 빈배열로 시작
    var musicArrays: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셋팅
        setupSearchBar()
        setupTableView()
        setupDatas()
    }
    
    //서치바 세팅
    func setupSearchBar(){
        self.title = "Music Search"
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        //첫글자 대문자 설정제거
        searchController.searchBar.autocapitalizationType = .none
        
        
    }
    
    // 테이블뷰 셋팅
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.musicCellIdentifier) //"MusicCell"대신 Cell구조체 nameSpace 사용
        
    }
    
    // 데이터 셋업
    func setupDatas() {
        //네트워킹 시작
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            switch result {
            case .success(let musicDatas):
                //1. 데이터(배열)을 받아오고 난 후
                self.musicArrays = musicDatas
                //2. Reload 해야 빈배열에 배열 채워짐
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        
            
        }
        
        
    }

}
extension ViewController: UISearchBarDelegate{
    // 유저가 글자를 입력하는 순간마다 호출되는 메서드
    func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
    // 1.다시 빈 배열로 만들기
        self.musicArrays = []
        
        //2.네트워킹 시작
        networkManager.fetchMusic(searchTerm: searchText){result in
            switch result {
            case .success(let musicDatas):
                self.musicArrays = musicDatas
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - // 검색(Search) 버튼을 눌렀을때 호출되는 메서드입력

    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        //cell 설정
        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.releaseDateLabel.text = musicArrays[indexPath.row].releaseDateString
        cell.selectionStyle = .none
        return cell
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    // 테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    // (musicTableView.rowHeight = 120 대신에 사용가능)
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
    
    //높이가 유동적이고 더 정확함
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

