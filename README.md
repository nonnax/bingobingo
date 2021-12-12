## Let's plays bingo!
You know what I mean, that it kinda gets tedious if you have more than 10 bingo cards to play with.
bingobingo lets you play multiple bingo cards at once. 
This makes it easy to watch them win!

All numbered bingo00N.csv cards are checked against the bingo_draw.csv.
Results of the bingo draw are then compared to bingo_pattern.csv for winning matches.

## Bingo play files

1. bingo000.csv
- make numbered bingo cards based on this template. 
- i.e. bingo001.csv, etc

2. bingo_pattern.csv
- the bingo pattern to match

3. bingo_draw.csv 
- current number calls go here.

## How it works?
1. setup bingo cards
   - copy and edit bingo001.csv, 
   - copy each of your bingo card's numbers into a bingoNNN.csv 
2. setup the current pattern to watch 
   - edit bingo_pattern.csv
3. run bingoplay.rb    
   - monitors and displays play changes.
4. put bingo numbers as called into bingo_draw.csv 
   - put one (1) number per line and save. 
   every bingo_draw save shows the card updates.
