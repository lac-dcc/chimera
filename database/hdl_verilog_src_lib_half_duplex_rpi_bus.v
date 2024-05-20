// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2021-03-17 by mza
// based on mza-test047.simple-parallel-interface-and-pollable-memory.althea.revBL.v
// last updated 2022-10-19 by mza

module half_duplex_rpi_bus #(
	parameter BUS_WIDTH = 16,
	parameter LOG2_OF_BUS_WIDTH = $clog2(BUS_WIDTH),
	parameter TRANSACTIONS_PER_DATA_WORD = 2,
	parameter LOG2_OF_TRANSACTIONS_PER_DATA_WORD = $clog2(TRANSACTIONS_PER_DATA_WORD),
	parameter TRANSACTIONS_PER_ADDRESS_WORD = 1,
	parameter LOG2_OF_TRANSACTIONS_PER_ADDRESS_WORD = $clog2(TRANSACTIONS_PER_ADDRESS_WORD),
	parameter BANK_ADDRESS_DEPTH = BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD,
	parameter LOG2_OF_NUMBER_OF_BANKS = BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD - BANK_ADDRESS_DEPTH,
	parameter NUMBER_OF_BANKS = 2**LOG2_OF_NUMBER_OF_BANKS,
	parameter ADDRESS_AUTOINCREMENT_MODE = 1,
	parameter ERROR_COUNT_PICKOFF = 7,
	parameter ANTI_META = 3, // a lot of these state machines check against something[PICKOFF:PICKOFF-1]==2'b00, so we need at least 3 here
	parameter GAP = 0,
	parameter EXTRA_PICKOFF = 1
) (
	input clock,
	input reset,
	inout [BUS_WIDTH-1:0] bus,
	input read, // 0=write; 1=read
	input register_select, // 0=address; 1=data
	input enable, // 1=active; 0=inactive
	output ack_valid,
	output reg [NUMBER_OF_BANKS-1:0] write_strobe = 0,
	output [NUMBER_OF_BANKS-1:0] read_strobe,
	output [BUS_WIDTH*TRANSACTIONS_PER_DATA_WORD-1:0] write_data_word,
	input [BUS_WIDTH*TRANSACTIONS_PER_DATA_WORD-1:0] read_data_word,
	output reg [BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD-1:0] address_word_reg = 0,
	output reg [ERROR_COUNT_PICKOFF:0] read_errors = 0,
	output reg [ERROR_COUNT_PICKOFF:0] write_errors = 0,
	output reg [ERROR_COUNT_PICKOFF:0] address_errors = 0,
	output [LOG2_OF_NUMBER_OF_BANKS-1:0] bank
);
	localparam OTHER_PICKOFF                    = ANTI_META + EXTRA_PICKOFF;
	localparam ENABLE_PIPELINE_PICKOFF          = OTHER_PICKOFF + GAP;
	localparam REGISTER_SELECT_PIPELINE_PICKOFF = OTHER_PICKOFF;
	localparam READ_PIPELINE_PICKOFF            = OTHER_PICKOFF;
	localparam BUS_PIPELINE_PICKOFF             = OTHER_PICKOFF;
	genvar i;
	integer j;
	reg pre_ack_valid = 0;
	reg [REGISTER_SELECT_PIPELINE_PICKOFF:0] register_select_pipeline = 0;
	reg [READ_PIPELINE_PICKOFF:0] read_pipeline = 0;
	reg [ENABLE_PIPELINE_PICKOFF:0] enable_pipeline = 0;
	reg [BUS_WIDTH-1:0] bus_pipeline [BUS_PIPELINE_PICKOFF:0];
	reg [1:0] astate = 0;
	wire [TRANSACTIONS_PER_ADDRESS_WORD*BUS_WIDTH-1:0] address_word;
	reg [BUS_WIDTH-1:0] address [TRANSACTIONS_PER_ADDRESS_WORD-1:0];
	for (i=0; i<TRANSACTIONS_PER_ADDRESS_WORD; i=i+1) begin : address_array
		assign address_word[(i+1)*BUS_WIDTH-1:i*BUS_WIDTH] = address[i];
	end
	reg [LOG2_OF_TRANSACTIONS_PER_ADDRESS_WORD-1:0] aword = TRANSACTIONS_PER_ADDRESS_WORD-1; // most significant halfword first
	assign bank = address_word_reg[BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD-1 -: LOG2_OF_NUMBER_OF_BANKS];
	reg [1:0] wstate = 0;
	//wire [TRANSACTIONS_PER_DATA_WORD*BUS_WIDTH-1:0] write_data_word;
	reg [BUS_WIDTH-1:0] write_data [TRANSACTIONS_PER_DATA_WORD-1:0];
	for (i=0; i<TRANSACTIONS_PER_DATA_WORD; i=i+1) begin : write_data_array
		assign write_data_word[(i+1)*BUS_WIDTH-1:i*BUS_WIDTH] = write_data[i];
	end
	reg [LOG2_OF_TRANSACTIONS_PER_DATA_WORD-1:0] wword = TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
	//wire [TRANSACTIONS_PER_DATA_WORD*BUS_WIDTH-1:0] read_data_word;
	reg ready_for_new_read_data_word = 0;
