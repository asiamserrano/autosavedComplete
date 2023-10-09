//
//  GameListView.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/7/23.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var game: Game
    
    init(_ g: Game) { self.game = g }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(game.display).bold()
            HStack {
                DateView(game.released, false)
                Spacer()
                if !game.status { DateView(game.added, true) }
            }
        }
    }
    
    @ViewBuilder
    private func DateView(_ dt: Date, _ isAdd: Bool) -> some View {
        let color: Color = isAdd ? .gray : .black
        let iconName: String = "calendar\(isAdd ? ".badge.plus" : .empty)"
        let size: (CGFloat, CGFloat) = isAdd ? (18, 16) : (20, 20)
        let a = IconView(iconName, size.0, size.1)
        let b = Text(dt.dashes).italicize(isAdd, color)
        HStack(spacing: 8) {
            switch isAdd {
            case false : a;b
            case true: b;a
            }
        }
    }
    
}
