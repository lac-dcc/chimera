`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer: anxu chan
// 
// Create Date:    16:17:14 08/02/2017 
// Design Name:    FIR filter
// Module Name:    fir 
// Project Name:   FirDesign
// Target Devices: Xilinix V5
// Description: test bench
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module fir_tb;

	// Inputs
	reg clk;
	reg rst;
	reg signed [15:0] filter_in;

	// Outputs
	wire signed [31:0] filter_out;

	// Instantiate the Unit Under Test (UUT)
	fir uut (
		.clk(clk), 
		.rst(rst), 
		.filter_in(filter_in), 
		.filter_out(filter_out)
	);

	// define reset time
	initial begin
		rst = 0;
		#15;
		rst = 1;
	end

	// define clock
	initial begin
		clk = 0;
		forever #10 clk = ~clk;	
	end

	// define a ram store input signal
	reg signed[15:0] mem[241:0];
	// read data from disk
	initial begin
		$readmemb("E:/MatlabProject/databin.mem" , mem);
	end

	// send data to filter
	integer i=0;
	initial begin
		#15;
		for(i = 0 ; i < 242 ; i = i+1) begin
			filter_in = mem[i];
			#20;
		end	
	end

	// write data to txt File
	integer file;
	integer cnt=0;
	initial begin
		file = $fopen("dataout1.txt" , "w");
	end

	// write data was filtered by fir to txt file 
	always @(posedge clk) begin
		$fdisplay(file , filter_out);
	end

	always @(posedge clk) begin
		$display("data out (%d)------> : %d ," , cnt, filter_out);
		cnt = cnt + 1;
		if (cnt == 250) begin
			#20 $fclose(file);
			rst = 0;
			#20 $stop;
		end
	end
	
endmodule

