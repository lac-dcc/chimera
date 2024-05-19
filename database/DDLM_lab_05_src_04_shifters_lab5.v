// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
	 input  [9:0] SW,
    output [9:0] LEDR
);

    //left shifter
    left_shifter #(.WIDTH(4)) i_left_shifter
    (
        .x    (SW  [3:0]),
        .shamt(SW  [9:8]),
        .z    (LEDR[3:0])
    );

    //right shifter
    right_shifter #(.WIDTH(4)) i_right_shifter
    (
        .x    (SW  [7:4]),
        .shamt(SW  [9:8]),
        .z    (LEDR[9:6])
    );
    
    assign LEDR[5:4] = 0;
endmodule