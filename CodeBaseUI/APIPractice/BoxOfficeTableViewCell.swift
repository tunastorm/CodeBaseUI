//
//  BoxOfficeTableViewCell.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    
    let movieRankLabel = UILabel()
    let movieNameLabel = UILabel()
    let movieOpenDate = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // MarketTableViewCell의 contentView에 추가하는 코드
        confighierarchy()
        configLayout()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confighierarchy() {
        contentView.addSubview(movieRankLabel)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(movieOpenDate)
    }
    
    func configLayout() {
        movieRankLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(50)
            $0.leading.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(5)
        }
        movieNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.verticalEdges.equalToSuperview().inset(5)
            $0.leading.equalTo(movieRankLabel.snp.trailing).offset(10)
        }
        movieOpenDate.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.height.equalTo(80)
            $0.verticalEdges.equalToSuperview().inset(5)
            $0.leading.equalTo(movieNameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
    }
    
    func configUI() {
        self.backgroundColor = .clear
        
        movieRankLabel.font = .boldSystemFont(ofSize: 15)
        movieRankLabel.backgroundColor = .white
        movieRankLabel.textAlignment = .center
        
        movieNameLabel.textAlignment = .left
        movieNameLabel.font = .boldSystemFont(ofSize: 14)
        movieNameLabel.textColor = .white
        
        movieOpenDate.textColor = .white
        movieOpenDate.textAlignment = .right
        movieOpenDate.font = .systemFont(ofSize: 10)
    }
    
    func configCell(_ data: DailyBoxOfficeList) {
        movieRankLabel.text = "\(data.rank)"
        movieNameLabel.text = "\(data.movieNm)"
        movieOpenDate.text = "\(data.openDt)"
    }
}
