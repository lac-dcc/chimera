// wishbone.v - wishbone master
// 03-21-19 E. Brombaugh

`default_nettype none

module wishbone(
	input clk,				// system clock
	input rst,				// system reset
	input cs,				// chip select
	input we,				// write enable
	input [7:0] addr,		// register select
	input [7:0] din,		// data bus input
	output reg [7:0] dout,	// data bus output
	output reg rdy,			// low-true processor stall
	
	output reg wb_stbo,			// wishbone STB
	output reg [7:0] wb_adro,	// wishbone Address
	output reg wb_rwo,			// wishbone read/write
	output reg [7:0] wb_dato,	// wishbone data out
	input wb_acki,				// wishbone ACK
	input [7:0] wb_dati			// wishbone data in
	);
	
	// start bus transactions
	reg [3:0] timeout;		// 16-clock timeout counter
	always @(posedge clk)
		if(rst == 1'b1)
		begin
			// clear all at reset
			dout <= 8'h55;
			rdy <= 1'b1;
			timeout <= 4'h0;
			wb_stbo <= 1'b0;
			wb_adro <= 8'h00;
			wb_rwo <= 1'b1;
			wb_dato <= 8'h00;
		end
		else
		begin
			if(rdy == 1'b1)
			begin
				// No transaction pending - start new one
				if(cs == 1'b1)
				begin
					wb_stbo <= 1'b1;
					wb_adro <= addr;
					wb_rwo <= we;
					rdy <= 1'b0;
					timeout <= 4'hf;
					
					if(we == 1'b1)
					begin
						// write cycle
						wb_dato <= din;
					end
				end
			end
			else
			begin
				// Transaction in process
				if((wb_acki == 1'b1) || (|timeout == 1'b0))
				begin
					// finish cycle
					wb_stbo <= 1'b0;
					rdy <= 1'b1;
					if((wb_rwo == 1'b0) && (|timeout == 1'b1))
					begin
						// finish read cycle
						dout <= wb_dati;
					end
				end
				
				// update timeout counter
				timeout <= timeout - 4'h1;
			end
		end
endmodule
