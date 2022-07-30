//
//  ListCell.swift
//  CoreAnimationDemo
//
//  Created by Chanti on 30/07/22.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let titles : [String] = [
        "Change Background Color",
        "Add New Layer",
        "Add Corner Radius",
        "Add Shadow",
        "Animate Implicitly",
        "Animate Explicitly",
        "Rotate 3D"
    ]
    
    let colors : [UIColor] = [
        .black,
        .blue,
        .cyan,
        .gray,
        .green,
        .systemPink,
        .brown
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(index: Int) {
        colorView.backgroundColor = colors[index]
        titleLabel.text = titles[index]
    }
    
}
