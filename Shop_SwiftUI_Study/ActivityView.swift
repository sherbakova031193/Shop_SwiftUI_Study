//
//  ActivityView.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 22.02.2021.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
