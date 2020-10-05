//
//  UIImageviewExtension.swift
//  demo
//
//  Created by Mizanur Remon on 3/10/20.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imageUrl: String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
