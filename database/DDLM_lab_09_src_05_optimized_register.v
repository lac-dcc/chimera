// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License



module register
#(
    parameter SIZE = 32
)
(
    input                       clk,
    input                       rst,
    input      [ SIZE - 1 : 0 ] d,
    output reg [ SIZE - 1 : 0 ] q
);
    always @ (posedge clk or negedge rst)
        if(~rst)
            q <= { SIZE { 1'b0}};
        else
            q <= d;
endmodule
