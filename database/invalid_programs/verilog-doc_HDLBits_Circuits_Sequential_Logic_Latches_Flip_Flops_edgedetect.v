// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] temp;
    reg [2:0] i;
    always @(posedge clk) begin
        for(i=0;i<=7;i=i+1) begin
            if((temp[i] == 0) && (in[i] == 1)) begin
                pedge[i] = 1;
            end
            else begin
                pedge[i] = 0;
            end
            temp[i] = in[i];
        end
    end
endmodule

/*
* Offical Solution:
*
* module top_module(
*	input clk,
*	input [7:0] in,
*   output reg [7:0] pedge);
*
*	reg [7:0] d_last;
*
*	always @(posedge clk) begin
*		d_last <= in;			// Remember the state of the previous cycle
*		pedge <= in & ~d_last;	// A positive edge occurred if input was 0 and is now 1.
*	end
*
*  endmodule
*/
