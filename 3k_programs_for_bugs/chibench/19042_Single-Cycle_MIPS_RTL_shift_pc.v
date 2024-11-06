// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module SHIFT_PC 
(
    input   wire[25:0]  in,
    output  wire[27:0]  out
);

    assign out = {in, 2'b0};
    
endmodule
