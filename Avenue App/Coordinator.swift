//
//  Coordinator.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 03/03/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator{
    var navigationController:UINavigationController{ get set }
    var childCoordinators:[Coordinator] { get set }
    func start()
}

