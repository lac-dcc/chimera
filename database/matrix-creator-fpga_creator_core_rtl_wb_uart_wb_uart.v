// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

module wb_uart #(
	parameter ADDR_WIDTH      = "mandatory",
	parameter DATA_WIDTH      = "mandatory",
	parameter SYS_FREQ_HZ     = "mandatory",
	parameter BAUD_RATE       = "mandatory",
	parameter FIFO_ADDR_SIZE  = 8          ,
	parameter PULSE_WIDTH     = 13         ,
	parameter UART_DATA_WIDTH = 8
) (
	input                   clk     ,
	input                   resetn  ,
	// Wishbone interface
	input                   wb_stb_i,
	input                   wb_cyc_i,
	input                   wb_we_i ,
	input  [           3:0] wb_sel_i,
	input  [ADDR_WIDTH-1:0] wb_adr_i,
	input  [DATA_WIDTH-1:0] wb_dat_i,
	output [DATA_WIDTH-1:0] wb_dat_o,
	output                  wb_ack_o,
	// Serial Wires
	input                   uart_rxd,
	output                  uart_txd,
	output                  uart_irq
);

	wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i & ~wb_ack_o;
	wire wb_wr = wb_cyc_i & wb_stb_i & wb_we_i & ~wb_ack_o ;

//---------------------------------------------------------------------------
// UART engine
//---------------------------------------------------------------------------
	wire [UART_DATA_WIDTH-1:0] rx_data;
	wire [UART_DATA_WIDTH-1:0] tx_data;

	wire rx_avail;
	wire rx_error;
	wire rx_ack  ;
	reg  tx_wr   ;
	wire tx_busy ;

	uart #(
		.SYS_FREQ_HZ(SYS_FREQ_HZ),
		.BAUD_RATE  (BAUD_RATE  )
	) uart0 (
		.clk     (clk     ),
		.resetn  (resetn  ),
		.uart_rxd(uart_rxd),
		.uart_txd(uart_txd),
		.rx_data (rx_data ),
		.rx_avail(rx_avail),
		.rx_error(rx_error),
		.rx_ack  (rx_ack  ),
		.tx_data (tx_data ),
		.tx_wr   (tx_wr   ),
		.tx_busy (tx_busy )
	);
	//---------------------------------------------------------------------------
	// FIFO engine
	//---------------------------------------------------------------------------
	wire [UART_DATA_WIDTH-1:0] read_data;

	wire read_rx_wishbone; 
	assign read_rx_wishbone = (wb_adr_i[FIFO_ADDR_SIZE:0]==0) & wb_rd; 

	wire fifo_empty  ;
	wire read_ack    ;
	reg  fifo_flush  ;
	reg  write_enable;

	uart_fifo #(
		.ADDRESS_WIDTH(FIFO_ADDR_SIZE ),
		.DATA_WIDTH   (UART_DATA_WIDTH)
	) uart_fifo0 (
		.clk         (clk             ),
		.resetn      (resetn          ),
		.write_enable(write_enable    ),
		.write_ack   (rx_ack          ),
		.data_a      (rx_data         ),
		.read_enable (read_rx_wishbone),
		.read_ack    (read_ack        ),
		.data_b      (read_data       ),
		.fifo_flush  (fifo_flush      ),
		.empty       (fifo_empty      )
	);


	wire [DATA_WIDTH-1:0] ucr;
	assign ucr[7:0]             = {7'b0,fifo_empty};
	assign ucr[DATA_WIDTH-1-:8] = {4'b0,tx_busy,rx_error,rx_avail,fifo_empty};

	reg [DATA_WIDTH-1:0] wb_dat;
	assign wb_dat_o = (wb_adr_i[FIFO_ADDR_SIZE:0]==0) ? {ucr[7:0],read_data} : wb_dat ;

	reg wb_ack;
	assign wb_ack_o = read_ack | wb_ack ;

	//---------------------------------------------------------------------------
	// IRQ engine
	//---------------------------------------------------------------------------	
	reg [PULSE_WIDTH-1:0] pulse_width;

	always @(posedge clk or posedge resetn) begin
		if(resetn) begin
			pulse_width <= 0;
		end else begin
			if(~fifo_empty)
				pulse_width <= pulse_width + 1;
			else
				pulse_width <= 0;
		end
	end

	assign uart_irq = pulse_width[PULSE_WIDTH-1];

	//---------------------------------------------------------------------------
	// STATE MACHINE
	//---------------------------------------------------------------------------

	reg [1:0] state_write;

	localparam [1:0] S_IDLE       = 2'd0;
	localparam [1:0] S_WRITE_FIFO = 2'd1;
	localparam [1:0] S_WAIT       = 2'd2;

	always @(state_write) begin
		case(state_write)
			S_IDLE :
				write_enable = 1'b0;
			S_WRITE_FIFO :
				write_enable = 1'b1;
			S_WAIT :
				write_enable = 1'b0;
			default :
				write_enable = 1'b0;
		endcase
	end

	always @(posedge clk or posedge resetn) begin
		if(resetn)
			state_write <= S_IDLE;
		else begin
			case(state_write)
				S_IDLE :
					if(rx_avail)
						state_write <= S_WRITE_FIFO;
				else
					state_write <= S_IDLE;
				S_WRITE_FIFO :
					state_write <= S_WAIT;
				S_WAIT :
					if( ~rx_avail )
						state_write <= S_IDLE;
				else
					state_write <= S_WAIT;
				default :
					state_write <= S_IDLE;
			endcase
		end
	end

	assign tx_data = wb_dat_i[7:0];

	always @(posedge clk or posedge resetn)
		begin
			if (resetn) begin
				wb_ack                 <= 0;
				wb_dat[DATA_WIDTH-1:8] <= {DATA_WIDTH{1'b0}};
				tx_wr                  <= 0;
				fifo_flush             <= 0;
			end else begin
				wb_ack                 <= 0;
				wb_dat[DATA_WIDTH-1:0] <= 16'b0;
				tx_wr                  <= 0;
				if (wb_rd & wb_adr_i[FIFO_ADDR_SIZE]) begin
					wb_ack <= 1;
					case (wb_adr_i[1:0])
						2'b00 : begin
							wb_dat[DATA_WIDTH-1:0] <= ucr;
						end
						default : begin
							wb_dat[DATA_WIDTH-1:0] <= 8'b0;
						end
					endcase
				end else if (wb_wr & wb_adr_i[FIFO_ADDR_SIZE]) begin
					wb_ack <= 1;
					case (wb_adr_i[1:0])
						2'b01 : begin
							tx_wr <= 1;
						end
						2'b10 : begin
							fifo_flush <= wb_dat_i[0];
						end
						default : begin
							tx_wr      <= 0;
							fifo_flush <= 0;
						end
					endcase
				end
			end
		end

endmodule
