//
//  FeedController.swift
//  Tweet
//
//  Created by Aaron Cleveland on 8/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        // setting image to fit in view
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
