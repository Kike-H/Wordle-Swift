//
//  MainView.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 03/09/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var game = Game()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Board(game: game)
                Keyboard(game: game)
            }
            .alert(game.message, isPresented: $game.isMessage){
                VStack {
                    Button("OK", role: .cancel) {}
                }
            }
            .navigationTitle(Text("Wordle"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView().environmentObject(ColorSchemeManager())) {
                        Label("", systemImage: "gear.circle")
                            .font(.system(size: 25))
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
