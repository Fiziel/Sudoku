ROWS = 9          
COLUMNS = 9       
SUB_MATRIX = 3
 
def is_conditions_meet (matrix, row, column, inumber)

    for i in 0..ROWS - 1 do 
        if matrix[row][i] == inumber
            return false
        end
    end

    for i in 0..COLUMNS - 1 do
        if matrix[i][column] == inumber
            return false
        end
    end

    startRow = row - row % SUB_MATRIX
    startCol = column - column % SUB_MATRIX
    for i in 0..SUB_MATRIX - 1 do
        for j in 0..SUB_MATRIX - 1 do
            if (matrix[i + startRow][j + startCol] == inumber)
                return false
            end
        end
    end

    true
end

def print_matrix(matrix)
    for i in 0..ROWS - 1 do
        for j in 0..COLUMNS - 1 do
            print "#{matrix[i][j]} "
        end
        puts 
    end
end

def sudoku(matrix, row, column)

    if (row == ROWS-1 && column == COLUMNS)
        return true
    end

    if column == COLUMNS 
        column = 0
        row += 1
    end

    if (matrix[row][column] != 0)
        return sudoku(matrix, row, column + 1)
    end

    for digit in 1..9 do
        if (is_conditions_meet(matrix, row, column, digit))
            matrix[row][column] = digit

            if (sudoku(matrix, row, column + 1))
                return true
            end
        end


        matrix[row][column] = 0
    end
    
    false
end

grid = [[ 0, 1, 0, 5, 0, 8, 4, 0, 0 ],
        [ 0, 2, 0, 0, 0, 0, 0, 0, 0 ],
        [ 0, 8, 7, 0, 0, 0, 0, 3, 1 ],
        [ 2, 0, 3, 0, 1, 0, 0, 8, 0 ],
        [ 9, 0, 0, 8, 6, 3, 0, 0, 5 ],
        [ 0, 5, 0, 0, 9, 0, 6, 0, 0 ],
        [ 1, 3, 0, 0, 0, 0, 2, 5, 0 ],
        [ 0, 0, 0, 0, 0, 0, 0, 7, 4 ],
        [ 0, 0, 5, 2, 0, 6, 3, 0, 0 ] ]

print_matrix(grid)
puts 
sudoku(grid, 0, 0)
print_matrix(grid)
