//
//  ProtocolUploadImage.swift
//  InstaWithoutDBAndCloud
//
//  Created by 王文琪 on 4/18/23.
//

import Foundation
import UIKit

protocol ProtocolUploadImage{
    
    func uploadImageDelegate(img: UIImage, locationImg: String, titleImg: String)
        
    
}
