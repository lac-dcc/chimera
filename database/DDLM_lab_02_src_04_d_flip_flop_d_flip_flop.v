// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module d_flip_flop
(
    input   clk,
    input   d,
    output  reg q
);

    always @ (posedge clk)
        q <= d;
 
endmodule
