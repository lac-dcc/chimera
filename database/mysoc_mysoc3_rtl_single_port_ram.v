// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

/*
* Author: cmdc0de
* ports:
* 	clk
* 	addr - address location
* 	data - data to put in memory or take out
* 	cs - chip select for low
* 	we - write enable move data from data to mem
* 	oe - output enable moves from memory to data output
*
*/
module single_port_ram
	#(
		parameter ADDR_WIDTH = 16
		, parameter DATA_WIDTH = 32
		, parameter DEPTH = 16
	)
	(
		input clk
		, input [ADDR_WIDTH-1:0] addr
		, inout [DATA_WIDTH-1:0] data
		, input cs
		, input we
		, input oe
	);

		reg [DATA_WIDTH-1:0] tmp_data;
		reg [DATA_WIDTH-1:0] mem[DEPTH];

		//chip selected and write enabled move data to memory
		always @(posedge clk) begin
			//$display("cs=0x%h we=0x%h",cs,we);
			if(~cs & ~we & oe) begin 
				mem[addr] <= data;
				//$display("RAM: INPUT: data = 0x%h addr=0x%h mem=0x%h",data, addr, mem[addr]);
			end
		end

		//chip selected and output enabled moved memory to data lines
		always @(posedge clk) begin
			if(~cs & ~oe & we) begin 
				tmp_data <= mem[addr];
				//$display("RAM: OUTPUT data = 0x%h addr=0x%h mem=0x%h",tmp_data, addr, mem[addr]);
			end
		end

		//if chip selected and output enabled set data to output lines
		//else chip is selected set data lines to data lines
		//else if chip is not selected set lines to HiZ
		assign data = (~cs & ~oe & we) ? tmp_data : 'hz;
endmodule 

