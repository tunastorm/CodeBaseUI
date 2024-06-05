//
//  NeflixViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//

import UIKit
import SnapKit

class NetflixViewController: UIViewController {
    
    lazy var mainImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "노량")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    lazy var coverImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    lazy var firstHotImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "더퍼스트슬램덩크")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    lazy var secondHotImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "오펜하이머")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var thirdHotImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "콘크리트유토피아")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    lazy var playImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "play_normal")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var topImageView1 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    lazy var topImageView2 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    lazy var topImageView3 = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top10 badge")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var playButton = {
        let button = UIButton()
        return button
    }()
    lazy var pickButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle("내가 찜한 콘텐츠", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.imageView?.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0,
                                             bottom: 0, right: 10)
        button.layer.cornerRadius = 5        
        return button
    }()
    
    lazy var descLabel = {
        let label = UILabel()
        label.text = "응원하고픈 | 흥미진진 | 전투 | 사극 | 한국작품"
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var hotLabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.textColor = .white
        return label
    }()
    
    
    let mainView = UIView()
    let hotView = UIView()
    let mainImageArea = UIView()
    let mainButtonArea = UIView()
    let hotImageArea1 = UIView()
    let hotImageArea2 = UIView()
    let hotImageArea3 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configNavigationBar()
        configHierarchy()
        configLayout()
    }
}


extension NetflixViewController {
    func configNavigationBar() {
        navigationItem.title = "고래밥님"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func configHierarchy() {
        // 같은 SuperView를 공유하는 객체들끼리 처리
        [mainView, hotView].forEach{
            view.addSubview($0)
        }
        mainView.addSubview(mainImageArea)
   
        [hotLabel, hotImageArea1, hotImageArea2, hotImageArea3].forEach{
            hotView.addSubview($0)
        }
        
        [mainImageView, coverImageView, mainButtonArea].forEach{
            mainImageArea.addSubview($0)
        }
        
        [firstHotImageView, topImageView1].forEach{
            hotImageArea1.addSubview($0)
        }
        
        [secondHotImageView, topImageView2].forEach{
            hotImageArea2.addSubview($0)
        }
        
        [thirdHotImageView, topImageView3].forEach{
            hotImageArea3.addSubview($0)
        }
        
        [descLabel, playImageView, playButton, pickButton, ].forEach{
            mainButtonArea.addSubview($0)
        }
        
    }
    
    func configLayout() {
        mainView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.height.equalTo(view.frame.height * 0.6)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        hotView.snp.makeConstraints{
            $0.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(mainView.snp.bottom)
        }
        mainImageArea.snp.makeConstraints{
            $0.horizontalEdges.equalTo(mainView.snp.horizontalEdges).inset(20)
            $0.verticalEdges.equalTo(mainView.snp.verticalEdges).offset(5)
        }
        hotLabel.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.top.leading.equalToSuperview().inset(5)
        }
        
        let hotXInset = (view.safeAreaLayoutGuide.layoutFrame.width - 60) * 0.3333
        hotImageArea1.snp.makeConstraints{
            $0.width.equalTo(hotXInset)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(hotLabel.snp.bottom).offset(10)
        }
        hotImageArea2.snp.makeConstraints{
            $0.width.equalTo(hotXInset)
            $0.height.equalTo(hotImageArea1)
            $0.leading.equalTo(hotImageArea1.snp.trailing).offset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        hotImageArea3.snp.makeConstraints{
            $0.width.equalTo(hotXInset)
            $0.height.equalTo(hotImageArea2)
            $0.leading.equalTo(hotImageArea2.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(10)
        }
        mainImageView.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        coverImageView.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        firstHotImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        secondHotImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        thirdHotImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        topImageView1.snp.makeConstraints{
            $0.height.equalToSuperview().multipliedBy(0.25)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.trailing.top.equalToSuperview()
        }
        topImageView2.snp.makeConstraints{
            $0.height.equalToSuperview().multipliedBy(0.25)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.trailing.top.equalToSuperview()
        }
        topImageView3.snp.makeConstraints{
            $0.height.equalToSuperview().multipliedBy(0.25)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.trailing.top.equalToSuperview()
        }
        mainButtonArea.snp.makeConstraints{
            $0.height.equalTo(70)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        descLabel.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        playImageView.snp.makeConstraints{
            $0.height.equalTo(25)
            $0.width.equalTo(150)
            $0.top.equalTo(descLabel).offset(30)
            $0.leading.bottom.equalToSuperview()
        }
        pickButton.snp.makeConstraints{
            $0.height.equalTo(25)
            $0.width.equalTo(150)
            $0.top.equalTo(descLabel).offset(30)
            $0.trailing.bottom.equalToSuperview()
        }
    
    }
}
