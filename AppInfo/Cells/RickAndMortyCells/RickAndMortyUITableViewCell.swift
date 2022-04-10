//
//  RickAndMortyUITableViewCell.swift
//  AppInfo
//
//  Created by Sergey Runovich on 9.04.22.
//

import UIKit

import Kingfisher

class RickAndMortyUITableViewCell: UITableViewCell {

    @IBOutlet private weak var imagePersonImageView: UIImageView!
    @IBOutlet private weak var namePersonLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!

    func configure(item: Results) {
        namePersonLabel.text = item.name
        genderLabel.text = item.gender

        if let urlImage = URL(string: item.image) {
            imagePersonImageView.kf.setImage(with: urlImage)
        }
    }

    // Решил, что библиотека сократит код
//    private func fetchImage(item: [Results], index: Int) {
//        guard let url = URL(string: item[index].image) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, let response = response else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            print(response)
//            guard let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                self.imagePersonImageView.image = image
//            }
//        }.resume()
//    }
}
