//
//  ViewController.swift
//  AppStoreClone
//
//  Created by so on 2022/08/29.
//

import UIKit

class GamesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Int, FeaturedCollectionViewCellModel>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource<Int,FeaturedCollectionViewCellModel>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath)
            (cell as? FeaturedCollectionViewCell)?.setModel(itemIdentifier)
            return cell
        })
        
        collectionView.collectionViewLayout = createFeaturedListLayout()
        
        var snapShot = NSDiffableDataSourceSnapshot<Int, FeaturedCollectionViewCellModel>()
        snapShot.appendSections([0])
        snapShot.appendItems([FeaturedCollectionViewCellModel(featuredReason: "사전예약", title: "원산2", subTitle: "원신을뛰어넘는게임", mainImageUrl: "https://picsum.photos/300", appIconOmageUrl: "", appName: "원신2", appType: "RPG", downloadStatus: .get, hasInAppPurchase: true),
                              FeaturedCollectionViewCellModel(featuredReason: "추천하는", title: "나랜디", subTitle: "나루토를뛰어넘는게임", mainImageUrl: "https://picsum.photos/301", appIconOmageUrl: "", appName: "나랜디", appType: "워크3", downloadStatus: .get, hasInAppPurchase: true),
                              FeaturedCollectionViewCellModel(featuredReason: "좋아하는", title: "롤2", subTitle: "롤을뛰어넘는게임", mainImageUrl: "https://picsum.photos/302", appIconOmageUrl: "", appName: "롤2", appType: "MMORPG", downloadStatus: .open, hasInAppPurchase: true),
                              FeaturedCollectionViewCellModel(featuredReason: "비추하는", title: "드래곤볼", subTitle: "원숭이뛰어넘는게임", mainImageUrl: "https://picsum.photos/304", appIconOmageUrl: "", appName: "드래곤볼", appType: "롤플레잉", downloadStatus: .get, hasInAppPurchase: true),
                              FeaturedCollectionViewCellModel(featuredReason: "새로나온", title: "원랜디", subTitle: "루피를뛰어넘는게임", mainImageUrl: "https://picsum.photos/305", appIconOmageUrl: "", appName: "원랜디", appType: "워크3", downloadStatus: .get, hasInAppPurchase: true)], toSection: 0)
                              
                             
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
    
    func createFeaturedListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionView.frame.width - 60), heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        let laout = UICollectionViewCompositionalLayout(section: section)
        return laout
    }
    
}
    

extension GamesViewController: UICollectionViewDelegate {
    
}


