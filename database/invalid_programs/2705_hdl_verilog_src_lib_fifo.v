// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// last updated 2024-04-12 by mza

`ifndef FIFO_LIB
`define FIFO_LIB

`include "generic.v"
`include "RAM8.v"

module handshake_fifo #(
	parameter ACKNOWLEDGE_PICKOFF_EARLY = 3,
	parameter ACKNOWLEDGE_PICKOFF_LATE = ACKNOWLEDGE_PICKOFF_EARLY + 3
) (
	input clock, reset,
	input acknowledge,
	input fifo_empty,
	output reg fifo_read_strobe = 0,
	output reg output_strobe = 0
);
	reg [ACKNOWLEDGE_PICKOFF_LATE:0] acknowledge_pipeline = 0;
	always @(posedge clock) begin
		fifo_read_strobe <= 0;
		if (reset) begin
			output_strobe <= 0;
			acknowledge_pipeline <= 0;
		end else begin
			if (acknowledge_pipeline[ACKNOWLEDGE_PICKOFF_EARLY:ACKNOWLEDGE_PICKOFF_EARLY-1]==2'b01) begin
				output_strobe <= 0;
			end else if (acknowledge_pipeline[ACKNOWLEDGE_PICKOFF_LATE:ACKNOWLEDGE_PICKOFF_LATE-1]==2'b11) begin
				if (~fifo_empty) begin
					output_strobe <= 1'b1;
				end
			end else if (acknowledge_pipeline[ACKNOWLEDGE_PICKOFF_LATE:ACKNOWLEDGE_PICKOFF_LATE-1]==2'b10) begin
				output_strobe <= 0;
				if (~fifo_empty) begin
					fifo_read_strobe <= 1'b1;
				end
			end
			acknowledge_pipeline <= { acknowledge_pipeline[ACKNOWLEDGE_PICKOFF_LATE-1:0], acknowledge };
		end
	end
endmodule

module handshake_fifo_tb;
	localparam HALF_CLOCK_PERIOD = 2;
	localparam CLOCK_PERIOD = 2 * HALF_CLOCK_PERIOD;
	localparam EXTRA_WAIT = 8 * CLOCK_PERIOD;
	localparam DATA_WIDTH = 4;
	reg clock = 0;
	reg reset = 1;
	reg [DATA_WIDTH-1:0] nybble = 0;
	reg fifo_write_strobe = 0;
	wire [DATA_WIDTH-1:0] fifo_out_word;
	reg [DATA_WIDTH-1:0] data = 0;
	wire pmod_strobe;
	reg acknowledge = 0;
	wire fifo_read;
	wire fifo_empty;
	fifo_single_clock #(.DATA_WIDTH(DATA_WIDTH), .LOG2_OF_DEPTH(4)) fsc (.clock(clock), .reset(reset), .error_count(),
		.data_in(nybble), .write_enable(fifo_write_strobe), .full(), .almost_full(), .full_or_almost_full(),
		.data_out(fifo_out_word), .read_enable(fifo_read), .empty(fifo_empty), .almost_empty(), .empty_or_almost_empty());
	handshake_fifo pmod_fifo (.clock(clock), .reset(reset), .fifo_read_strobe(fifo_read), .fifo_empty(fifo_empty), .acknowledge(acknowledge), .output_strobe(pmod_strobe));
	initial begin
		#EXTRA_WAIT;
		reset <= 0;
		acknowledge <= 0;
		#EXTRA_WAIT;
		// initial read of an empty fifo, just to see what happens
		acknowledge <= 1'b1; #EXTRA_WAIT; acknowledge <= 0; #EXTRA_WAIT;
		#EXTRA_WAIT;
		// fill fifo
		nybble <= 4'hf; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'he; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'hd; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'hc; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'hb; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'ha; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h9; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h8; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h7; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h6; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h5; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h4; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h3; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h2; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h1; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h0; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		#EXTRA_WAIT;
		// read 'em out slowly
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		#EXTRA_WAIT;
		// one extra after the fifo should be empty, just to see what happens
		acknowledge <= 1'b1; #EXTRA_WAIT; acknowledge <= 0; #EXTRA_WAIT;
		#EXTRA_WAIT;
		// put some different values in fifo
		nybble <= 4'ha; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h1; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'hf; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'ha; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h0; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'he; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'h6; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		nybble <= 4'ha; fifo_write_strobe <= 1'b1; #CLOCK_PERIOD; fifo_write_strobe <= 0; #CLOCK_PERIOD;
		#EXTRA_WAIT;
		// read 'em out slowly
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		acknowledge <= 1'b1; @(posedge pmod_strobe) data <= fifo_out_word; #EXTRA_WAIT; acknowledge <= 0; #(4*EXTRA_WAIT);
		#EXTRA_WAIT;
		// one extra after the fifo should be empty, just to see what happens
		acknowledge <= 1'b1; #EXTRA_WAIT; acknowledge <= 0; #EXTRA_WAIT;
		#EXTRA_WAIT;
		// one extra after the fifo should be empty, just to see what happens
		acknowledge <= 1'b1; #EXTRA_WAIT; acknowledge <= 0; #EXTRA_WAIT;
		#EXTRA_WAIT;
		$finish;
	end
	always begin
		#HALF_CLOCK_PERIOD;
		clock <= ~clock;
	end
endmodule

//	fifo_single_clock_using_single_bram #(.DATA_WIDTH(DATA_WIDTH), .LOG2_OF_DEPTH(LOG2_OF_DEPTH)) fsc (.clock(clock), .reset(reset),
//		.data_in(data_in), .write_enable(write_enable), .full(full), .almost_full(almost_full), .full_or_almost_full(full_or_almost_full),
//		.data_out(data_out), .read_enable(read_enable), .empty(empty), .almost_empty(almost_empty), .empty_or_almost_empty(empty_or_almost_empty));
module fifo_single_clock_using_single_bram #(
	parameter DATA_WIDTH = 8,
	parameter LOG2_OF_DEPTH = 4,
	parameter PRIMITIVE_ADDRESS_DEPTH = 14,
	parameter RAM_ADDRESS_DEPTH = PRIMITIVE_ADDRESS_DEPTH - $clog2(DATA_WIDTH),
	parameter DEPTH = 1<<LOG2_OF_DEPTH
) (
	input clock, reset,
	output almost_full, full, full_or_almost_full,
	input [DATA_WIDTH-1:0] data_in,
	input write_enable,
	output almost_empty, empty, empty_or_almost_empty,
	input read_enable,
	output [DATA_WIDTH-1:0] data_out,
	output [31:0] error_count
);
	reg [RAM_ADDRESS_DEPTH-1:0] write_address = 0;
	reg [RAM_ADDRESS_DEPTH-1:0] read_address = 0;
	localparam MIN_COUNT = 1;
	localparam MAX_COUNT = MIN_COUNT + DEPTH;
	reg [LOG2_OF_DEPTH:0] count = MIN_COUNT; // 1 extra bit
	reg [7:0] write_error_count = 0;
	reg [7:0] read_error_count = 0;
	reg [7:0] other_error_count = 0;
	//assign error_count = write_error_count + read_error_count + other_error_count;
	assign error_count = { 8'd0, write_error_count[7:0], read_error_count[7:0], other_error_count[7:0] };
	wire [3:0] rwef = {read_enable, write_enable, empty, full};
	wire ram_write_enable = write_enable && ((~full) || (read_enable && full));
	RAM_s6_primitive #(.DATA_WIDTH_A(DATA_WIDTH), .DATA_WIDTH_B(DATA_WIDTH)) mem (.reset(reset),
		.write_clock(clock), .write_address(write_address), .data_in(data_in), .write_enable(ram_write_enable),
		.read_clock(clock), .read_address(read_address), .read_enable(1'b1), .data_out(data_out));
	always @(posedge clock) begin
		if (reset) begin
			write_address <= 0;
			read_address <= 0;
			count <= MIN_COUNT;
			write_error_count <= 0;
			read_error_count <= 0;
			other_error_count <= 0;
		end else begin
			casez (rwef)
				4'b100? : begin read_address <= read_address + 1'd1; count <= count - 1'd1; end
				4'b101? : begin read_error_count <= read_error_count + 1'd1; end // no data to read
				4'b01?0 : begin write_address <= write_address + 1'd1; count <= count + 1'd1; end
				4'b01?1 : begin write_error_count <= write_error_count + 1'd1; end // no more room to write
				4'b1100 : begin write_address <= write_address + 1'd1; read_address <= read_address + 1'd1; end
				4'b1110 : begin write_address <= write_address + 1'd1; count <= count + 1'd1; end
				4'b1101 : begin read_address <= read_address + 1'd1; count <= count - 1'd1; end
				4'b00?? : begin end // idle
				default : begin other_error_count <= other_error_count + 1'd1; end
			endcase
		end
	end
	assign full  = (count == MAX_COUNT) ? 1'b1 : 1'b0;
	assign empty = (count == MIN_COUNT) ? 1'b1 : 1'b0;
	assign almost_full  = (count == MAX_COUNT-1) ? 1'b1 : 1'b0;
	assign almost_empty = (count == MIN_COUNT+1) ? 1'b1 : 1'b0;
	assign full_or_almost_full   = full  || almost_full;
	assign empty_or_almost_empty = empty || almost_empty;
endmodule

//	fifo_single_clock #(.DATA_WIDTH(DATA_WIDTH), .LOG2_OF_DEPTH(LOG2_OF_DEPTH)) fsc (.clock(clock), .reset(reset),
//		.data_in(data_in), .write_enable(write_enable), .full(full), .almost_full(almost_full), .full_or_almost_full(full_or_almost_full),
//		.data_out(data_out), .read_enable(read_enable), .empty(empty), .almost_empty(almost_empty), .empty_or_almost_empty(empty_or_almost_empty));
module fifo_single_clock #(
	parameter DATA_WIDTH = 8,
	parameter LOG2_OF_DEPTH = 4,
	parameter PRIMITIVE_ADDRESS_DEPTH = 14, // each s6 BRAM is 16kbits (18kbits)
	parameter DEPTH = 1<<LOG2_OF_DEPTH
) (
	input clock, reset,
	output almost_full, full, full_or_almost_full,
	input [DATA_WIDTH-1:0] data_in,
	input write_enable,
	output almost_empty, empty, empty_or_almost_empty,
	input read_enable,
	output [DATA_WIDTH-1:0] data_out,
	output [23:0] error_count
);
	reg [LOG2_OF_DEPTH-1:0] write_address = 0;
	reg [LOG2_OF_DEPTH-1:0] read_address = 0;
	localparam MIN_COUNT = 1;
	localparam MAX_COUNT = MIN_COUNT + DEPTH;
	reg [LOG2_OF_DEPTH:0] count = MIN_COUNT; // 1 extra bit
	reg [7:0] write_error_count = 0;
	reg [7:0] read_error_count = 0;
	reg [7:0] other_error_count = 0;
	assign error_count = { write_error_count, read_error_count, other_error_count };
	wire [3:0] rwef = {read_enable, write_enable, empty, full};
	wire ram_write_enable = write_enable && ((~full) || (read_enable && full));
	RAM_s6_unidirectional  #(.DATA_WIDTH_A(DATA_WIDTH), .DATA_WIDTH_B(DATA_WIDTH), .ADDRESS_WIDTH_A(LOG2_OF_DEPTH)) myuni ( .reset(reset),
		.clock_a(clock), .address_a(write_address), .data_in_a(data_in), .write_enable_a(ram_write_enable),
		.clock_b(clock), .address_b(read_address), .data_out_b(data_out));
	always @(posedge clock) begin
		if (reset) begin
			write_address <= 0;
			read_address <= 0;
			count <= MIN_COUNT;
			write_error_count <= 0;
			read_error_count <= 0;
			other_error_count <= 0;
		end else begin
			casez (rwef)
				4'b100? : begin read_address <= read_address + 1'd1; count <= count - 1'd1; end
				4'b101? : begin read_error_count <= read_error_count + 1'd1; end // no data to read
				4'b01?0 : begin write_address <= write_address + 1'd1; count <= count + 1'd1; end
				4'b01?1 : begin write_error_count <= write_error_count + 1'd1; end // no more room to write
				4'b1100 : begin write_address <= write_address + 1'd1; read_address <= read_address + 1'd1; end
				4'b1110 : begin write_address <= write_address + 1'd1; count <= count + 1'd1; end
				4'b1101 : begin read_address <= read_address + 1'd1; count <= count - 1'd1; end
				4'b00?? : begin end // idle
				default : begin other_error_count <= other_error_count + 1'd1; end
			endcase
		end
	end
	assign full  = (count == MAX_COUNT) ? 1'b1 : 1'b0;
	assign empty = (count == MIN_COUNT) ? 1'b1 : 1'b0;
	assign almost_full  = (count == MAX_COUNT-1) ? 1'b1 : 1'b0;
	assign almost_empty = (count == MIN_COUNT+1) ? 1'b1 : 1'b0;
	assign full_or_almost_full   = full  || almost_full;
	assign empty_or_almost_empty = empty || almost_empty;
endmodule

module fifo_single_clock_tb;
	localparam DATA_WIDTH = 8;
	localparam LOG2_OF_DEPTH = 4;
	wire clock;
	wire full;
	wire empty;
	wire almost_full;
	wire almost_empty;
	wire full_or_almost_full;
	wire empty_or_almost_empty;
	wire [DATA_WIDTH-1:0] data_out;
	reg pre_reset = 1;
	reg reset = 1;
	reg [DATA_WIDTH-1:0] pre_data_in = 0;
	reg [DATA_WIDTH-1:0] data_in = 0;
	reg pre_write_enable = 0;
	reg write_enable = 0;
	reg pre_read_enable = 0;
	reg read_enable = 0;
	if (1) begin
		fifo_single_clock #(.DATA_WIDTH(DATA_WIDTH), .LOG2_OF_DEPTH(LOG2_OF_DEPTH)) fsc (.clock(clock), .reset(reset),
			.data_in(data_in), .write_enable(write_enable), .full(full), .almost_full(almost_full), .full_or_almost_full(full_or_almost_full),
			.data_out(data_out), .read_enable(read_enable), .empty(empty), .almost_empty(almost_empty), .empty_or_almost_empty(empty_or_almost_empty));
	end else begin
		fifo_single_clock_using_single_bram #(.DATA_WIDTH(DATA_WIDTH), .LOG2_OF_DEPTH(LOG2_OF_DEPTH)) fsc (.clock(clock), .reset(reset),
			.data_in(data_in), .write_enable(write_enable), .full(full), .almost_full(almost_full), .full_or_almost_full(full_or_almost_full),
			.data_out(data_out), .read_enable(read_enable), .empty(empty), .almost_empty(almost_empty), .empty_or_almost_empty(empty_or_almost_empty));
	end
	integer r;
	integer w;
	initial begin
		#40;
		r = $fopen("fifo-reads", "w");
		w = $fopen("fifo-writes", "w");
		#40;
		pre_reset <= 0;
		// a write until full
		#40; pre_data_in <= 8'd00; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd01; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd02; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd03; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd04; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd05; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd06; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd07; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40;                       
		#40; pre_data_in <= 8'd08; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd09; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd10; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd11; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd12; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd13; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd14; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd15; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40;
		// and then an extra write while full
		#40; pre_data_in <= 8'd16; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40;
		// should be full now, but then simultaneous read+write
		#40; pre_data_in <= 8'd17; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40;
		// then we read to empty
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40;
		// and one more read while empty
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40;
		// write 4
		#40; pre_data_in <= 8'd18; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd19; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd20; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40; pre_data_in <= 8'd21; pre_write_enable <= 1; #4; pre_write_enable <= 0;
		#40;
		// read 4
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40;
		// simultaneous read+write
		#40; pre_data_in <= 8'd22; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd23; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd24; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd25; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd26; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd27; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd28; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd29; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40;
		#40; pre_data_in <= 8'd31; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd32; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd33; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd34; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd35; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd36; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd37; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd38; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40;
		#40; pre_data_in <= 8'd39; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd40; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd41; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40; pre_data_in <= 8'd42; pre_write_enable <= 1; pre_read_enable <= 1; #4; pre_write_enable <= 0; pre_read_enable <= 0;
		#40;
		// read one more to get it all out
		#40; pre_read_enable <= 1; #4; pre_read_enable <= 0;
		#40;
//		#100; $finish;
		#100; $fclose(r); $fclose(w);
	end
	clock #(.FREQUENCY_OF_CLOCK_HZ(250000000)) c (.clock(clock));
	reg [31:0] write_counter = 0;
	reg [31:0] read_counter = 0;
//	localparam CHECK_MEM_DEPTH = 256;
//	reg [DATA_WIDTH-1:0] mem [CHECK_MEM_DEPTH-1:0];
	always @(posedge clock) begin
		if (write_enable && ~full) begin
			$display("[%4d] %d (write)", write_counter, data_in);
			$fwrite(w, "%d\n", data_in);
			write_counter <= write_counter + 1'd1;
		end
		if (read_enable && ~empty) begin
			$display("[%4d] %d (read)", read_counter, data_out);
			$fwrite(r, "%d\n", data_out);
			read_counter <= read_counter + 1'd1;
		end
		data_in <= pre_data_in;
		write_enable <= pre_write_enable;
		read_enable <= pre_read_enable;
		reset <= pre_reset;
	end
endmodule

`endif

