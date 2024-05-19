// This program was cloned from: https://github.com/janschiefer/verilog_spi
// License: GNU Lesser General Public License v2.1

`default_nettype none
`timescale 1ns/1ps

`define TEST_CYCLES_NUM 5000

`define SPI_WORD_LEN 8
`define TEST_BYTE 'b10011110

`define NUM_WORDS 'sd16

`define TEST_BYTE_LED_ON 'sd7
`define TEST_BYTE_LED_OFF 'sd15

`define SPI_CLK_DIV 'sd2

module testbench_spi;

	int test_cycles = 0;
	reg chip_clock;
	
	output wire SIGNAL_CLOCK;
	output wire SIGNAL_SS;
	output wire SIGNAL_DATA;
	
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
	wire test_signal;
	
	reg reset_div;
	reg divider_ready;
	wire divided_master_clock; 
	//Clock divider module
	clock_divider #( .DIV_N(`SPI_CLK_DIV) )	clkdiv ( .clk_in(chip_clock), .clk_out(divided_master_clock), .do_reset(reset_div), .is_ready(divider_ready) );

	assign test_signal = test_signal_control;

	spi_module 
	#( .SPI_MASTER (1'b1) )
	spi_master
	( .master_clock(chip_clock),
	.SCLK_OUT(SIGNAL_CLOCK),
  	.SCLK_IN(divided_master_clock),
  	.SS_OUT(SIGNAL_SS),
  	.SS_IN(),
	.OUTPUT_SIGNAL(SIGNAL_DATA),
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
	( .master_clock(chip_clock),
	.SCLK_OUT(),
  	.SCLK_IN(SIGNAL_CLOCK),
  	.SS_OUT(),
  	.SS_IN(SIGNAL_SS),
	.OUTPUT_SIGNAL(),
	.processing_word(proc_word2), 
	.process_next_word(process_next_word2),
	.data_word_send(),
	.INPUT_SIGNAL(SIGNAL_DATA),
	.data_word_recv(recv_tmp),
	.do_reset(reset_spi2),
	.is_ready(spi_ready2) );

	initial begin

		$dumpfile("test_data/output.vcd");
		$dumpvars();	
		
		test_cycles <= 0;	
		
		reset_div <= 1'b1;
		
		process_next_word <= 1'b0;
				
		process_next_word2 <= 1'b0;
		
		reset_spi <= 1'b1;
		
		reset_spi2 <= 1'b1;
		
		data <= 'sd0;
		
		//data <= `TEST_BYTE;
		
		chip_clock = 1'b0; //blocking

	end

	always begin
		
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
		
	chip_clock <= ~chip_clock;
	test_cycles <= test_cycles + 1;

	if (test_cycles >= `TEST_CYCLES_NUM - 1) $finish;		
		
        #31.25; //16 MHz

      	end
      	
endmodule
