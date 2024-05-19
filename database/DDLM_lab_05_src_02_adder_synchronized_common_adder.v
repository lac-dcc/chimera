// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module adder
#( 
    parameter WIDTH = 8
)
(
    input  [WIDTH - 1:0] x, y,    
    input  carry_in,
    output [WIDTH - 1:0] z,
    output carry_out
);
    assign {carry_out, z} = x + y + carry_in;
endmodule