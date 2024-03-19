`timescale 1ns / 1ps
module FP_to_posit_tb_v;

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N=32;
parameter E=8;
parameter Bs=log2(N);
parameter es = 4;

reg [N-1:0] in;
reg clk;

wire [N-1:0] out;

// Instantiate the Unit Under Test (UUT)
FP_to_posit #(.N(N), .E(E), .es(es)) d1 (
	.in(in), 
	.out(out) 
	);


	initial begin
		// Initialize Inputs
		clk = 1;
		// Wait 100 ns for global reset to finish
		#101 in = 32'h0080ffff;
		#325150 
		$fclose(outfile);
		$finish;
	end
	
always #5 clk=~clk;
always @(posedge clk) begin
	if (in < 32'h7f7fffff)
		in <= in + 65535;
end

integer outfile;
initial outfile = $fopen("FP_to_posit_out.txt", "wb");
  always @(negedge clk) begin
     $fwrite(outfile, "%h\t%h\n",in,out);
  end

endmodule

