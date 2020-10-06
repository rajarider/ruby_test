require 'pry'

def sudoku_method(sudoku)
  
  sudoku.each do |row|
    return false if !number_arr(row)
  end

  col_arr = {}
  (0..8).each do |i|
    col_arr[i] = []
  end

  sudoku.each do |row|
    row.each_with_index do |col, index|
      col_arr[index].push(col)
    end
  end


  col_arr.each do |key, value|
    return false if !number_arr(value)
  end

  cube_arr = {}
  (0..8).each do |i|
    cube_arr[i] = []
  end

  sudoku.each_with_index do |row, i|
    row.each_with_index do |col, j|
      dec = ((i / 3) * 3 ) + (j / 3)
      cube_arr[dec].push(col)
    end
  end

  cube_arr.each do |key, value|
    return false if !number_arr(value)
  end

  return true
end

def number_arr(arr)
  (1..9).to_a == arr.sort
end
a = [
  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
    ]

b = [
  [ 1, 1, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
  ]

p sudoku_method(a)
p sudoku_method(b)
