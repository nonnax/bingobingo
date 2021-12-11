#!/usr/bin/env ruby
# Id$ nonnax 2021-12-11 13:28:25 +0800
# monitors draw.csv for changes and prints the current state of bingo draws on your cards
# on file change the current draw.csv is checked against all the bingo<000>.csv cards found by bingo bash script
#
# run this in the background. 
# afterwards, any update in the bingo_draw.csv
# will trigger it to display the current game numbers
#
draw_file = ARGV.first
draw_file ||='bingo_draw.csv'
start=Time.now
loop do
  Thread.new do
  if File.open(draw_file).mtime>start
    puts IO.popen("clear", &:read) 
    puts IO.popen("ls bingo0*.csv | xargs -L1 ./bingobingo.rb", &:read) 
    puts IO.popen("click.sh", &:read) 
  end
  start=File.open('test', 'w').mtime if File.open(draw_file).mtime>start
  sleep 2
  print '*'
  end.join
end
