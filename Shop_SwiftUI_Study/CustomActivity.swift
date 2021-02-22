//
//  CustomActivity.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 22.02.2021.
//

import SwiftUI

class CustomActivity: UIActivity {
    
    // MARK: Properties
    var customActivityType: UIActivity.ActivityType
    var activityName: String
    var activityImageName: String
    var customActionWhenTapped: () -> Void
    
    // MARK: - Initializer
    init(title: String, imageName: String, performAction: @escaping () -> Void) {
        self.activityName = title
        self.activityImageName = imageName
        self.customActivityType = UIActivity.ActivityType(rawValue: "Action \(title)")
        self.customActionWhenTapped = performAction
        super.init()
    }
    
    // MARK: - Overrides
    override var activityType: UIActivity.ActivityType? {
        return customActivityType
    }
    
    override var activityTitle: String? {
        return activityName
    }
    
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    override var activityImage: UIImage? {
        return UIImage(named: activityImageName)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        //Nothing to prepare
    }
    
    override func perform() {
        customActionWhenTapped()
    }
}
