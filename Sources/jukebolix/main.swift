let player = TestPlayer()
while(true) {
    print("\n")
    print("Qual id da música? (p para pausar)")
    print("\n")
    guard let line = readLine() else {
        continue
    }
    let operation = Operation(id: line)
    player.execute(operation)
}


