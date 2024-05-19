// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"

`define maxWait     `WAIT_SIZE'd1_000_000

module counter(
input                       clk,
input	                    clkLock,
output reg                  countDone
);

reg [`WAIT_SIZE-1:0]  waitcount;

always @(posedge clk) begin
    if (clkLock == 1'b0) begin
        countDone 		<= 1'b0;
        waitcount 	    <= `WAIT_SIZE'd0;
    end else begin		
        waitcount       <= (waitcount < `maxWait) ? waitcount + `WAIT_SIZE'd1 : `WAIT_SIZE'd0;
        if (waitcount > `WAIT_SIZE'd50) begin
            countDone   <= 1'b1;
        end else begin
            countDone   <= 1'b0;
        end
    end
end
endmodule

	