// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Memory (dummy, not software configurable)

module mem_dummy_sram(
	input clk,
	output SRAM_CE, SRAM_OE, SRAM_WE, SRAM_UB, SRAM_LB,
	output [17:0] SRAM_A,
	inout [15:0] SRAM_D,
	input [0:3] nb_,
	input [0:15] ad_,
	output [0:15] ddt_,
	input [0:15] rdt_,
	input w_, r_, s_,
	output ok_
);

	// chip and bytes always enabled
	assign SRAM_CE = 0;
	assign SRAM_UB = 0;
	assign SRAM_LB = 0;
	assign SRAM_WE = ~we;
	assign SRAM_OE = ~oe;
	assign ok_ = ~(ok & (~r_ | ~w_));

	`define IDLE		0
	`define	READ		1
	`define WRITE		2
	`define OK			3
	reg [1:0] state = `IDLE;
	reg we, oe, ok;
	reg [0:15] rd_data;
	always @ (posedge clk) begin
		case (state)

			`IDLE: begin
				if (~r_) begin
					state <= `READ;
					oe <= 1;
				end else if (~w_) begin
					state <= `WRITE;
					we <= 1;
				end
			end
	
			`READ: begin
				rd_data <= SRAM_D;
				ok <= 1;
				state <= `OK;
			end
	
			`WRITE: begin
				we <= 0;
				ok <= 1;
				state <= `OK;
			end
	
			`OK: begin
				oe <= 0;
				if (r_ & w_) begin
					ok <= 0;
					state <= `IDLE;
				end
			end

		endcase
	end

	// address lines
	assign SRAM_A[17:0] = {2'b00, ~ad_};

	// data lines
	assign SRAM_D = we ? ~rdt_ : 16'hzzzz;
	assign ddt_ = ~r_ ? ~rd_data : 16'hffff;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
