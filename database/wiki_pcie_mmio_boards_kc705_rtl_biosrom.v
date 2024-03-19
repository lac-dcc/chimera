module biosrom (
	input clk,
	input en,
	input [8:0] addr,
	output reg [31:0] data
);

reg [31:0] rom [0:511];

initial begin
`ifdef SIMULATION
	$readmemh("../../../software/biosrom/biosrom.d32", rom, 0, 511);
`else
	$readmemh("./biosrom.d32", rom, 0, 511);
`endif
end

always @(posedge clk) begin
	if (en)
		data <= rom[ addr ];
end

endmodule
