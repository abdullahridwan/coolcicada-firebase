//
//  Styles.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import Foundation
import SwiftUI


struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
