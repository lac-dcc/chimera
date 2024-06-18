// This program was cloned from: https://github.com/Revenantx86/TinyTPU
// License: MIT License

module mac #
(
    parameter D_W = 16
)
(   
    input  wire               clk,         // Clock
    input  wire               rst,         // reset
    input  wire               init,        // Initalize first op
    input  wire [D_W-1:0]     in_x,        // Input from X axis
    input  wire [D_W-1:0]     in_y,        // Input from Y axis
    output reg  [D_W-1:0]     out_x,       // x axis input passthrough
    output reg  [D_W-1:0]     out_y,       // y axis input passthrough
    output reg  [(2*D_W-1):0] out_z,       // Output for the sum
    output reg                out_init     // Init passthrough
);
//
always @(posedge clk) begin
    //
    out_x <= in_x;
    out_y <= in_y;
    out_init <= init;
    //
    if(rst) begin                       // Reset
        out_z <= 0;                     
        out_y <= 0;
        out_x <= 0;
        out_init <= 0;
    end
    //
    else if(init)
        out_z <= in_x * in_y;           // Multiply & Override 
    //
    else
        out_z <= out_z + (in_x* in_y);  // Multiply & Accumulate
    //
end
//
endmodule