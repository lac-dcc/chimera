// This program was cloned from: https://github.com/matt-alencar/fpga-uart-tx-rx
// License: MIT License

/*	
	MIT License

	Copyright (c) 2018 Matheus Alencar Nascimento (matt-alencar)

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

`timescale 1ns/1ns
`include "./uart_tx.v"
`include "./uart_rx.v"


module uart_tb ();
	
	/* 
		Ticks per bit (tpb) = (System clock / Baund rate)
		tpb = (50*10^6 / 115200)
		tpb = 434
		Ticks per bit size = 9 bit to hold 434
	*/

	parameter CLOCK_PERIOD_NS = 20;
	parameter TICKS_PER_BIT   = 3'd4;	//4 clock ticks for 1 bit period

	parameter BIT_PERIOD_NS = CLOCK_PERIOD_NS*TICKS_PER_BIT;

	reg clk = 0;
	reg tx_start = 0;
	reg [7:0] tx_data = 0;
	wire tx_done, tx_busy, tx_dout_serial;

	reg rx_din_serial = 1;
	reg rx_enable = 1;
	wire [7:0] rx_data;
	wire rx_recv;
	wire rx_busy;

	// Takes in input byte and serializes it
	task UART_SOFT_WRITE_BYTE;
		input [7:0] i_data;
		integer ii;
		begin
			// Send Start Bit
			rx_din_serial = 1'b0;
			#(BIT_PERIOD_NS);

			// Send Data Byte
			for (ii=0; ii<8; ii=ii+1) begin
				rx_din_serial = i_data[ii];
				#(BIT_PERIOD_NS);
			end
				
			// Send Stop Bit
			rx_din_serial = 1'b1;
			#(BIT_PERIOD_NS);
		end
	endtask


	task UART_TX_WRITE_BYTE;
		input [7:0] i_data;
		begin
			@(posedge clk);
			@(posedge clk);
			tx_start <= 1;
			tx_data <= i_data;
			@(posedge clk);
			tx_start <= 0;
			@(posedge tx_done); //Wait until a posedge of tx_done
		end
	endtask
		
	/** Instantiate UART RX module */
	uart_rx #(
		.TICKS_PER_BIT(TICKS_PER_BIT),
		.TICKS_PER_BIT_SIZE($bits(TICKS_PER_BIT))
	)
	UART_RX_INST (	
		.i_clk(clk),
		.i_enable(rx_enable),
		.i_din(rx_din_serial),
		.o_rxdata(rx_data),
		.o_recvdata(rx_recv),
		.o_busy(rx_busy)
	);

	/** Instantiate UART TX module */
	uart_tx #(
		.TICKS_PER_BIT(TICKS_PER_BIT), 
		.TICKS_PER_BIT_SIZE($bits(TICKS_PER_BIT))
	)
	UART_TX_INST (
		.i_clk(clk),
		.i_start(tx_start),
		.i_data(tx_data),
		.o_done(tx_done),
		.o_busy(tx_busy),
		.o_dout(tx_dout_serial)
	);

	//Generate a clock signal
	always 
		#(CLOCK_PERIOD_NS/2) clk <= ~clk;

	// Main Testing:
	initial begin
			$dumpfile("uart_tb.vcd");
			$dumpvars(0, uart_tb);
			
			// Send stimulus direct to UART RX using a task
			@(posedge clk);
			@(posedge clk);
			UART_SOFT_WRITE_BYTE(8'hAB);
			@(posedge clk);
			#(BIT_PERIOD_NS);
			if (rx_data == 8'hAB)
				$display("[UART RX]: Frist Test Passed - Correct Byte Received\n");
			else
				$display("[UART RX]: Frist Test Failed - Incorrect Byte Received\n");

			// Send stimulus for UART TX module and receive those back on UART RX module
			assign rx_din_serial = tx_dout_serial;
			$display("[UART TX]: Sending data to UART RX module\n");
			UART_TX_WRITE_BYTE(8'h0D);
			@(posedge clk);
			#(BIT_PERIOD_NS);
			if (rx_data == 8'h0D)
				$display("[UART RX]: Second Test Passed - Correct Byte Received\n");
			else
				$display("[UART RX]: Second Test Failed - Incorrect Byte Received\n");
 
			$finish;
		end
endmodule
