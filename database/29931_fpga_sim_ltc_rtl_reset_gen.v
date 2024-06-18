// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

/**
 * Synchronous Reset Signal Generator
 */

module reset_gen(
    input  wire clk,        // Input Clock
    output wire reset_n     // Reset Flag
);

    reg [15:0] x = 16'h0000;
    always @(posedge clk)
        x <= {x[14:0], 1'b1};
    
    assign reset_n = x[15];

endmodule;
