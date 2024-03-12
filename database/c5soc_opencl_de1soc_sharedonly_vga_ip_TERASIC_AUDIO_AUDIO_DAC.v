module AUDIO_DAC(
	// host
	clk,
	reset,
	write,
	writedata,
	full,
	clear,
	// dac
	bclk,
	daclrc,
	dacdat
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter	DATA_WIDTH = 32;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input						clk;
input						reset;
input						write;
input	[(DATA_WIDTH-1):0]	writedata;
output						full;
input						clear;

input						bclk;
input						daclrc;
output						dacdat;


/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

// Note. Left Justified Mode
reg							request_bit;
reg							bit_to_dac;
reg		[4:0]				bit_index;  //0~31
reg							dac_is_left;
reg		[(DATA_WIDTH-1):0]	data_to_dac;		
reg		[(DATA_WIDTH-1):0]	shift_data_to_dac;	

//
wire						dacfifo_empty;
wire 						dacfifo_read;
wire	[(DATA_WIDTH-1):0]	dacfifo_readdata;
wire						is_left_ch;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/


//////////// read data from fifo
assign dacfifo_read = (dacfifo_empty)?1'b0:1'b1;

always @ (negedge is_left_ch)
begin
	if (dacfifo_empty)
		data_to_dac = 0;
	else
		data_to_dac = dacfifo_readdata;
end

//////////// streaming data(32-bits) to dac chip(I2S 1-bits port)
assign is_left_ch = ~daclrc;
always @ (negedge bclk) 
begin
	if (reset || clear)
	begin
		request_bit = 0;
		bit_index = 0;
		dac_is_left = is_left_ch;
		bit_to_dac = 1'b0;
	end
	else
	begin
		if (dac_is_left ^ is_left_ch)
		begin		// channel change
			dac_is_left = is_left_ch;
			request_bit = 1; 
			if (dac_is_left)
			begin
				shift_data_to_dac = data_to_dac;
				bit_index = DATA_WIDTH;
			end
		end
		
		
		// serial data to dac		
		if (request_bit)
		begin
			bit_index = bit_index - 1'b1;
			bit_to_dac = shift_data_to_dac[bit_index];  // MSB as first bit
			if ((bit_index == 0) || (bit_index == (DATA_WIDTH/2)))
				request_bit = 0;
		end			
		else
			bit_to_dac = 1'b0;
	end
end


/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

assign	dacdat = bit_to_dac;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

audio_fifo dac_fifo(
	// write
	.wrclk(clk),
	.wrreq(write),
	.data(writedata),
	.wrfull(full),
	.aclr(clear),  // sync with wrclk
	// read
	//.rdclk(bclk),
	.rdclk(is_left_ch),
	.rdreq(dacfifo_read),
	.q(dacfifo_readdata),
	.rdempty(dacfifo_empty)
);

endmodule



