export function generatePlayers(numberOfPlayers: number = 512) {
    const players = [];
    let iteration = 0;
    for (let i = 0; i < numberOfPlayers; i++) {

      const name = `^${iteration}^~Player^r ^*Name^r ^_Example^r`;
      iteration++;
      if (iteration > 9) {
        iteration = 0;
      }

      players.push({ id: i, name: name });
    }
    return players;
  } 