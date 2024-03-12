`timescale 1ns / 1ps

module TB_RELU;

reg [21:0] a_t;
reg clk;
reg enable_t;
reg read_strobe_t;
wire [21:0] out_t;
wire write_strobe_t;


RELU1 uut(
 .a(a_t),
 .clk(clk),
 .enable(enable_t),
 .read_strobe(read_strobe_t),
 .out(out_t),
 .write_strobe(write_strobe_t)
   );

always #5 clk=~clk;
initial begin
            
           enable_t = 1;
           clk = 0;
           read_strobe_t=1;
           #10;
           a_t = -22'd869;
           #10;
           a_t = 22'd869;
           #10;
           a_t = -22'd877;
   end
endmodule



