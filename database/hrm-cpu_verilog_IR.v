// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

// Instruction Register
module IR (
        input clk,              // clock
        input [7:0] nIR,
        // control signals
        input wIR,                // enable signal
        input rst,
        // output: register value
        output reg [7:0] rIR
    );

    always @(posedge clk) begin
        if(rst)
          rIR <= 8'b 0;
        else
          if(wIR) begin
            rIR <= nIR;
          end
    end

endmodule
