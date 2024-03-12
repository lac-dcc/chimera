module CacheLine #(parameter
	CACHE_LINE_WIDTH = 6,
	TAG_WIDTH = 20
	`define OFFSET_WIDTH (CACHE_LINE_WIDTH-2)
) (
	// Clock and reset
	input  wire nrst,
	input  wire clk,

	output wire [TAG_WIDTH-1:0]     rd_tag,
	input  wire [`OFFSET_WIDTH-1:0] rd_off,
	output reg  [31:0]              rd_data,
	output wire                     rd_dirty,
	output wire                     rd_valid,

	input  wire                     wr_write,
	input  wire [TAG_WIDTH-1:0]     wr_tag,
	input  wire [`OFFSET_WIDTH-1:0] wr_off,
	input  wire [31:0]              wr_data,
	input  wire [3:0]               wr_byte_enable,
	input  wire                     wr_dirty,
	input  wire                     wr_valid
);

	// Storage
	reg [TAG_WIDTH-1:0] tag;
	reg [31:0] data[2**`OFFSET_WIDTH - 1 : 0];
	reg dirty;
	reg valid;
	reg [31:0] dout;

	// Reading data
	assign rd_tag = tag;
	assign rd_dirty = valid ? dirty : 0;
	assign rd_valid = valid;

	// Resetting or writing data
	always @(posedge clk, negedge nrst) begin
		if (~nrst) begin : rst_data
			// Resetting
			dirty <= 1'b0;
			valid <= 1'b0;
			tag   <= 0;

		end else if (wr_write) begin
			// Writing data
			tag   <= wr_tag;
			dirty <= wr_dirty;
			valid <= wr_valid;

		end else begin
			// rd_data = valid ? data[rd_off] : 0;
		end
	end

	integer k;
	always @(posedge clk) begin : proc_bram
		if(wr_write) begin
			for(k=0; k<4; k=k+1)
				if (wr_byte_enable[k]) begin
					data[wr_off][k*8 +: 8] <= wr_data[k*8 +: 8];
				end
		end else begin 
			dout <= data[rd_off];
		end
	end

	always @(*) begin
		rd_data = valid ? dout : 0;
	end

endmodule
