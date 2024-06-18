// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module alu_tb;
reg clk;
reg [31:0]r1;
reg [31:0]r2;
reg [3:0]alu_control_decode;
wire [31:0]out;

alu1 u0(clk, r1, r2, alu_control_decode, out);


initial 
begin
	clk = 0;
	forever #5 clk = ~clk;
end
initial 
begin

	//$dumpfile ("alu.vcd");
	//$dumpvars(0,alu_tb);
	
	r1= 32'hF0000000; r2= 32'hF0000066; alu_control_decode = 4'b0001; #7;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd1; alu_control_decode = 4'b0010;#10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd1; alu_control_decode = 4'b0011;#10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'hF0000000; r2= 32'd2; alu_control_decode = 4'b0101;#10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd1; alu_control_decode = 4'b0110; #10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd2; alu_control_decode = 4'b0111; #10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd1; alu_control_decode = 4'b1000; #10;
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
	
	r1= 32'd25; r2= 32'd2; alu_control_decode = 4'b1001; #10
	$display("add r1=%b,r2=%b,alu_control_decode=%b, out=%b", r1, r2, alu_control_decode, out);
end

initial 
begin
	#100;
	$finish;
end

endmodule

