//
//  TopAppCollectionViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

import Kingfisher

class TopAppCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topAppImageView: UIImageView!
    @IBOutlet weak var topAppName: UILabel!

    func configure(item: AppResult) {
        topAppName.text = item.name

        if let url = URL(string: item.artworkUrl100) {
            topAppImageView.kf.setImage(with: url)
        }
    }
}
