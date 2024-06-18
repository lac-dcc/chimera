// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

module uart_driver
	#(
		parameter BAUD_RATE = 115200
	)
	(
		input wire clk_in,
		input wire rst_n,
		
		input wire tx_trigger,
		output wire tx_ready,
		input wire [7:0]tx_data,
		input wire rx_trigger,
		output wire rx_ready,
		output wire [7:0]rx_data,
		
		output wire tx,
		input wire rx
	);
	
//***time control***//
	localparam bit_interval = ( 12000000 / BAUD_RATE ) * 2 ;
	reg [15:0]tx_bit_interval_counter = 16'b0;			//tx use
	reg [15:0]rx_bit_interval_counter = 16'b0;			//rx use
	
//***buffers***//
	//tx buffer
	wire tx_full;
	wire tx_empty;
	assign tx_ready = ~tx_full;
	reg tx_save, tx_read;
	reg [7:0]tx_data_buffer;	//delay the data by 1 clock pulse to match the trigger delay
	wire [7:0]tx_byte;
	reg [9:0]tx_byte_sending;
	uart_buffer tx_buffer (
		.rst(~rst_n),
		.clkw(~clk_in),
		.we(tx_save),
		.di(tx_data_buffer),
		.clkr(~clk_in),
		.re(tx_read),
		.do(tx_byte),
		.empty_flag(tx_empty),
		.full_flag(tx_full)
	);
	//rx buffer
	wire rx_empty, rx_full;
	assign rx_ready = ~rx_empty;
	reg rx_save, rx_read;
	wire [7:0]rx_byte;
	reg [9:0]rx_byte_receiving;
	uart_buffer rx_buffer (
		.rst(~rst_n),
		.clkw(~clk_in),
		.we(rx_save),
		.di(rx_byte),
		.clkr(~clk_in),
		.re(rx_read),
		.do(rx_data),
		.empty_flag(rx_empty),
		.full_flag(rx_full)
	);
	
	
//***input module***//
	reg tx_trigger_old = 1'b0;
	always @(posedge clk_in) begin
		//reset
		if ( ~rst_n ) begin
			tx_save <= 1'b0;
			tx_data_buffer <= 8'b0;
			tx_trigger_old <= tx_trigger;
		end
		//trigger
		else begin
			tx_save <= tx_trigger;
			tx_data_buffer <= tx_data;
		end
	end
	
	
//***tx module***//
	reg tx_busy = 1'b0;
	reg tx_bit = 1'b0;
	always @(posedge clk_in) begin
		//reset
		if ( ~rst_n ) begin
			tx_read <= 1'b0;
			tx_busy <= 1'b0;
			tx_bit_interval_counter <= 16'b0;
			tx_byte_sending <= 10'b0;
			tx_bit <= 1'b1;
		end
		//start tx
		if ( tx_busy ) begin
			tx_bit_interval_counter <= tx_bit_interval_counter + 1'b1;
		end	else begin
			tx_bit <= 1'b1;
			if ( ~tx_empty ) begin
				tx_busy <= 1'b1;
				tx_bit_interval_counter <= 16'b0;
			end
		end
		//read tx buffer
		if ( tx_busy == 1 && tx_bit_interval_counter == 0 ) begin
			tx_read <= 1'b1;
			tx_byte_sending <= {1'b1,tx_byte,1'b0};
		end else if ( tx_busy == 1 && tx_bit_interval_counter == 1 ) begin
			tx_read <= 1'b0;
		end
		//execute tx timing
		if  ( tx_busy == 1 && tx_bit_interval_counter % bit_interval == 0 ) begin
			tx_bit <= tx_byte_sending[ tx_bit_interval_counter / bit_interval ];
		end
		//finish tx
		if ( tx_bit_interval_counter / bit_interval == 10 ) begin
			tx_busy <= 1'b0;
			tx_bit_interval_counter <= 16'b0;
		end
	end
	//tx line drive
	assign tx = tx_bit;
	
	
//***rx module***//
	reg rx_busy = 1'b0;
	reg rx_bit = 1'b0;
	always @(posedge clk_in) begin
		//reset
		if ( ~rst_n ) begin
			rx_save <= 1'b0;
			rx_busy <= 1'b0;
			rx_bit_interval_counter <= 16'b0;
			rx_byte_receiving <= 10'b0;
			rx_bit <= 1'b1;
		end
		//start rx
		if ( rx_busy ) begin
			rx_bit_interval_counter <= rx_bit_interval_counter + 1'b1;
		end	else begin
			//rx_byte_receiving <= 10'b0;
			if ( ~rx ) begin
				rx_busy <= 1'b1;
				rx_bit_interval_counter <= 16'b0;
			end
		end
		//execute rx timing
		if  ( rx_busy == 1 && rx_bit_interval_counter % bit_interval == bit_interval / 2 ) begin
			rx_byte_receiving[ rx_bit_interval_counter / bit_interval ] <= rx;
		end
		//finish rx
		if ( rx_bit_interval_counter / bit_interval == 9 ) begin
			if ( rx_bit_interval_counter % bit_interval - bit_interval / 2 == 1 )
				rx_save <= 1'b1;
			if ( rx_bit_interval_counter % bit_interval - bit_interval / 2 == 2 )
				rx_save <= 1'b0;
		end
		if ( rx_bit_interval_counter / bit_interval == 10 ) begin
			rx_busy <= 1'b0;
			rx_bit_interval_counter <= 16'b0;
		end
	end
	assign rx_byte = rx_byte_receiving[8:1];
	
	
//***output module***//
	reg rx_trigger_old = 1'b0;
	always @(posedge clk_in) begin
		//reset
		if ( ~rst_n ) begin
			rx_read <= 1'b0;
			rx_trigger_old <= rx_trigger;
		end
		//trigger
		else begin
			rx_read <= rx_trigger;
		end
	end
	
	
endmodule
