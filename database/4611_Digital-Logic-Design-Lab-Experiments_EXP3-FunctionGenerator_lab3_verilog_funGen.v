// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
`define pulse 2'b0
`define triangle 2'b01
`define rham 2'b10
`define sin 2'b11 

module funGen(sel,clk,rst,out);
  input [1:0] sel;
  input clk,rst;
  output reg [7:0] out;
  wire [7:0] cnt_num,pulse,tri_out,rham,sin,rampb_out;
  Counter cnt1(clk,rst,cnt_num);
  triangle triangle1(cnt_num,tri_out);
  GenPulse pulse1(cnt_num,pulse);
  ramb rham_boy( cnt_num, rampb_out);
  always @(cnt_num,rst,sel) begin
    out = 8'b0;
    case (sel)
      `pulse: out = pulse;
      `triangle: out = tri_out;
      `rham: out = rampb_out;
	   default: out = pulse;
    endcase
	if(rst) out=8'b0;
  end
endmodule

module GenPulse(cnt_num,pulse);
  input [7:0] cnt_num;
  output [7:0] pulse;
  assign pulse = (cnt_num <= 127) ? 8'b0 : 8'b11111111;
endmodule

module Counter(clk,rst,cnt_num);
  input rst,clk;
  output reg [7:0] cnt_num;
  always @(posedge clk,rst) begin
    if(rst) cnt_num <= 8'b0;
	else  cnt_num <= cnt_num + 1;
  end
endmodule
module triangle( input [7:0] cnt, output reg [7:0] out);
  
  always@(cnt) begin
    if (cnt < 8'b 10000000)
      out <= ( cnt << 1 ) ;
   else
      out <=  8'd 255 - ((cnt - 8'b10000000)<<1);
  
  end
  
endmodule

module ramb(input [7:0] cnt, output [7:0] out);
	assign out = (cnt < 8'd128) ? 	( cnt[0] ? (cnt + 8'd127) : -(cnt + 8'd127) ) :
						( cnt[0] ? (8'd255 - (cnt - 8'd127)) :  -(8'd255 - (cnt - 8'd127)) );	
endmodule

module RomCounter(clk,rst,inc_val,cnt_num);
  input rst,clk;
  input [1:0] inc_val;
  output reg [7:0] cnt_num;
  always @(posedge clk,rst) begin
    if(rst) cnt_num <= 8'b0;
	else  cnt_num <= {6'b0,inc_val} + cnt_num ;
  end
endmodule

module mux_2to1(a,b,out,sel);
	input [7:0] a,b;
	output [7:0] out;
	input sel;
	assign out = (sel==1'b0) ? a : b;


endmodule

module Amp(num,sel,out);
	input [7:0] num;
	output [7:0] out;
	input [1:0] sel;
	assign out = (sel==2'b00) ? num : 
					(sel==2'b01) ? num<<1 : 
						(sel==2'b10) ? num <<2: num << 3;


endmodule

module Dac(clk,rst,in,out);
	input clk,rst;
	input [7:0] in;
	reg cnt_num;
	output reg out;
	always@(rst,posedge clk) begin
		if(rst) cnt_num <= 8'b0;
		else cnt_num <= cnt_num + 1;
	end
	always@(cnt_num) begin
		if(cnt_num < in)
			out = 1'b1;
		else
			out = 1'b0;
	end


endmodule


