//
//  BarcodeScanViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/31/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit
import RSBarcodes_Swift

class BarcodeScanViewController: RSCodeReaderViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        self.focusMarkLayer.strokeColor = UIColor.red.cgColor
        self.cornersLayer.strokeColor = UIColor.yellow.cgColor
        self.tapHandler = { point in
            print(point)
        }
        self.barcodesHandler = { barcodes in
            for barcode in barcodes {
                print("Barcode found: type=" + barcode.type + " value=" + barcode.stringValue)
            }
        }
    }
    
//    If you want to ignore some code types (for example, AVMetadataObjectTypeQRCode), add the following lines:
    
//    let types = NSMutableArray(array: self.output.availableMetadataObjectTypes)
//    types.removeObject(AVMetadataObjectTypeQRCode)
//    self.output.metadataObjectTypes = NSArray(array: types)


}
