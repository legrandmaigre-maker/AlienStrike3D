import SwiftUI

struct ContentView: View {
      @State private var showGame = false
      @State private var showMainMenu = true

      var body: some View {
                ZStack {
                              if showMainMenu {
                                                MainMenuView(onPlayTapped: {
                                                                      withAnimation {
                                                                                                showMainMenu = false
                                                                                                showGame = true
                                                                      }
                                                })
                              }

                              if showGame {
                                                GameViewControllerRepresentable(onGameOver: { score in
                                                                                                                 withAnimation {
                                                                                                                                           showGame = false
                                                                                                                                           showMainMenu = true
                                                                                                                 }
                                                                                            })
                                                .ignoresSafeArea()
                              }
                }
                .statusBarHidden(true)
      }
}

struct GameViewControllerRepresentable: UIViewControllerRepresentable {
      let onGameOver: (Int) -> Void

      func makeUIViewController(context: Context) -> GameViewController {
                let controller = GameViewController()
                controller.onGameOver = onGameOver
                return controller
      }

      func updateUIViewController(_ uiViewController: GameViewController, context: Context) {}
}

#Preview {
      ContentView()
}
