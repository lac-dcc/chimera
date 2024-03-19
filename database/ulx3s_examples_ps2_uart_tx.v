/*
 * uart_tx 
 *
 * Copyright 2018 Tom Verbeure
 * 
 * Copyright and related rights are licensed under the Solderpad Hardware License, 
 * Version 0.51 (the “License”); you may not use this file except in compliance with 
 * the License. 
 * You may obtain a copy of the License at *  http://solderpad.org/licenses/SHL-0.51. 
 * Unless required by applicable law or agreed to in writing, software, hardware and 
 * materials distributed under this License is distributed on an “AS IS” BASIS, WITHOUT 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and limitations under the License.
 * 
 */

module uart_tx
	(
	input 		clk, 
	input 		reset, 
	input 		tx_req,
	output 		tx_ready,
	input [7:0]	tx_data,
	output 		uart_tx
	);

	parameter MAIN_CLK	= 26000000;
	parameter BAUD 		= 115200;

	localparam BAUD_DIVIDE  = MAIN_CLK/BAUD;

	reg [$clog2(BAUD_DIVIDE)-1:0]	baud_cntr;
	reg 		baud_tick;

	always @(posedge clk) begin
		baud_tick	<= 1'b0;

		if (reset) begin
			baud_cntr 	<= 0;
		end
		else if (baud_cntr == 0) begin
			baud_cntr 	<= BAUD_DIVIDE-1;
			baud_tick 	<= 1'b1;
		end
		else begin
			baud_cntr	<= baud_cntr - 1;
		end
	end

	reg 	uart_tx;
	reg	tx_ready;

	reg [3:0] tx_bit_cntr;
	reg [8:0] tx_shift_reg;
	always @(posedge clk) begin
		tx_ready	<= 1'b0;

		if (reset) begin
			tx_bit_cntr	<= 0;
			uart_tx		<= 1'b1;
		end
		else if (baud_tick) begin
			if (tx_bit_cntr == 0) begin
				if (tx_req) begin
`ifndef SYNTHESIS
					$display("Send Character '%c'", tx_data);
`endif
					tx_shift_reg 	<= { 1'b1, tx_data };
					uart_tx		<= 1'b0;		// Start bit
					tx_bit_cntr	<= 9;
					tx_ready	<= 1'b1;
				end
			end
			else begin
				uart_tx 	<= tx_shift_reg[0];
				tx_shift_reg	<= { 1'b0, tx_shift_reg[8:1] };
				tx_bit_cntr	<= tx_bit_cntr - 1;
			end
		end
	end

endmodule
