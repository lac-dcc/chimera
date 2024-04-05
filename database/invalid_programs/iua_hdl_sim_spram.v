module SB_SPRAM256KA_SIM (
	input [13:0] ADDRESS,
	input [15:0] DATAIN,
	input [3:0] MASKWREN,
	input WREN,
	input CHIPSELECT,
	input CLOCK,
	input STANDBY,
	input SLEEP,
	input POWEROFF,
	output [15:0] DATAOUT
);

	reg [15:0] mem[0:16383];
	reg [15:0] do;

	always @(posedge CLOCK)
	begin
		do <= mem[ADDRESS];
		if (WREN)
			mem[ADDRESS] <= DATAIN;
	end

	assign DATAOUT = do;

endmodule
