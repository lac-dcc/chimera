// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

`include "single_port_ram.v"

`timescale 1ns/1ns

module memtb();
	parameter ADDR_WIDTH=16;
	parameter DATA_WIDTH=32;
	parameter DEPTH=32;

	reg clk;
	reg cs, we, oe;
	reg [ADDR_WIDTH-1:0] addr;
	wire [DATA_WIDTH-1:0] data;
	reg [DATA_WIDTH-1:0] tb_data;

	single_port_ram #( .DATA_WIDTH(DATA_WIDTH), .DEPTH(DEPTH) )
		  mem0 (.clk(clk), .addr(addr), .data(data), .cs(cs), .we(we), .oe(oe));

	always #10 clk = ~clk;
	assign data = oe ? tb_data : 'hz;

	integer i,j;
	initial begin
		$dumpfile("out/memtb.vcd");
		$dumpvars(2,memtb);
		{clk, addr, tb_data} <=0;
		{cs, we, oe} <= 1;

		repeat (2) @ (posedge clk);

		//$display("time=%0t we=0x%0h cs=0x%0h oe=0x0%0h data=%0b tbData=%0b",
		//		  $time, we, cs, oe, data, tb_data);
		for (i=0;i<2**ADDR_WIDTH;i=i+1) begin 
		//for (i=0;i<10;i=i+1) begin 
			repeat (1) @(posedge clk) begin
				addr<=i;we<=0;cs<=0;oe<=1;tb_data<=$random;
			end
			repeat (1) @ (posedge clk);
			#2;
			if(i<10) begin
				$display("TB: addr=0x%h data=0x%h tb_data=0x%h",addr,data, tb_data);
			end
		end

		#50;
		$display("===");
		for (j=0;j<2**ADDR_WIDTH;j=j+1) begin 
		//for (j=0;j<10;j=j+1) begin 
			repeat (1) @(posedge clk) addr<=j;we<=1;cs<=0;oe<=0;
			repeat (1) @ (posedge clk);
			#2;
			if(j<10) begin
				$display("TB: addr=0x%h data=0x%h we=0x%h cs=0x%h oe=0x%h",addr,data,we,cs,oe);
			end
		end

		#20 $finish;
	end
endmodule

