def displayPathtoPrincess(n, grid)
  return false if n == 0 && grid.empty?

  bot_position = getBotPosition(n, grid)
  princess_position = findPrincessPosition(n, grid)

  bot = bot_position.flatten!
  princess = princess_position.flatten!

  (0...(bot[0] - princess[0]).abs).each  do 
    puts 'DOWN'
  end if bot[0] < princess[0]

  (0...(bot[0] - princess[0]).abs).each  do
    puts 'UP'
  end if bot[0] > princess[0]

  (0...(bot[1] - princess[1]).abs).each  do
    puts 'LEFT'
  end if bot[1] > princess[1]

  (0...(bot[1] - princess[1]).abs).each  do
    puts 'RIGHT'
  end  if bot[1] < princess[1]
  
end

# Find out the next move of Bot towards Princess
def nextMove(n,r,c,grid)
  return false if n == 0 && grid.empty?

  bot_position = getBotPosition(n, grid)
  princess_position = findPrincessPosition(n, grid)

  bot = bot_position.flatten!
  princess = princess_position.flatten!

  return false unless bot[0] == r
  if bot[0] < princess[0]
    puts 'DOWN'
  elsif bot[0] > princess[0]
    puts 'UP'
  elsif bot[1] > princess[1]
    puts 'LEFT'
  elsif bot[1] < princess[1]
    puts 'RIGHT'
  end
end

# Find princess position in grid
def findPrincessPosition(n, grid)
  return calculate_position_coordinates(n, grid, 'p')
end

# Find position of bot in grid
def getBotPosition(n, grid)
  return calculate_position_coordinates(n, grid, 'm')
end

# This function will return grid cell position like [[3], [1]]
def calculate_position_coordinates(n, grid, character)
  which_row = []
  which_cell = []
  (0...n).each do |i|
    grid[i].split('').each_with_index do |k ,index|
      if k == character
        which_row << i
        which_cell << index
      end 
    end
  end
  return which_row, which_cell
end

## Test Cases for problem Hacker Rank - Bot saves princess
## Test Case 1
# displayPathtoPrincess(3, ['p--', '-m-', '---'])

## Test Case 2
# displayPathtoPrincess(3, ['---', '-m-', 'p--'])

## Test Case 3
# displayPathtoPrincess(5, ['----p', '-----', '-----', '-----', '---m-'])

## Test Case 4
# displayPathtoPrincess(0, [])

#######################################################################################
## Test Cases for problem Hacker Rank - Bot saves princess - 2
## Test Case 1
# nextMove(5,2,3,["-----", "-----", "p--m-", "-----", "-----"])

## Test Case 2
# nextMove(5,2,2,["-----", "-----", "--m--", "-----", "p----"])

## Test Case 3
# nextMove(5,1,0,["---p-", "m----", "-----", "-----", "-----"])