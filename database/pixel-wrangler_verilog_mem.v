/* Ensure RAM-like behaviour */
module ram(
	// read domain
	input rd_clk,
	input [ADDR_WIDTH-1:0] rd_addr,
	output [DATA_WIDTH-1:0] rd_data,
	// write domain
	input wr_clk,
	input wr_enable,
	input [ADDR_WIDTH-1:0] wr_addr,
	input [DATA_WIDTH-1:0] wr_data,
);
	parameter ADDR_WIDTH=8;
	parameter DATA_WIDTH=8;
	parameter NUM_WORDS = 1 << ADDR_WIDTH;

	reg [DATA_WIDTH-1:0] mem[0:NUM_WORDS-1];
	reg [DATA_WIDTH-1:0] rd_data;

        //initial $readmemh("packed0.hex", mem);
        initial $readmemh("fb-init.hex", mem);

	always @(posedge rd_clk)
		rd_data <= mem[rd_addr];
	//assign rd_data = mem[rd_addr];

	always @(posedge wr_clk)
		if (wr_enable)
			mem[wr_addr] <= wr_data;
endmodule

