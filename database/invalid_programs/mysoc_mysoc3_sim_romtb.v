// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "single_port_rom.v"

`timescale 1ns/1ns

module romtb();
	parameter ADDR_WIDTH=16;
	parameter DATA_WIDTH=32;
	parameter DEPTH=16;

	reg clk;
	reg cs;
	reg [ADDR_WIDTH-1:0] addr;
	wire [DATA_WIDTH-1:0] data;

	single_port_rom #( .DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH) )
		  rom0 (.clk(clk), .addr(addr), .cs(cs), .data(data) );

	always #1 clk = ~clk;

	integer j;
	initial begin
		$dumpfile("out/romtb.vcd");
		$dumpvars(2,romtb);
		{clk, addr} <=0;
		{cs} <= 1;

		repeat (2) @ (posedge clk);
		$display("TB: addr=0x%h data=0x%h cs=0x%h",addr,data,cs);

		for (j=0;j<DEPTH;j=j+1) begin 
		//for (j=0;j<10;j=j+1) begin 
			repeat (1) @(posedge clk) begin 
				addr<=j;cs<=0;
			end
			repeat (1) @ (posedge clk);
			#2;
			if(j<10) begin
				$display("TB: addr=0x%h data=0x%h cs=0x%h",addr,data,cs);
			end
		end

		#10 $finish;
	end
endmodule

