//
//  Coffee.swift
//  foam
//
//  Created by austin_wood on 2/21/21.
//

import Foundation
import SwiftUI

struct Coffee: Decodable, Identifiable {
    let id: String
    let name: String
    let description: String
    let ratio: Dictionary<String, Double>
    let foam: Bool

    func getIngredientRatio(ingredient: String) -> Double {
        return ratio[ingredient] ?? 0
    }

    func getIngredientColorView(ingredient: String) -> Color {
        switch ingredient {
        case "water":
            return Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        case "espresso":
            return Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1))
        case "milk":
            return Color(#colorLiteral(red: 0.947870791, green: 1, blue: 0.9564360976, alpha: 1))
        case "foam":
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.65))
        case "chocolate":
            return Color(#colorLiteral(red: 0.1952494681, green: 0.1283693612, blue: 0.02787670866, alpha: 1))
        default:
            return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
        }
    }
}
