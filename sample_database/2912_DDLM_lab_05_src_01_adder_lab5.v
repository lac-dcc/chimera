// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
    input  [9:0] SW,
    output [9:0] LEDR
);
    //WIDTH	no greater than 4
    parameter WIDTH = 2;
    
	 //adder
    adder #(.WIDTH(WIDTH)) i_adder
    (
        .carry_in (SW [0]                  ),
        .x        (SW [WIDTH:1]            ),
        .y        (SW [2 * WIDTH:WIDTH + 1]),
        .z        (LEDR[2 * WIDTH - 1:0]   ),
        .carry_out(LEDR[9]                 )
    );
    
    assign LEDR[8:2 * WIDTH] = 0;
    
endmodule
