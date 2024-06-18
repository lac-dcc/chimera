// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

//https://electronics.stackexchange.com/questions/102646/how-to-efficiently-implement-a-single-output-pulse-from-a-long-input-on-altera
`ifndef __SYNCHRONIZER__
`define __SYNCHRONIZER__
module sync(
input wire clock,
input wire i,
output wire o
);
    reg r1, r2, r3;
    initial begin
      r1=0;
      r2=0;
      r3=0;
    end

    always @(posedge clock) begin
        r1 <= i;    // first stage of 2-stage synchronizer
        r2 <= r1;       // second stage of 2-stage synchronizer
        r3 <= r2;       // edge detector memory
    end
    assign o = (!r2 && r3);
endmodule
`endif
