// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
    input  [9:0] SW,
    output [9:0] LEDR
);

	half_adder i_half_adder_behavioral
    (
        .x        (SW[0]  ),
        .y        (SW[1]  ),
        .z        (LEDR[0]),
        .carry_out(LEDR[1])
    );
    
    half_adder_structural i_half_adder_structural
    (
        .x        ( SW[2]  ),
        .y        ( SW[3]  ),
        .z        ( LEDR[2]),
        .carry_out( LEDR[3])
    );
    
    assign LEDR[9:4] = 0;

endmodule
