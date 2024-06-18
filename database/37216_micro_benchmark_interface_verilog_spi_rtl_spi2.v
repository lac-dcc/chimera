// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

`default_nettype none
`timescale 1ns/1ps

`define SPI_WORD_LEN 8
`define TEST_BYTE 'b10011110

`define CLK_DIV_COMM 'sd2

`define TEST_BYTE_LED_ON 'sd7
`define TEST_BYTE_LED_OFF 'sd15

`define SPI_CLK_DIV 'sd2

module fpga_top ( 
	input wire WF_CLK,
	output wire SIGNAL_CLOCK_OUT,
	output wire SIGNAL_SS_OUT,
	output wire SIGNAL_DATA_OUT,
	input wire SIGNAL_CLOCK_IN,
	input wire SIGNAL_SS_IN,
	input wire SIGNAL_DATA_IN,
	output wire TEST_SIGNAL_OUT );

	//Local registers and wires
	reg [7:0] resetn_counter;
	wire resetn = &resetn_counter;
	
	reg reset_spi;
	reg spi_ready;
	
	reg reset_spi2;
	reg spi_ready2;

	wire proc_word;
	wire proc_word2;
	reg process_next_word;
	reg process_next_word2;
	reg [`SPI_WORD_LEN - 1:0] data;
	
	wire recv_new_word_present;
	wire [`SPI_WORD_LEN - 1:0] recv_tmp;
	reg [`SPI_WORD_LEN - 1:0] recv_data;
		
	reg test_signal_control;
	assign TEST_SIGNAL_OUT = test_signal_control;
	
	reg reset_div;
	reg divider_ready;
	wire divided_master_clock; 
	
	//Clock divider module
	clock_divider #( .DIV_N(`SPI_CLK_DIV) )	clkdiv ( .clk_in(WF_CLK), .clk_out(divided_master_clock), .do_reset(reset_div), .is_ready(divider_ready) );
	
spi_module 
	#( .SPI_MASTER (1'b1) )
	spi_master
	( .master_clock(WF_CLK),
	.SCLK_OUT(SIGNAL_CLOCK_OUT),
  	.SCLK_IN(divided_master_clock),
  	.SS_OUT(SIGNAL_SS_OUT),
  	.SS_IN(),
	.OUTPUT_SIGNAL(SIGNAL_DATA_OUT),
	.processing_word(proc_word), 
	.process_next_word(process_next_word),
	.data_word_send(data),
	.INPUT_SIGNAL(),
	.data_word_recv(),
	.do_reset(reset_spi),
	.is_ready(spi_ready) );
	
	spi_module 
	#( .SPI_MASTER (1'b0) )
	spi_slave
	( .master_clock(WF_CLK),
	.SCLK_OUT(),
  	.SCLK_IN(SIGNAL_CLOCK_IN),
  	.SS_OUT(),
  	.SS_IN(SIGNAL_SS_IN),
	.OUTPUT_SIGNAL(),
	.processing_word(proc_word2), 
	.process_next_word(process_next_word2),
	.data_word_send(),
	.INPUT_SIGNAL(SIGNAL_DATA_IN),
	.data_word_recv(recv_tmp),
	.do_reset(reset_spi2),
	.is_ready(spi_ready2) );

	always @(posedge WF_CLK) begin
	
		if (!resetn) begin
			//do reset stuff
			
			reset_div <= 1'b1;
		
			process_next_word <= 1'b0;
				
			process_next_word2 <= 1'b0;
		
			reset_spi <= 1'b1;
		
			reset_spi2 <= 1'b1;
		
			data <= 'sd0;
		
			//data <= `TEST_BYTE;
			
			test_signal_control <= 1'b0;
			
			resetn_counter <= resetn_counter + 'd1;
		end
		else begin
		
		if(divider_ready) begin
				reset_div <= 1'b0;
			
				if(spi_ready) begin
					reset_spi <= 1'b0;
					
				if(spi_ready2) begin
					reset_spi2 <= 1'b0;
		
					if(!proc_word) begin
			
						if(!process_next_word) begin
			
							if(data < 'sd15) data <= data + 'sd1;
							else data <= 'sd0;
		
						end
			
						process_next_word <= 1'b1;
			
					end
					else if (proc_word && process_next_word)  process_next_word <= 1'b0;
		
					if(!proc_word2) begin
			
						if(!process_next_word2) recv_data <= recv_tmp;
			
						process_next_word2 <= 1'b1;
			
					end
					else if (proc_word2 && process_next_word2)  process_next_word2 <= 1'b0;
			
					if(recv_data == `TEST_BYTE_LED_ON) test_signal_control <= 1'b1;
					else if(recv_data == `TEST_BYTE_LED_OFF) test_signal_control <= 1'b0;
		
				end
		
		
				end	
				end
		end
end
	
endmodule

