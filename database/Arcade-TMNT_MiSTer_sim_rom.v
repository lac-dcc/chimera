// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

`timescale 1ns/100ps

module rom_sim(
	address,
	dout
);

parameter integer dataBits = 8;
parameter integer addrBits = 11;
parameter initFile = "";

input [addrBits-1:0] address;
output reg [dataBits-1:0] dout;

integer i, f_init;
wire [dataBits-1:0] d_init;
reg [dataBits-1:0] data[0:(2**addrBits)-1];

initial begin
	/*f_init = $fopen(initFile, "rb");
    for (i = 0; i < (2**addrBits); i=i+1) begin
		$fread(d_init, f_init);
	    data[i] <= d_init;
	end
	$fclose(f_init);*/
	$readmemh(initFile, data);
end

always @(*) begin
	#1 dout <= data[address];
end

endmodule
