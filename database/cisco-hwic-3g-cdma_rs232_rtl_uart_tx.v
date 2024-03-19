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
	input  wire 		clk, 
	input  wire 		reset_, 
	input  wire 		tx_req,
	output reg		    tx_ready,
	input  wire [7:0]	tx_data,
	output reg		    uart_txd
	);

	parameter CLK_HZ	= 100000000;
	parameter BAUD 		= 115200;

	localparam BAUD_DIVIDE  = CLK_HZ/BAUD;

	reg [$clog2(BAUD_DIVIDE)-1:0]	baud_cntr;
	reg 		baud_tick;

	always @(posedge clk) begin

		if (!reset_) begin
			baud_cntr 	<= 0;
			baud_tick	<= 1'b0;
		end
		else begin
			baud_tick	<= 1'b0;

			if (baud_cntr == 0) begin
				baud_cntr 	<= BAUD_DIVIDE-1;
				baud_tick 	<= 1'b1;
			end
			else begin
				baud_cntr	<= baud_cntr - 1;
			end
		end
	end

	reg [3:0] tx_bit_cntr;
	reg [8:0] tx_shift_reg;
	always @(posedge clk) begin

		if (!reset_) begin
			tx_bit_cntr	<= 0;
			uart_txd	<= 1'b1;
			tx_ready	<= 1'b0;
		end
		else begin
			tx_ready	<= 1'b0;

			if (baud_tick) begin
				if (tx_bit_cntr == 0) begin
					if (tx_req) begin
`ifndef SYNTHESIS
						$display("%m: Send Character '%c'", tx_data);
`endif
						tx_shift_reg 	<= { 1'b1, tx_data };
						uart_txd		<= 1'b0;		// Start bit
						tx_bit_cntr	<= 9;
						tx_ready	<= 1'b1;
					end
				end
				else begin
					uart_txd 	<= tx_shift_reg[0];
					tx_shift_reg	<= { 1'b0, tx_shift_reg[8:1] };
					tx_bit_cntr	<= tx_bit_cntr - 1;
				end
			end
		end
	end

endmodule