`define READ_DATA_IS_REGTYPE
`ifndef READ_DATA_IS_REGTYPE
		wire [BUS_WIDTH-1:0] read_data [TRANSACTIONS_PER_DATA_WORD-1:0];
		for (i=0; i<TRANSACTIONS_PER_DATA_WORD; i=i+1) begin : read_data_array
			assign read_data[i] = read_data_word[(i+1)*BUS_WIDTH-1:i*BUS_WIDTH];
		end
`endif
`ifdef READ_DATA_IS_REGTYPE
		reg [BUS_WIDTH-1:0] read_data [TRANSACTIONS_PER_DATA_WORD-1:0];
		for (i=0; i<TRANSACTIONS_PER_DATA_WORD; i=i+1) begin : read_data_array
			always @(posedge clock) begin
				if (reset) begin
					read_data[i] <= 0;
				end else begin
					if (enable_pipeline[ENABLE_PIPELINE_PICKOFF:ENABLE_PIPELINE_PICKOFF-1]==2'b00) begin // enable=0
						if (ready_for_new_read_data_word) begin
							read_data[i] <= read_data_word[(i+1)*BUS_WIDTH-1:i*BUS_WIDTH];
						end
					end
				end
			end
		end
`endif
	reg [1:0] rstate = 0;
	for (i=0; i<NUMBER_OF_BANKS; i=i+1) begin : bank_read_strobes
		assign read_strobe[i] = bank==i ? rstate[1] : 1'b0;
	end
	reg [LOG2_OF_TRANSACTIONS_PER_DATA_WORD-1:0] rword = TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
	reg [BUS_WIDTH-1:0] pre_bus = 0;
	always @(posedge clock) begin
		pre_ack_valid <= 0;
		write_strobe <= 0;
		if (reset) begin
			ready_for_new_read_data_word <= 0;
			register_select_pipeline <= 0;
			read_pipeline <= 0;
			enable_pipeline <= 0;
			bus_pipeline[0] <= 0;
//			checksum <= 0;
			astate <= 0;
			address_word_reg <= 0;
			for (j=0; j<TRANSACTIONS_PER_ADDRESS_WORD; j=j+1) begin : address_clear
				address[j] <= 0;
			end
			aword <= TRANSACTIONS_PER_ADDRESS_WORD-1; // most significant halfword first
			wstate <= 0;
			for (j=0; j<TRANSACTIONS_PER_DATA_WORD; j=j+1) begin : write_data_clear
				write_data[j] <= 0;
			end
			wword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
			rstate <= 0;
			rword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
			read_errors <= 0;
			write_errors <= 0;
			address_errors <= 0;
			pre_bus <= 0;
		end else begin
			if (enable_pipeline[ENABLE_PIPELINE_PICKOFF:ENABLE_PIPELINE_PICKOFF-1]==2'b01) begin
				ready_for_new_read_data_word <= 0;
			end else if (enable_pipeline[ENABLE_PIPELINE_PICKOFF:ENABLE_PIPELINE_PICKOFF-1]==2'b11) begin // enable=1
				if (read_pipeline[READ_PIPELINE_PICKOFF:READ_PIPELINE_PICKOFF-1]==2'b11) begin // read mode
					pre_ack_valid <= 1;
					if (rstate[1]==0) begin
						if (rstate[0]==0) begin
							rstate[0] <= 1;
							pre_bus <= read_data[rword];
						end
					end
				end else if (read_pipeline[READ_PIPELINE_PICKOFF:READ_PIPELINE_PICKOFF-1]==2'b00) begin // write mode
					if (register_select_pipeline[REGISTER_SELECT_PIPELINE_PICKOFF:REGISTER_SELECT_PIPELINE_PICKOFF-1]==2'b11) begin // register_select=1 means data
						pre_ack_valid <= 1;
						if (wstate[1]==0) begin
							if (wstate[0]==0) begin
								wstate[0] <= 1;
								write_data[wword] <= bus_pipeline[BUS_PIPELINE_PICKOFF];
							end
						end
					end else if (register_select_pipeline[REGISTER_SELECT_PIPELINE_PICKOFF:REGISTER_SELECT_PIPELINE_PICKOFF-1]==2'b00) begin // register_select=0 means address
						pre_ack_valid <= 1;
						if (astate[1]==0) begin
							if (astate[0]==0) begin
								astate[0] <= 1;
								address[aword] <= bus_pipeline[BUS_PIPELINE_PICKOFF];
							end
						end
					end
				end
			end else if (enable_pipeline[ENABLE_PIPELINE_PICKOFF:ENABLE_PIPELINE_PICKOFF-1]==2'b00) begin // enable=0
				if (ADDRESS_AUTOINCREMENT_MODE) begin
					if (rstate[1] || wstate[1]) begin
						address_word_reg <= address_word_reg + 1'b1;
					end
				end
				if (wstate) begin
					if (rstate || rword!=TRANSACTIONS_PER_DATA_WORD-1) begin
						rstate <= 0;
						read_errors <= read_errors + 1'b1;
						rword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
					end
					if (astate || aword!=TRANSACTIONS_PER_ADDRESS_WORD-1) begin
						astate <= 0;
						address_errors <= address_errors + 1'b1;
						aword <= TRANSACTIONS_PER_ADDRESS_WORD-1; // most significant halfword first
					end
					if (wstate[1]) begin
						ready_for_new_read_data_word <= 1;
						wstate <= 0;
						wword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
						//if (write_data_word==32'h31231507) begin
//						if (write_data_word[15:0]==16'h1507) begin
//							checksum <= 1;
//						end else begin
//							checksum <= 0;
//						end
					end else begin
						wstate[0] <= 0;
						if (|wword) begin
							wword <= wword - 1'b1;
						end else begin
							wstate[1] <= 1;
							write_strobe[bank] <= 1;
						end
					end
				end
				if (rstate) begin
					if (wstate || wword!=TRANSACTIONS_PER_DATA_WORD-1) begin
						wstate <= 0;
						write_errors <= write_errors + 1'b1;
						wword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
					end
					if (astate || aword!=TRANSACTIONS_PER_ADDRESS_WORD-1) begin
						astate <= 0;
						address_errors <= address_errors + 1'b1;
						aword <= TRANSACTIONS_PER_ADDRESS_WORD-1; // most significant halfword first
					end
					if (rstate[1]) begin
						ready_for_new_read_data_word <= 1;
						rstate <= 0;
						rword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
					end else begin
						rstate[0] <= 0;
						if (|rword) begin
							rword <= rword - 1'b1;
						end else begin
							rstate[1] <= 1;
						end
					end
				end
				if (astate) begin
					if (wstate || wword!=TRANSACTIONS_PER_DATA_WORD-1) begin
						wstate <= 0;
						write_errors <= write_errors + 1'b1;
						wword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
					end
					if (rstate || rword!=TRANSACTIONS_PER_DATA_WORD-1) begin
						rstate <= 0;
						read_errors <= read_errors + 1'b1;
						rword <= TRANSACTIONS_PER_DATA_WORD-1; // most significant halfword first
					end
					if (astate[1]) begin
						ready_for_new_read_data_word <= 1;
						astate <= 0;
						aword <= TRANSACTIONS_PER_ADDRESS_WORD-1; // most significant halfword first
						address_word_reg <= address_word;
					end else begin
						astate[0] <= 0;
						if (|aword) begin
							aword <= aword - 1'b1;
						end else begin
							astate[1] <= 1;
						end
					end
				end
			end
			register_select_pipeline <= { register_select_pipeline[REGISTER_SELECT_PIPELINE_PICKOFF-1:0], register_select };
			read_pipeline            <= {                       read_pipeline[READ_PIPELINE_PICKOFF-1:0], read };
			enable_pipeline          <= {                   enable_pipeline[ENABLE_PIPELINE_PICKOFF-1:0], enable };
			bus_pipeline[0] <= bus;
		end
	end
	for (i=1; i<BUS_PIPELINE_PICKOFF+1; i=i+1) begin : bus_pipeline_thing
		always @(posedge clock) begin
			if (reset) begin
				bus_pipeline[i] <= 0;
			end else begin
				bus_pipeline[i] <= bus_pipeline[i-1];
			end
		end
	end
	assign ack_valid = pre_ack_valid;
	bus_entry_3state #(.WIDTH(BUS_WIDTH)) my3sbe (.I(pre_bus), .O(bus), .T(read)); // we are peripheral
endmodule

