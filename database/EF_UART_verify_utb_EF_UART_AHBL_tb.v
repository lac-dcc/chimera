// This program was cloned from: https://github.com/efabless/EF_UART
// License: Apache License 2.0

/*
	Copyright 2024 Efabless Corp.

	Author: Mohamed Shalan (mshalan@aucegypt.edu)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

/* THIS FILE IS GENERATED, edit it to complete the testbench */

`timescale		1ns/1ps

`default_nettype	none

`define			AHBL_AW			16
`define			MS_TB_SIMTIME		1_000_000

`include		"tb_macros.vh"

module EF_UART_AHBL_tb;

	// Change the following parameters as desired
	parameter real CLOCK_PERIOD = 100.0;
	parameter real RESET_DURATION = 999.0;

	// DON NOT Change the following parameters
	localparam [`AHBL_AW-1:0]
			RXDATA_REG_OFFSET =	`AHBL_AW'h0000,
			TXDATA_REG_OFFSET =	`AHBL_AW'h0004,
			PR_REG_OFFSET =	`AHBL_AW'h0008,
			CTRL_REG_OFFSET =	`AHBL_AW'h000c,
			CFG_REG_OFFSET =	`AHBL_AW'h0010,
			FIFOCTRL_REG_OFFSET =	`AHBL_AW'h0014,
			FIFOS_REG_OFFSET =	`AHBL_AW'h0018,
			MATCH_REG_OFFSET =	`AHBL_AW'h001c,
			IM_REG_OFFSET =		`AHBL_AW'h0f00,
			IC_REG_OFFSET =		`AHBL_AW'h0f0c,
			RIS_REG_OFFSET =	`AHBL_AW'h0f08,
			MIS_REG_OFFSET =	`AHBL_AW'h0f04;

	`TB_AHBL_SIG

	wire	[0:0]	rx;
	wire	[0:0]	tx;

	reg				vip_tx;
	wire			vip_rx;

	assign 			rx 		= vip_tx;
	assign 			vip_rx 	= tx;

	`TB_CLK(HCLK, CLOCK_PERIOD)
	`TB_ESRST(HRESETn, 1'b0, HCLK, RESET_DURATION)
	`TB_DUMP("AHBL_EF_UART_tb.vcd", EF_UART_AHBL_tb, 0)
	`TB_FINISH(`MS_TB_SIMTIME)

	EF_UART_AHBL DUV (
		`TB_AHBL_SLAVE_CONN,
		.rx(rx),
		.tx(tx)
	);

	`include "ahbl_tasks.vh"
	`include "serial_tasks.vh"

	`TB_TEST_EVENT(test1)
	`TB_TEST_EVENT(test2)
	`TB_TEST_EVENT(test3)

	localparam real BIT_TIME_115200 = 8680.55,
					BIT_TIME_57600 = 17361.11;
	initial begin
		#999 -> e_assert_reset;
		@(e_reset_done);

		// Do some initializations
		// Set the baud rate to 115,200 bps
		// 0.1152 = 10/((PR+1)*8) ==> PR = 9.85 (~10)
		// Actual baud = 113.636 baud/s
		// bit time = 8.6805 us (actual: 8.8 us)
		AHBL_W_WRITE(PR_REG_OFFSET, 16'd10);
		// Configure the line for 8N1
		AHBL_W_WRITE(CFG_REG_OFFSET, 32'b111111_000_0_1000);
		// Perform Test 1
		#1000 -> e_test1_start;
		@(e_test1_done);

		// Perform other tests
		#1000 -> e_test2_start;
		@(e_test2_done);

		#1000 -> e_test3_start;
		@(e_test3_done);

		// Finish the simulation
		$display("All tests have passed");
		#10_000 $finish();
	end

	// Serial Send Thread
	event e_send_serial_data;
	initial begin
		forever begin
			@(e_send_serial_data) send_serial_8N1(BIT_TIME_115200, 8'hA5);	
		end
	end

	reg [31:0] prdata;
	reg t1f;
	// Test 1 -- Receive an 8N1 frame @ 115000 baud rate
	`TB_TEST_BEGIN(test1)
	t1f = 0;
		// Test 1 code goes here
	// Enable the receiver and the UART
AHBL_W_WRITE(CTRL_REG_OFFSET, 32'b0_0_1_0_1);
//send_serial_8N1(8696, 8'hA5);
->e_send_serial_data;
forever begin
	if(t1f == 0) begin
		AHBL_W_READ(RIS_REG_OFFSET, prdata);
		if((prdata & 32'h8) != 0) begin
			#1_000;
			AHBL_W_READ(RXDATA_REG_OFFSET, prdata);
			#1_1000;
			if(prdata == 'hA5) begin
				->e_test1_done;
				//break;
				t1f = 1;
			end
			else begin
				$display("Received Wrong data %x vs. %x", prdata, 'hA5);
				$finish;
			end
		end
	end else
		#1000_000_000;
end 
	`TB_TEST_END(test1)
// Test 2 -- Send a frame @ 57600
`TB_TEST_BEGIN(test2)
// Disable the UART fully
AHBL_W_WRITE(CTRL_REG_OFFSET, 32'b0);
// Configure the prescaler for 57600
// Prescaler has to be 20.7 
// will go for 21 which gives 56818.18 baud/s
AHBL_W_WRITE(PR_REG_OFFSET, 16'd21);
// Configure the line for 812
AHBL_W_WRITE(CFG_REG_OFFSET, 32'b111111_101_1_1000);
// Enable the transmission
AHBL_W_WRITE(CTRL_REG_OFFSET, 32'b0_0_0_1_1);
// Send two different frames
AHBL_W_WRITE(TXDATA_REG_OFFSET, 'hC3);
AHBL_W_WRITE(TXDATA_REG_OFFSET, 'h91);
// Wait for the time of two frames = 2 x 12 x 17.6 = 416.666 usec
#416_666;
// This test is a manual one. Check the waveform!
`TB_TEST_END(test2)

// Test 3 -- Enable Loopback mode
`TB_TEST_BEGIN(test3)
// Disable the UART fully
AHBL_W_WRITE(CTRL_REG_OFFSET, 32'b0);
// Configure the prescaler for 57600
// Prescaler has to be 20.7 
// will go for 21 which gives 56818.18 baud/s
AHBL_W_WRITE(PR_REG_OFFSET, 16'd21);
// Configure the line for 812
AHBL_W_WRITE(CFG_REG_OFFSET, 32'b111111_101_1_1000);
// Enable TX, RX and LP
AHBL_W_WRITE(CTRL_REG_OFFSET, 32'b0_1_1_1_1);
// Send two different frames
AHBL_W_WRITE(TXDATA_REG_OFFSET, 'hC3);
AHBL_W_WRITE(TXDATA_REG_OFFSET, 'h91);
// Wait for the time of two frames = 2 x 12 x 17.6 = 416.666 usec
#416_666;
// Read the two frames
AHBL_W_READ(RXDATA_REG_OFFSET, prdata);
#1000;
if(prdata != 'hC3) begin
	$display("Test 3 Failed; received %x, expected %x", prdata, 8'hC3);
	$finish();
end
AHBL_W_READ(RXDATA_REG_OFFSET, prdata);
#1000;
if(prdata != 'h91) begin
	$display("Test 3 Failed; received %x, expected %x", prdata, 8'h91);
	$finish();
end
`TB_TEST_END(test3)

endmodule
