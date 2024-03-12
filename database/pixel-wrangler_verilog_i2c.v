/*
 * i2c device interface.
 *
 * This could probably be done with a ice40 SB_I2C block, although
 * folks seems to recommend against it.
 *
 * Requires 4.7k pullups to 3.3v. Do not pull up to HDMI 5v line!
 *
 * The read address is set by a write command that doesn't include any data.
 *
 * States:
 * Idle -> ADDR_BITS -> ADDR_ACK
 * ADDR_ACK -> ACTIVE -> ACTIVE_ACK
 */
module i2c_device(
	input clk,
	input reset,
	input scl_in,
	input sda_in,
	output sda_out,
	output sda_enable,

	// register interface for reads and writes
	output [7:0] data_addr,
	input [7:0] rd_data,
	output [7:0] wr_data,
	output wr_strobe
);
	parameter DEVICE_ADDR = 7'h50;

	parameter IDLE = 0;
	parameter SHIFT_IN = 1;
	parameter SHIFT_IN_ACK = 2;
	parameter SHIFT_OUT = 3;
	parameter SHIFT_OUT_ACK = 4;
	parameter ADDR_ACK = 5;
	parameter WRITE_ADDR = 6;
	parameter WRITE_DATA = 7;
	parameter READ_DATA = 8;
	parameter READ_ACK = 9;

	reg [3:0] state = IDLE;
	reg [3:0] next_state = IDLE;

	reg sda, sda0, sda1;
	reg scl, scl0, scl1;
	reg last_sda, last_scl;
	
	wire scl_rising  = !last_scl &&  scl;
	wire scl_falling =  last_scl && !scl;
	wire sda_rising  = !last_sda &&  sda;
	wire sda_falling =  last_sda && !sda;

// buffer the SDA and SCL to avoid glitches
// and tracking rising/falling edges
always @(posedge clk)
begin
	last_scl <= scl;
	last_sda <= sda;

	scl <= scl1;
	sda <= sda1;

	scl1 <= scl0;
	sda1 <= sda0;

	sda0 <= sda_in;
	scl0 <= scl_in;
end

reg [2:0] bit_counter;
reg [7:0] shift_reg;
reg [7:0] data_addr;
reg sda_enable = 0;
reg wr_strobe = 0;
assign sda_out = 0; // always pull low
assign wr_data = shift_reg;


always @(posedge clk)
begin
	wr_strobe <= 0;

	if (reset)
	begin
		sda_enable <= 0;
		state <= IDLE;
	end else
	if (scl && sda_falling)
	begin
		// start or restart command -- SDA falls before SCL
		state <= SHIFT_IN;
		next_state <= ADDR_ACK;
		bit_counter <= 0;
	end else
	if (scl && sda_rising)
	begin
		// stop command -- SDA should not change while SCL is high
		state <= IDLE;
		sda_enable <= 0;
	end else
	if (state == IDLE)
	begin
		sda_enable <= 0;
	end else

	/* shift in 8 bits of data, and then hand control to the next state */
	if (state == SHIFT_IN && scl_rising)
	begin
		// bytes are sent MSB first
		shift_reg <= { shift_reg[6:0], sda };
		if (bit_counter == 7)
			state <= next_state;
		bit_counter <= bit_counter + 1;
	end else
	if (state == SHIFT_IN && scl_falling)
	begin
		// release any ACKs that we might hold
		sda_enable <= 0;
	end else
	if (state == SHIFT_IN_ACK && scl_rising)
	begin
		// hold the ack line and start a normal shift in
		// on the next falling edge
		state <= SHIFT_IN;
		bit_counter <= 0;
	end else

	/* check device address; bottom bit is read / !write */
	if (state == ADDR_ACK && scl_falling)
	begin
		if (shift_reg[7:1] == DEVICE_ADDR)
		begin
			// ack that we are handling it
			sda_enable <= 1;

			if (shift_reg[0]) begin
				// read mode, pre-read the current byte
				state <= READ_DATA;
				shift_reg <= rd_data;
			end else begin
				// write mode
				state <= SHIFT_IN_ACK;
				next_state <= WRITE_ADDR;
			end
		end else begin
			// not for us, so go back to idle state
			state <= IDLE;
		end
	end else

	/* write phases */
	if (state == WRITE_ADDR && scl_falling)
	begin
		// this is after a full byte has been received with SHIFT_IN
		// ack that we have received the address
		sda_enable <= 1;

		// store the write address
		data_addr <= shift_reg;

		// start shifting in a data byte
		state <= SHIFT_IN_ACK;
		next_state <= WRITE_DATA;
	end else
	if (state == WRITE_DATA && scl_falling)
	begin
		// this is after a full byte has been received
		// ack the we have received the byte
		// and write it to the address
		sda_enable <= 1;
		wr_strobe <= 1;
	end else
	if (state == WRITE_DATA && scl_rising)
	begin
		// our write ack is done, move to the next address
		// and start shifting in a new byte
		sda_enable <= 0;
		data_addr <= data_addr + 1;
		state <= SHIFT_IN;
		next_state <= WRITE_DATA;
	end else

	/* read phases */
	if (state == READ_DATA && scl_falling)
	begin
		// shift out 8 bits on the *falling edge* so that
		// the data is stable during the high time
		sda_enable = ~shift_reg[7]; // 0 == pull down
		shift_reg <= { shift_reg[6:0], 1'b0 };
		if (bit_counter == 7)
			state <= SHIFT_OUT_ACK;
		bit_counter <= bit_counter + 1;
	end else
	if (state == SHIFT_OUT_ACK && scl_falling)
	begin
		// let the controller send us a ~ACK / NAK on the 9th clock
		sda_enable <= 0;
		state <= READ_ACK;

		// start the read of the next byte
		data_addr <= data_addr + 1;
	end
	if (state == READ_ACK && scl_rising)
	begin
		if (sda)
		begin
			// they NAK'ed us, so we go back to idle
			state <= IDLE;
		end else begin
			// they want more.
			// the next byte should be ready now
			shift_reg <= rd_data;
			state <= READ_DATA;
			bit_counter <= 0;
		end
	end
end
endmodule
