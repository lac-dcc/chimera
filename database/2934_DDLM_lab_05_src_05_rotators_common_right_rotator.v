// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module right_rotator
#( 
    parameter WIDTH = 8,
    parameter SHIFT = 3 //SHIFT specifies the number of bits for shamt argument
)
(
    input  [WIDTH - 1:0] x,
    input  [SHIFT - 1:0] shamt,
    output [WIDTH - 1:0] z
);

    wire [2 * WIDTH - 1:0] temp;
    assign temp = {x, x} >> shamt;
    assign z = temp[WIDTH - 1: 0];
endmodule