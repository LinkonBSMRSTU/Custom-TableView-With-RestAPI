//
//  PhotoTableViewCell.swift
//  demo
//
//  Created by Fazle Rabbi Linkon on 5/10/20.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var photoview: UIImageView!
    @IBOutlet private weak var photolabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var photo: Photo! {
        didSet{
            self.photolabel.text = self.photo.title
            self.photoview?.setImage(imageUrl: self.photo.url)
        }
    }
    
}
