// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

/*
* Author: cmdc0de
* ports:
* 	addr - address location
* 	data - data to put in memory or take out
* 	cs - chip select for low
*
*/
module single_port_rom
	#(
		parameter ADDR_WIDTH = 16
		, parameter DATA_WIDTH = 32
		, parameter DEPTH = 16
	)
	(
		input clk
		, input [ADDR_WIDTH-1:0] addr
		, input cs
		, output reg [DATA_WIDTH-1:0] data
	);

		reg [DATA_WIDTH-1:0] mem[0:DEPTH-1];

		always @(posedge clk) begin
			if(~cs) data <= mem[addr];
		end

		initial begin
			$display("loading");
			$readmemh("rom.hex",mem,0,DEPTH-1);
			$display("done");

			//integer j;
			//for (j=0;x<16;j=j+1) begin 
				$display("TB: addr=0x%h data=0x%h",0,mem[0]);
				$display("TB: addr=0x%h data=0x%h",1,mem[1]);
				$display("TB: addr=0x%h data=0x%h",2,mem[2]);
				$display("TB: addr=0x%h data=0x%h",3,mem[3]);
			//end;
		end
endmodule 

