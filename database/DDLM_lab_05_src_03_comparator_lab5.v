module lab5
(
	input  [1:0] KEY,
    input  [9:0] SW,
    output [9:0] LEDR
);

    //comparator
    comparator #(.WIDTH(4)) i_comparator
    (
        .x  (SW [3:0]),
        .y  (SW [7:4]),
        .eq (LEDR[0]  ),
        .neq(LEDR[1]  ),
        .lt (LEDR[2]  ),
        .lte(LEDR[3]  ),
        .gt (LEDR[4]  ),
        .gte(LEDR[5]  )
    );
    
    assign LEDR[9:6] = 0;
    
endmodule