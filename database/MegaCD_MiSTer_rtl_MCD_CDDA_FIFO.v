module CDDA_FIFO
(
	input      CLK,
	input      nRESET,
	input      RD,
	input      WR,
	input      [31:0] DIN,
	output     FULL,
	output     EMPTY,
	output     WRITE_READY,
	output reg [31:0] Q

);

localparam SECTOR_SIZE = 2352*8/32;
localparam BUFFER_AMOUNT = 5 * 1024*8/32;

reg OLD_WRITE, OLD_READ;

reg [12:0] FILLED_COUNT;
reg [12:0] READ_ADDR, WRITE_ADDR;

wire WRITE_REQ = ~OLD_WRITE & WR;
wire READ_REQ = ~OLD_READ & RD;

assign FULL = (FILLED_COUNT == BUFFER_AMOUNT);
assign EMPTY = ~|FILLED_COUNT;
assign WRITE_READY = (FILLED_COUNT <= (BUFFER_AMOUNT - SECTOR_SIZE)); // Ready to receive sector

always @(posedge CLK or negedge nRESET) begin
	if (~nRESET) begin
		OLD_WRITE <= 0;
		OLD_READ <= 0;
		READ_ADDR <= 0;
		WRITE_ADDR <= 0;
		FILLED_COUNT <= 0;
	end else begin
		OLD_WRITE <= WR;
		OLD_READ <= RD;

		if (WRITE_REQ) begin
			if (WRITE_ADDR == BUFFER_AMOUNT-1) begin
				WRITE_ADDR <= 0;
			end else begin
				WRITE_ADDR <= WRITE_ADDR + 1'b1;
			end
		end

		if (READ_REQ) begin
			if (READ_ADDR == BUFFER_AMOUNT-1) begin
				READ_ADDR <= 0;
			end else begin
				READ_ADDR <= READ_ADDR + 1'b1;
			end
			Q <= BUFFER_Q;
		end

		FILLED_COUNT <= FILLED_COUNT + WRITE_REQ - READ_REQ;
	end
end

reg [31:0] BUFFER[BUFFER_AMOUNT];
reg [31:0] BUFFER_Q;
always @(posedge CLK) begin
	BUFFER_Q <= BUFFER[READ_ADDR];
	if (WRITE_REQ) begin
		BUFFER[WRITE_ADDR] <= DIN;
	end
end

endmodule
