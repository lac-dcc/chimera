// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    reg[3:0]w1,w2,w3,w4;
    decco c0(clk,reset,1,q[3:0]);
    decco c1(clk,reset,ena[1],q[7:4]);
    decco c2(clk,reset,ena[2],q[11:8]);
    decco c3(clk,reset,ena[3],q[15:12]);
    always @(posedge clk) begin
        //ena[0]<=1;
        if(reset)
            ena=3'b000;
        else begin
            ena[1]<=(q[3:0]==4'd8)?1:0;  
          ena[2]<=(q[3:0]==4'd8 && q[7:4]==4'd9)?1:0;
          ena[3]<=(q[3:0]==4'd8 && q[7:4]==4'd9 && q[11:8]==4'd9)?1:0;
        end
    end

endmodule
module decco(
    input clk,
  input reset,
    input ena,
  output reg [3:0] q);
    always @(posedge clk) begin
        if (reset) begin  // Count to 10 requires rolling over 9->0 instead of the more natural 15->0
      q <= 0;
        end else if(ena) begin
            q <=(q==9)?4'd0:q+1;
        end 
    end
    
endmodule
//reset and count kept separate
//all signals to be taken on the clk
