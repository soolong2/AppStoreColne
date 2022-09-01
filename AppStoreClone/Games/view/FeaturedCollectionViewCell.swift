//
//  FeaturedCollectionViewCell.swift
//  AppStoreClone
//
//  Created by so on 2022/09/01.
//

import UIKit
import Kingfisher

struct FeaturedCollectionViewCellModel: Hashable {
    enum DownloadStatus {
        case get
        case open
        case cloud
    }
    
    let featuredReason: String
    let title: String
    let subTitle: String
    let mainImageUrl: String
    let appIconOmageUrl: String
    let appName: String
    let appType: String
    let downloadStatus: DownloadStatus
    let hasInAppPurchase: Bool
    
}

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appTypeLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var hasInAppPurchaseLabel: UILabel!
    
    func setModel(_ model:FeaturedCollectionViewCellModel) {
        blueLabel.text = model.featuredReason
        titleLabel.text = model.title
        subTitleLable.text = model.subTitle
        if let url = URL(string: model.mainImageUrl) {
            mainImageView.kf.setImage(with: url)
            mainImageView.layer.cornerRadius = 10
        }
//        appIconImageView.image =
        appNameLabel.text = model.appName
        appTypeLabel.text = model.appType
        switch model.downloadStatus{
        case .get:
            downloadButton.setTitle("GET", for: .normal)
        case .open:
            downloadButton.setTitle("OPEN", for: .normal)
        case .cloud:
            break
        }
        hasInAppPurchaseLabel.isHidden = !model.hasInAppPurchase
    }
}
