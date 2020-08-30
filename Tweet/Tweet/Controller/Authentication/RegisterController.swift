//
//  RegisterController.swift
//  Tweet
//
//  Created by Aaron Cleveland on 8/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .twitterBlue
    }
}
