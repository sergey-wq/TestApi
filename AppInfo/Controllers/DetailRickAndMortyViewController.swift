//
//  DetailRickAndMortyViewController.swift
//  AppInfo
//
//  Created by Sergey Runovich on 10.04.22.
//

import UIKit

import Kingfisher

class DetailRickAndMortyViewController: UIViewController {

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var imagePersonImageView: UIImageView!

    var personInfo: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        idLabel.text = "id: \(personInfo?.id ?? 0)"
        locationNameLabel.text = personInfo?.location.name

        if let url = URL(string: personInfo?.image ?? "") {
            imagePersonImageView.kf.setImage(with: url)
        }
    }
}
