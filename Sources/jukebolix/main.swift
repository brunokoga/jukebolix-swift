let playerFactory: PlayerFactory = TestPlayerFactory()
let player: Player = playerFactory.createPlayer()

while(true) {
    print("\n")
    print("Qual id da música? (s para parar)")
    print("\n")
    guard let line = readLine() else {
        continue
    }
    let operation = Operation(id: line)
    player.execute(operation)
}
