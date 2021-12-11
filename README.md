## Let's plays bingo!
You know what I mean, that it kinda gets tedious if you have more than 10 bingo cards to play with.
bingobingo lets you play multiple bingo cards at once. 
This makes it easy to watch them win!

All numbered bingo00N.csv cards are checked against the bingo_draw.csv.
Results of the bingo draw are then compared to bingo_pattern.csv for winning matches.

## Bingo play files
- bingo_draw.csv 
current number calls go here.

- bingo000.csv
make numbered bingo cards based on this template. 
i.e. bingo001.csv, etc

- bingo_pattern.csv
the bingo pattern to match

## How it works?
- setup bingo cards & current pattern to watch.
- run bingoplay.rb to start monitoring play changes.
every change to bingo_draw.csv show the card updates.
