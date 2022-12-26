//
//  DynamicCell.swift
//  DynamicCellExample
//
//  Created by Work on 26/12/2022.
//

import UIKit

class DynamicCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
      let myView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        myView.backgroundColor = .red
        addSubview(myView)
    }

}
