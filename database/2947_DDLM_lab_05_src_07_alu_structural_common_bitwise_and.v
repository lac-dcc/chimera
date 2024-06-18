// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module bitwise_and
#( 
    parameter WIDTH = 8
)
(
    input  [WIDTH - 1:0] x,y,
    output [WIDTH - 1:0] z
);
    assign z = x & y;
endmodule