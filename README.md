# TwO-O-Player

## A simple ruby command line game.

### Two-player, turn based game where each player is prompted to answer a mathematical question (sums only for now)

* Each player starts the match with 3 lives.
* Whoever goes first is now randomized (coin toss probabilities)
* Answer correctly, and you keep your current lives, and your opponent goes next.
* Answer wrong, and lose 1 life.
* Game ends when one player reaches 0 lives.
* No input validation (yet). Invalid input defaults to 0 (simple to_i casting)
* Game will not start, and throw an error if either or both player names are empty.