module AUDIO_ADC(
	// host
	clk,
	reset,
	read,
	readdata,
	//available,
	empty,
	clear,
	// dac
	bclk,
	adclrc,
	adcdat
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
parameter	DATA_WIDTH = 32;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
input							clk;
input							reset;
input							read;
output	[(DATA_WIDTH-1):0]		readdata;


output							empty;
input							clear;

input							bclk;
input							adclrc;
input							adcdat;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

reg		[4:0]					bit_index;   //0~31
reg								valid_bit;
reg								reg_adc_left;
reg		[(DATA_WIDTH-1):0]		reg_adc_serial_data;

reg		[(DATA_WIDTH-1):0]		adcfifo_writedata;
reg								adcfifo_write;
wire							adcfifo_full;
reg								wait_one_clk;


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

//===== Serialize data (I2S) to ADC-FIFO =====
wire is_left_ch;
assign is_left_ch = ~adclrc;
always @ (posedge bclk) 
begin
	if (reset || clear)
	begin
		bit_index = DATA_WIDTH;
		reg_adc_left = is_left_ch;
		adcfifo_write = 1'b0;
		valid_bit = 0;
	end
	else
	begin
		if (adcfifo_write)
			adcfifo_write = 1'b0;  // disable write at second cycle

		if (reg_adc_left ^ is_left_ch)
		begin		// channel change
			reg_adc_left = is_left_ch;
			valid_bit = 1'b1;
			wait_one_clk = 1'b1;
			if (reg_adc_left)
				bit_index = DATA_WIDTH;
		end

		// serial bit to adcfifo
		if (valid_bit && wait_one_clk)  
				wait_one_clk = 1'b0;
		else if (valid_bit && !wait_one_clk)  		
		begin
			bit_index = bit_index - 1'b1;
			reg_adc_serial_data[bit_index] = adcdat;
			if ((bit_index == 0) || (bit_index == (DATA_WIDTH/2)))
			begin	
				if (bit_index == 0 && !adcfifo_full)
				begin  // write data to adcfifo
					adcfifo_writedata = reg_adc_serial_data;
					adcfifo_write = 1'b1;  // enable write at first cycle
				end
				valid_bit = 0;
			end
		end			
	end
end


/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

audio_fifo adc_fifo(
	// write (adc write to fifo)
	.wrclk(bclk),
	.wrreq(adcfifo_write),
	.data(adcfifo_writedata),
	.wrfull(adcfifo_full),
	.aclr(clear),  // sync with wrclk
	// read (host read from fifo)
	.rdclk(clk),
	.rdreq(read),
	.q(readdata),
	.rdempty(empty)
);	


endmodule

