//
//  AppSnackBar.swift
//  Flash Chat iOS13
//
//  Created by Matthias Van Woensel on 29/06/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import SnackBar_swift

class AppSnackBar: SnackBar {

    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .red
        style.textColor = .white
        return style
    }
}
