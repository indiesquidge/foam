//
//  CoffeeDetailView.swift
//  foam
//
//  Created by austin_wood on 2/21/21.
//

import SwiftUI

let formatter = NumberFormatter()

struct CoffeeDetailView: View {
    let coffee: Coffee

    var coffeeIngredients: [String] {
        Array(coffee.ratio.keys.sorted {
            coffee.ratio[$0]! > coffee.ratio[$1]!
        })
    }

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Spacer()
                GeometryReader { geo in
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    VStack(spacing: 0) {
                        Spacer()
                        .frame(minWidth: 0, minHeight:0)
                        ForEach(coffeeIngredients, id: \.self) { ingredient in
                            Rectangle()
                                .fill(coffee.getIngredientColorView(ingredient: ingredient))
                                .frame(height: geo.size.height * CGFloat(coffee.getIngredientRatio(ingredient: ingredient)))
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                .frame(width: 200, height: 200)
                Spacer()
            }

            Text("The \(coffee.name)")
                .font(.largeTitle)
                .navigationBarTitle(Text(coffee.id), displayMode: .inline)
                .padding(.bottom)

            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.headline)
                    .padding(.bottom, 0.8)
                ForEach(coffeeIngredients, id: \.self) { ingredient in
                    HStack {
                        Text("\(formatPercent(from: coffee.ratio[ingredient]))")
                        Text(ingredient)
                    }
                }
            }
            .padding(.bottom)

            VStack(alignment: .leading) {
                Text("Description")
                    .font(.headline)
                    .padding(.bottom, 0.8)
                Text(coffee.description)
                    .padding(.bottom)
            }
        }
        .padding(.horizontal)
    }
}

func formatPercent(from decimal: Double?) -> String {
    formatter.numberStyle = .percent
    formatter.minimumIntegerDigits = 1
    formatter.maximumIntegerDigits = 3
    formatter.maximumFractionDigits = 2

    return formatter.string(from: NSDecimalNumber(decimal: Decimal(decimal ?? 0))) ?? "0"
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static let coffees: [Coffee] = Bundle.main.decode("coffees.json")
    static var previews: some View {
        CoffeeDetailView(coffee: coffees[1])
    }
}
