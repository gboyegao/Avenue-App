//
//  DirectionsDataSource.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 22/02/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation

import UIKit


public class DirectionsDataSource: NSObject {
    let steps: [Step]
    
    init(steps: [Step]) {
        self.steps = steps
    }
    
    func step(at indexPath: IndexPath) -> Step {
        return self.steps[indexPath.row]
    }
}

extension DirectionsDataSource: UITableViewDataSource,UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.steps.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: step(at: indexPath),tableView:tableView,indexPath: indexPath)
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168.0
    }
    
    func cell(for step: Step,tableView: UITableView,indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! DirectionsTableViewCell
       
        cell.update(with: step, stepNumber: indexPath.row)
        return cell
    }
}
