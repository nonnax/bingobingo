#!/usr/bin/env ruby
# Id$ nonnax 2021-12-11 10:03:25 +0800
# let's plays bingo!
# You know what i mean, that it kinda gets tedious if you have more than 10 bingo cards to play with.
# bingobingo lets you play multiple bingo cards at once.
# this makes it easy to watch them win!
#
# what it does: 
# all numbered bingo0NN.csv cards are checked against the bingo_draw.csv
# it then compares the result of the bingo draw to bingo_pattern.csv for winning matches on all your cards
#
# bingo play files created on start-up:
#
# bingo_draw.csv, current nunber calls go here
# bingo_template.csv, <-- create numbered bingo cards based on this. filename: bingo00N.csv 
# bingo_pattern.csv, setup the bingo pattern to watch
#
require 'rubytools'
require 'array_table'
require 'arraycsv'
require 'ansi_color'

def process( card_file )
  card=ArrayCSV.new(card_file)
  draw=ArrayCSV.new('bingo_draw.csv')

  card.dataframe.map do |row|
    row.map do | r | 
      draw.dataframe.flatten.include?(r.to_i) ? "[#{r}]" : r
    end
  end
end

def init
  # random numbers
  df=[]
  df<<%w[B I N G O]
  df<<%w[1 26 35 51 74]
  df<<%w[2 25 31 54 64]
  df<<%w[3 16 FREE 50 68]
  df<<%w[13 19 33 57 73]
  df<<%w[9 23 43 47 69]
  btemplate='bingo_template.csv'
  CSV.open(btemplate, 'w') do |csv|
    df.each do |d|
        csv<<d
    end
  end unless File.exists?(btemplate)

  df=[]
  df<<%w[B I N G O]
  df<<%w[X X X X X]
  df<<[nil,nil,nil,nil,nil]
  df<<[nil,nil,'FREE',nil,nil]
  df<<[nil,nil,nil,nil,nil]
  df<<%w[X X X X X]

  bpattern='bingo_pattern.csv'
  CSV.open(bpattern, 'w') do |csv|
    df.each do |d|
        csv<<d
    end
  end unless File.exists?(bpattern)
  bdraw='bingo_draw.csv'
  File.write(bdraw, '') unless File.exists?(bdraw)
end

def pattern_compare(current)
  result=[]
  target=ArrayCSV.new('bingo_pattern.csv')
  target.dataframe.each_with_index do |row, i|
    result<<row.map.with_index do |e, j|
                (current[i][j].is_a?(String) && !e.nil?) ? e : nil
            end
  end
  [result, target.dataframe]
end


#----------------

init

df2 = process( ARGV.first )

puts df2.to_table delimeter: '  '

Thread.new do
  result, target = pattern_compare(df2)
  puts 'RESULT'
  puts result.to_table delimeter: '  '
  # puts 'TARGET'
  # puts target.to_table

  puts "B I N G O ! " * 3 if result.to_table==target.to_table
end.join

puts '-' * 30
