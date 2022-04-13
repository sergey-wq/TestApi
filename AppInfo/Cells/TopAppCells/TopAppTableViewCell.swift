//
//  TopAppTableViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

class TopAppTableViewCell: UITableViewCell {

    @IBOutlet private weak var mainCollectionView:
        UICollectionView! {
        didSet {
            mainCollectionView.register(TopAppCollectionViewCell.self)
            mainCollectionView.delegate = self
            mainCollectionView.dataSource = self
        }
    }
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    var appResult: [AppResult] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        alamofireFetcherData()
    }

    func alamofireFetcherData() {
        NetworkManager.shared.fetchDataWithAlamofireTopApp(Link.topApplicationURL.rawValue) { result in
            switch result {
            case .success(let hero):
                self.appResult = hero

                self.mainCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TopAppTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appResult.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(TopAppCollectionViewCell.self, for: indexPath)
        cell?.configure(item: appResult[indexPath.row])

        return cell ?? UICollectionViewCell()
    }
}
