// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module lab5
(
    input  [9:0] SW,
    output [9:0] LEDR
);

	full_adder i_full_adder_behavioral
    (
        .carry_in (SW[0]  ),
        .x        (SW[1]  ),
        .y        (SW[2]  ),
        .z        (LEDR[0]),
        .carry_out(LEDR[1])
    );
    
    full_adder_structural i_full_adder_structural
    (
        .carry_in (SW[3] ),
        .x        (SW[4]  ),
        .y        (SW[5]  ),
        .z        (LEDR[3]),
        .carry_out(LEDR[4])
    );
    
    assign LEDR[2]   = 0;
    assign LEDR[9:5] = 0;

endmodule
