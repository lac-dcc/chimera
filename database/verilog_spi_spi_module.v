// This program was cloned from: https://github.com/janschiefer/verilog_spi
// License: GNU Lesser General Public License v2.1

`default_nettype none
`timescale 1ns/1ps

`define SPI_MODULE_COMMAND_LEN 3

`define SPI_STATUS_IDLE 'b000
`define SPI_STATUS_CYCLE_BITS 'b111

module spi_module
	#( parameter CPOL = 1'b0,
	parameter CPHA = 1'b0,
	parameter INVERT_DATA_ORDER = 1'b0,
	parameter SPI_MASTER = 1'b1,
	parameter SPI_WORD_LEN = 8 )

	( input wire master_clock,
	output wire SCLK_OUT,
	input wire SCLK_IN,
	output wire SS_OUT,
	input wire SS_IN,
	output wire OUTPUT_SIGNAL,
	output wire processing_word,
	input wire process_next_word,
	input wire [SPI_WORD_LEN - 1:0] data_word_send,
	input wire INPUT_SIGNAL,
	output wire [SPI_WORD_LEN - 1:0] data_word_recv,
	input wire do_reset,
	output wire is_ready );

	//Local registers and wires
	reg is_ready_reg;
	reg activate_ss;
	reg activate_sclk;
	
	reg status_ignore_first_edge;
	
	wire rising_sclk_edge;
	wire falling_sclk_edge;
	
	reg [SPI_WORD_LEN - 1:0] data_word_recv_reg;
	
	reg [SPI_WORD_LEN - 1:1] bit_counter;
	
	reg [`SPI_MODULE_COMMAND_LEN - 1:0]spi_status;

	assign is_ready = is_ready_reg;
	
	assign data_word_recv = data_word_recv_reg;
	
	assign processing_word = (spi_status == `SPI_STATUS_IDLE) ? 1'b0 : 1'b1;
	
	generate 
	
		if(SPI_MASTER) begin
		
			assign SCLK_OUT = (activate_sclk) ? SCLK_IN : (CPOL);
			assign SS_OUT = (activate_ss) ? 1'b0 : 1'b1;

		end
		
	endgenerate
	
	//Edge detector modules
	pos_edge_det spi_edge_pos( .sig(SCLK_IN), .clk(master_clock), .pe(rising_sclk_edge));
	neg_edge_det spi_edge_neg( .sig(SCLK_IN), .clk(master_clock), .ne(falling_sclk_edge));
	
	wire delay_pol =  (CPHA) ? ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge)  ) : ( (CPOL) ? (SCLK_IN) : (!SCLK_IN) );	
	
	wire get_number_edge = (CPHA) ? ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge) ) : ( (CPOL) ? (falling_sclk_edge) : (rising_sclk_edge) );
	
	wire switch_number_edge = (CPHA) ? ( (CPOL) ? (falling_sclk_edge) : (rising_sclk_edge) ) : ( (CPOL) ? (rising_sclk_edge) : (falling_sclk_edge) );
	
	wire SS = (SPI_MASTER) ? SS_OUT : SS_IN;
	
	assign OUTPUT_SIGNAL = (activate_ss) ? data_word_send[bit_counter] : 1'b0;
	
	always @(posedge master_clock) begin
	
		if (do_reset) begin
			//do reset stuff
			
			activate_ss <= 1'b0;
			
			activate_sclk <= 1'b0;
			
			bit_counter <= (INVERT_DATA_ORDER) ? (0) : (SPI_WORD_LEN - 1);
			
			status_ignore_first_edge <= 1'b0;
			
			spi_status <= `SPI_STATUS_IDLE;
			
			is_ready_reg <= 1'b1;
			
		end
		else begin		
				case(spi_status)
				
					`SPI_STATUS_IDLE: begin
						
						if(process_next_word && delay_pol) begin
							status_ignore_first_edge <= 1'b0;
							activate_ss <= 1'b1;
							activate_sclk <= 1'b1;	
							spi_status <= `SPI_STATUS_CYCLE_BITS;	
						end
						
					end

					`SPI_STATUS_CYCLE_BITS: begin
	
						if(!SS) begin
						
							if(get_number_edge) data_word_recv_reg[bit_counter] <= INPUT_SIGNAL;
	
							if(switch_number_edge) begin
						
								if(CPHA && !status_ignore_first_edge) status_ignore_first_edge <= 1'b1;
								else begin
								
									if(bit_counter ==  ((INVERT_DATA_ORDER) ? (SPI_WORD_LEN -1) : ('sd0)) ) begin //Word processed, reset
								
										activate_ss <= 1'b0;
										activate_sclk <= 1'b0;
										bit_counter <= (INVERT_DATA_ORDER) ? (0) : (SPI_WORD_LEN - 1);
										spi_status <= `SPI_STATUS_IDLE;
									
									end
									else bit_counter <= (INVERT_DATA_ORDER) ? (bit_counter + 1) : (bit_counter - 1);	
																	
								end
							end
						
						end
						
					end
								
				endcase
				
			end
		
	end
		
endmodule
	
