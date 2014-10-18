def render_tic_tac_toe_board_to_ascii(board)
board.map{|e| e || ' '}.each_slice(3).map{|i| "| " + i.join(" | ") + " |"}.join("\n")
end

# |e| e ? e : " "

# def render_tic_tac_toe_board_to_ascii(board)
# board.map{|e| e ? e : " "}.each_slice(3).to_a.map! {|i| "| " + i.join(" | ") + " |\n"}.join.chomp
# end

# def render_tic_tac_toe_board_to_ascii(board)
#   board_zero = board.map {|e| e ? e : " "}
#   exit_string = "| " + board_zero[0..2].join(" | ") + " |\n| " \
#                      + board_zero[3..5].join(" | ") + " |\n| " \
#                      + board_zero[6..8].join(" | ") + " |"
# end
