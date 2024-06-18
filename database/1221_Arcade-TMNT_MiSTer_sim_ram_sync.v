// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

`timescale 1ns/100ps

module ram_sync_sim(
	address,
	nwe,
	clk,
	din,
	dout
);

parameter integer dataBits = 8;
parameter integer addrBits = 11;
parameter initFile = "";

input [addrBits-1:0] address;
input nwe;
input clk;
input [dataBits-1:0] din;
output reg [dataBits-1:0] dout;

integer i, f_init;
wire [dataBits-1:0] d_init;
reg [dataBits-1:0] data[0:(2**addrBits)-1];

initial begin
	if (initFile != "") begin
		/*f_init = $fopen(initFile, "rb");
		 for (i = 0; i < (2**addrBits); i=i+1) begin
			$fread(d_init, f_init);
			 data[i] <= d_init;
		end
		$fclose(f_init);*/
		$readmemh(initFile, data);
	end else begin
		// Clear to zero
		for (i = 0; i < (2**addrBits); i=i+1) begin
			data[i] <= {dataBits{1'b0}};
		end
	end
end

always @(posedge clk) begin
	if (!nwe) begin
		#1 data[address] <= din;
		dout <= data[address];
	end
end

endmodule
