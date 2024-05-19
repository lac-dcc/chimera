// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: DTM
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-24 11:33:45
* @Last Modified by:   Ruige Lee
<<<<<<< HEAD:RiftChip/debug/DTM.v
* @Last Modified time: 2020-12-30 16:56:31
=======
* @Last Modified time: 2021-01-03 12:04:25
>>>>>>> master:core/debug/DTM.v
*/

/*
  Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

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


`timescale 1 ns / 1 ps


module DTM (


	//from host
	input TCK,
	input TDI,
	output TDO,
	input TMS,
	input TRST,


	//from AXI lite

	output [7:0] M_DTM_AXI_AWADDR,
	output [2:0] M_DTM_AXI_AWPROT,
	output M_DTM_AXI_AWVALID,
	input M_DTM_AXI_AWREADY,

	output [31:0] M_DTM_AXI_WDATA,
	output [3:0] M_DTM_AXI_WSTRB,
	output M_DTM_AXI_WVALID,
	input M_DTM_AXI_WREADY,

	input [1:0] M_DTM_AXI_BRESP,
	input M_DTM_AXI_BVALID,
	output M_DTM_AXI_BREADY,

	output [7:0] M_DTM_AXI_ARADDR,
	output [2:0] M_DTM_AXI_ARPROT,
	output M_DTM_AXI_ARVALID,
	input M_DTM_AXI_ARREADY,

	input [31:0] M_DTM_AXI_RDATA,
	input [1:0] M_DTM_AXI_RRESP,
	input M_DTM_AXI_RVALID,
	output M_DTM_AXI_RREADY


);

wire RSTn = ~TRST;
// TTTTTTTTTTTTTTTTTTTTTTT         AAA               PPPPPPPPPPPPPPPPP   
// T:::::::::::::::::::::T        A:::A              P::::::::::::::::P  
// T:::::::::::::::::::::T       A:::::A             P::::::PPPPPP:::::P 
// T:::::TT:::::::TT:::::T      A:::::::A            PP:::::P     P:::::P
// TTTTTT  T:::::T  TTTTTT     A:::::::::A             P::::P     P:::::P
//         T:::::T            A:::::A:::::A            P::::P     P:::::P
//         T:::::T           A:::::A A:::::A           P::::PPPPPP:::::P 
//         T:::::T          A:::::A   A:::::A          P:::::::::::::PP  
//         T:::::T         A:::::A     A:::::A         P::::PPPPPPPPP    
//         T:::::T        A:::::AAAAAAAAA:::::A        P::::P            
//         T:::::T       A:::::::::::::::::::::A       P::::P            
//         T:::::T      A:::::AAAAAAAAAAAAA:::::A      P::::P            
//       TT:::::::TT   A:::::A             A:::::A   PP::::::PP          
//       T:::::::::T  A:::::A               A:::::A  P::::::::P          
//       T:::::::::T A:::::A                 A:::::A P::::::::P          
//       TTTTTTTTTTTAAAAAAA                   AAAAAAAPPPPPPPPPP     




localparam TEST_LOGIC_RESET = 0;
localparam RUN_TEST_IDLE = 1;
localparam SELECT_DR_SCAN = 2;
localparam CAPTURE_DR = 3;
localparam SHIFT_DR = 4;
localparam EXIT_1_DR = 5;
localparam PAUSE_DR = 6;
localparam EXIT_2_DR = 7;
localparam UPDATE_DR = 8;
localparam SELECT_IR_SCAN = 9;
localparam CAPTURE_IR = 10;
localparam SHIFT_IR = 11;
localparam EXIT_1_IR = 12;
localparam PAUSE_IR = 13;
localparam EXIT_2_IR = 14;
localparam UPDATE_IR = 15;


wire [3:0] tap_state_dnxt;
wire [3:0] tap_state_qout;


assign tap_state_dnxt = 
	  ({4{tap_state_qout == TEST_LOGIC_RESET}} & {4{ TMS}} & TEST_LOGIC_RESET)
	| ({4{tap_state_qout == TEST_LOGIC_RESET}} & {4{~TMS}} & RUN_TEST_IDLE)

	| ({4{tap_state_qout == RUN_TEST_IDLE}} & {4{ TMS}} & SELECT_DR_SCAN)
	| ({4{tap_state_qout == RUN_TEST_IDLE}} & {4{~TMS}} & RUN_TEST_IDLE)

	| ({4{tap_state_qout == SELECT_DR_SCAN}} & {4{ TMS}} & SELECT_IR_SCAN)
	| ({4{tap_state_qout == SELECT_DR_SCAN}} & {4{~TMS}} & CAPTURE_DR)

	| ({4{tap_state_qout == CAPTURE_DR}} & {4{ TMS}} & EXIT_1_DR)
	| ({4{tap_state_qout == CAPTURE_DR}} & {4{~TMS}} & SHIFT_DR)

	| ({4{tap_state_qout == SHIFT_DR}} & {4{ TMS}} & EXIT_1_DR)
	| ({4{tap_state_qout == SHIFT_DR}} & {4{~TMS}} & SHIFT_DR)

	| ({4{tap_state_qout == EXIT_1_DR}} & {4{ TMS}} & UPDATE_DR)
	| ({4{tap_state_qout == EXIT_1_DR}} & {4{~TMS}} & PAUSE_DR)

	| ({4{tap_state_qout == PAUSE_DR}} & {4{ TMS}} & EXIT_2_DR)
	| ({4{tap_state_qout == PAUSE_DR}} & {4{~TMS}} & PAUSE_DR)

	| ({4{tap_state_qout == EXIT_2_DR}} & {4{ TMS}} & UPDATE_DR)
	| ({4{tap_state_qout == EXIT_2_DR}} & {4{~TMS}} & SHIFT_DR)

	| ({4{tap_state_qout == UPDATE_DR}} & {4{ TMS}} & SELECT_DR_SCAN)
	| ({4{tap_state_qout == UPDATE_DR}} & {4{~TMS}} & RUN_TEST_IDLE)

	| ({4{tap_state_qout == SELECT_IR_SCAN}} & {4{ TMS}} & TEST_LOGIC_RESET)
	| ({4{tap_state_qout == SELECT_IR_SCAN}} & {4{~TMS}} & CAPTURE_IR)

	| ({4{tap_state_qout == CAPTURE_IR}} & {4{ TMS}} & EXIT_1_IR)
	| ({4{tap_state_qout == CAPTURE_IR}} & {4{~TMS}} & SHIFT_IR)

	| ({4{tap_state_qout == SHIFT_IR}} & {4{ TMS}} & EXIT_1_IR)
	| ({4{tap_state_qout == SHIFT_IR}} & {4{~TMS}} & SHIFT_IR)

	| ({4{tap_state_qout == EXIT_1_IR}} & {4{ TMS}} & UPDATE_IR)
	| ({4{tap_state_qout == EXIT_1_IR}} & {4{~TMS}} & PAUSE_IR)

	| ({4{tap_state_qout == PAUSE_IR}} & {4{ TMS}} & EXIT_2_IR)
	| ({4{tap_state_qout == PAUSE_IR}} & {4{~TMS}} & PAUSE_IR)

	| ({4{tap_state_qout == EXIT_2_IR}} & {4{ TMS}} & UPDATE_IR)
	| ({4{tap_state_qout == EXIT_2_IR}} & {4{~TMS}} & SHIFT_IR)

	| ({4{tap_state_qout == UPDATE_IR}} & {4{ TMS}} & SELECT_DR_SCAN)
	| ({4{tap_state_qout == UPDATE_IR}} & {4{~TMS}} & RUN_TEST_IDLE)

gen_dffr # (.DW(4)) tap_state ( .dnxt(tap_state_dnxt), .qout(tap_state_qout), .CLK(TCK), .RSTn(RSTn));




wire [4:0] shift_IR_dnxt;
wire [4:0] shift_IR_qout;
gen_dffr # (.DW(5)) shift_IR ( .dnxt(shift_IR_dnxt), .qout(shift_IR_qout), .CLK(TCK), .RSTn(RSTn));

assign shift_IR_dnxt = 
	  {5{tap_state_qout == SHIFT_IR}} & {TDI, shift_IR_qout[4:1]}
	| {5{tap_state_qout != SHIFT_IR}} & shift_IR_qout[4:0];




wire [4:0] ir_dnxt;
wire [4:0] ir_qout;
gen_dffr # (.DW(5)) IR ( .dnxt(ir_dnxt), .qout(ir_qout), .CLK(TCK), .RSTn(RSTn));

assign ir_dnxt = 
	  {5{tap_state_qout == TEST_LOGIC_RESET}} & 5'h1
	| {5{tap_state_qout == UPDATE_IR}} & ( ((shift_IR_qout == 5'h1) & 5'h1)
											| ((shift_IR_qout == 5'h10) & 5'h10)
											| ((shift_IR_qout == 5'h10) & 5'h11)
											| 5'h0
										)
	| {5{(tap_state_qout != TEST_LOGIC_RESET) & (tap_state_qout != UPDATE_IR)}} & ir_qout[4:0];



wire [31:0] IDCODE_shift_dnxt;
wire [31:0] IDCODE_shift_qout;
gen_dffr # (.DW(32)) IDCODE_shift ( .dnxt(IDCODE_shift_dnxt), .qout(IDCODE_shift_qout), .CLK(~TCK), .RSTn(RSTn));

assign IDCODE_shift_dnxt = 
	({32{tap_state_qout == CAPTURE_DR & (ir_qout == 5'h1)}} & IDCODE)
	| 
	({32{(tap_state_qout == SHIFT_DR) & (ir_qout == 5'h1)}} & {TDI, IDCODE_shift_qout[31:1]})
	|
	({32{~(tap_state_qout == SHIFT_DR & ir_qout == 5'h1) & ~(tap_state_qout == CAPTURE_DR & ir_qout == 5'h1}} & IDCODE_shift_qout);




wire [31:0] dtmcs_shift_dnxt;
wire [31:0] dtmcs_shift_qout;
gen_dffr # (.DW(32)) dtmcs_shift ( .dnxt(dtmcs_shift_dnxt), .qout(dtmcs_shift_qout), .CLK(TCK), .RSTn(RSTn));

assign dtmcs_shift_dnxt = 
	({32{tap_state_qout == CAPTURE_DR & (ir_qout == 5'h10)}} & dtmcs_qout)
	| 
	({32{(tap_state_qout == SHIFT_DR) & (ir_qout == 5'h10)}} & {TDI, dtmcs_shift_qout[31:1]})
	|
	({32{~(tap_state_qout == SHIFT_DR & ir_qout == 5'h10) & ~(tap_state_qout == CAPTURE_DR & ir_qout == 5'h10}} & dtmcs_shift_qout);




wire [41:0] dmi_shift_dnxt;
wire [41:0] dmi_shift_qout;
gen_dffr # (.DW(42)) dmi ( .dnxt(dmi_shift_dnxt), .qout(dmi_shift_qout), .CLK(~TCK), .RSTn(RSTn));

assign dmi_shift_dnxt = 
	({42{  tap_state_qout == CAPTURE_DR & (ir_qout == 5'h11)}} & dmi)
	| 
	({42{ (tap_state_qout == SHIFT_DR) & (ir_qout == 5'h11)}} & {TDI, dmi_shift_qout[41:1]})
	|
	({42{~(tap_state_qout == SHIFT_DR & ir_qout == 5'h11) & ~(tap_state_qout == CAPTURE_DR & ir_qout == 5'h11}} & dmi_shift_qout);



assign TDO = ((tap_state_qout == SHIFT_IR) & shift_IR_qout[0])
			|
			( tap_state_qout == SHIFT_DR & 
				(
					(ir_qout == 5'h1  & IDCODE_shift_qout[0])
					|
					(ir_qout == 5'h10 & dtmcs_shift_qout[0])
					|
					(ir_qout == 5'h11 & dmi_shift_qout[0])
				)
			)
			| 1'b0;






wire [31:0] IDCODE = 32'b0;

wire [31:0] dtmcs_dnxt;
wire [31:0] dtmcs_qout;
gen_dffr # (.DW(32)) dtmcs ( .dnxt(dtmcs_dnxt), .qout(dtmcs_qout), .CLK(TCK), .RSTn(RSTn));

assign dtmcs_dnxt = 
	({32{tap_state_qout == UPDATE_DR & ir_qout == 5'h10}} & dtmcs_shift_qout)
	|
	({32{~(tap_state_qout == UPDATE_DR & ir_qout == 5'h10)}} & dtmcs_qout);






//                AAA               XXXXXXX       XXXXXXXIIIIIIIIII     444444444                   LLLLLLLLLLL             IIIIIIIIIITTTTTTTTTTTTTTTTTTTTTTTEEEEEEEEEEEEEEEEEEEEEE
//               A:::A              X:::::X       X:::::XI::::::::I    4::::::::4                   L:::::::::L             I::::::::IT:::::::::::::::::::::TE::::::::::::::::::::E
//              A:::::A             X:::::X       X:::::XI::::::::I   4:::::::::4                   L:::::::::L             I::::::::IT:::::::::::::::::::::TE::::::::::::::::::::E
//             A:::::::A            X::::::X     X::::::XII::::::II  4::::44::::4                   LL:::::::LL             II::::::IIT:::::TT:::::::TT:::::TEE::::::EEEEEEEEE::::E
//            A:::::::::A           XXX:::::X   X:::::XXX  I::::I   4::::4 4::::4                     L:::::L                 I::::I  TTTTTT  T:::::T  TTTTTT  E:::::E       EEEEEE
//           A:::::A:::::A             X:::::X X:::::X     I::::I  4::::4  4::::4                     L:::::L                 I::::I          T:::::T          E:::::E             
//          A:::::A A:::::A             X:::::X:::::X      I::::I 4::::4   4::::4                     L:::::L                 I::::I          T:::::T          E::::::EEEEEEEEEE   
//         A:::::A   A:::::A             X:::::::::X       I::::I4::::444444::::444 ---------------   L:::::L                 I::::I          T:::::T          E:::::::::::::::E   
//        A:::::A     A:::::A            X:::::::::X       I::::I4::::::::::::::::4 -:::::::::::::-   L:::::L                 I::::I          T:::::T          E:::::::::::::::E   
//       A:::::AAAAAAAAA:::::A          X:::::X:::::X      I::::I4444444444:::::444 ---------------   L:::::L                 I::::I          T:::::T          E::::::EEEEEEEEEE   
//      A:::::::::::::::::::::A        X:::::X X:::::X     I::::I          4::::4                     L:::::L                 I::::I          T:::::T          E:::::E             
//     A:::::AAAAAAAAAAAAA:::::A    XXX:::::X   X:::::XXX  I::::I          4::::4                     L:::::L         LLLLLL  I::::I          T:::::T          E:::::E       EEEEEE
//    A:::::A             A:::::A   X::::::X     X::::::XII::::::II        4::::4                   LL:::::::LLLLLLLLL:::::LII::::::II      TT:::::::TT      EE::::::EEEEEEEE:::::E
//   A:::::A               A:::::A  X:::::X       X:::::XI::::::::I      44::::::44                 L::::::::::::::::::::::LI::::::::I      T:::::::::T      E::::::::::::::::::::E
//  A:::::A                 A:::::A X:::::X       X:::::XI::::::::I      4::::::::4                 L::::::::::::::::::::::LI::::::::I      T:::::::::T      E::::::::::::::::::::E
// AAAAAAA                   AAAAAAAXXXXXXX       XXXXXXXIIIIIIIIII      4444444444                 LLLLLLLLLLLLLLLLLLLLLLLLIIIIIIIIII      TTTTTTTTTTT      EEEEEEEEEEEEEEEEEEEEEE

	wire [1:0] op = dmi_shift_qout[1:0];
	reg [7:0] axi_awaddr;
	reg [31:0] axi_wdata;
	reg [7:0] axi_araddr;
	reg start_single_write;
	reg start_single_read;

	reg [41:0] dmi;

	wire write_resp_error;
	wire read_resp_error;


	always @(posedge TCK or negedge RSTn) begin
		if(~RSTn) begin
			dmi <= 39'b0;
		end else begin
			if (tap_state_qout == UPDATE_DR & ir_qout == 5'h11) begin
				dmi <= dmi_shift_qout;

				if ( op == 1 || op == 2 ) begin
					dmi[1:0] <= 2'd3;
				end
			end

			else begin
				dmi <= dmi;
				if ( M_DTM_AXI_RVALID ) begin
					dmi[33:2] <= M_DTM_AXI_RDATA;
					dmi[1:0] <= 2'b0;
				end
				if ( M_DTM_AXI_BRESP == 2'b0 && M_DTM_AXI_BVALID ) begin
					dmi[1:0] <= 2'b0;
				end
				if ( read_resp_error || write_resp_error ) begin
					dmi[1:0] <= 2'd2;
				end
			end
		end
	end















	always @(posedge TCK or negedge RSTn) begin
		if(~RSTn) begin
			axi_awaddr <= 8'b0;
			axi_araddr <= 8'b0;
			axi_wdata <= 32'b0;
			start_single_write <= 1'b0;
			start_single_read <= 1'b0;

		end else begin
			if (tap_state_qout == UPDATE_DR & ir_qout == 5'h11) begin
				axi_awaddr <= dmi_shift_qout[41:34];
				axi_wdata <= dmi_shift_qout[33:2];
				axi_araddr <= dmi_shift_qout[41:34];
				start_single_write <= 1'b0;
				start_single_read <= 1'b0;

				if ( op == 2 ) begin
					start_single_write <= 1'b1;
				end

				if ( op == 1 ) begin
					start_single_read <= 1'b1;
				end
			end
			else begin
				axi_awaddr <= axi_awaddr;
				axi_wdata <= axi_wdata;
				axi_araddr <= axi_araddr;
				start_single_write <= 1'b0;
				start_single_read <= 1'b0;
			end
		end
	end




	reg axi_awvalid;
	reg axi_wvalid;
	reg axi_arvalid;
	reg axi_rready;
	reg axi_bready;









	// I/O Connections assignments
	assign M_DTM_AXI_AWADDR	= axi_awaddr;
	assign M_DTM_AXI_WDATA	= axi_wdata;
	assign M_DTM_AXI_AWPROT	= 3'b000;
	assign M_DTM_AXI_AWVALID = axi_awvalid;
	assign M_DTM_AXI_WVALID	= axi_wvalid;
		assign M_DTM_AXI_WSTRB	= 4'b1111;
	assign M_DTM_AXI_BREADY	= axi_bready;
	assign M_DTM_AXI_ARADDR	= axi_araddr;
	assign M_DTM_AXI_ARVALID	= axi_arvalid;
	assign M_DTM_AXI_ARPROT	= 3'b001;
	assign M_DTM_AXI_RREADY	= axi_rready;




	always @(posedge TCK or negedge RSTn) begin
		if ( ~RSTn ) begin
			axi_awvalid <= 1'b0;
		end
		else begin
			if (start_single_write) begin
				axi_awvalid <= 1'b1;
			end
			else if (M_DTM_AXI_AWREADY && axi_awvalid) begin
				axi_awvalid <= 1'b0;
			end
		end
	end


	always @(posedge TCK or negedge RSTn) begin
		if ( ~RSTn ) begin
			 axi_wvalid <= 1'b0;
		end
		else if (start_single_write) begin
			axi_wvalid <= 1'b1;
		end
		else if (M_DTM_AXI_WREADY && axi_wvalid) begin
			axi_wvalid <= 1'b0;
		end
	end

	always @(posedge TCK or negedge RSTn) begin
		if ( ~RSTn ) begin
			axi_bready <= 1'b0;
		end
		else if (M_DTM_AXI_BVALID && ~axi_bready) begin
			axi_bready <= 1'b1;
		end
		else if (axi_bready) begin
			axi_bready <= 1'b0;
		end
		else
		  axi_bready <= axi_bready;
	end

	assign write_resp_error = (axi_bready & M_DTM_AXI_BVALID & M_DTM_AXI_BRESP[1]);


	always @(posedge TCK or negedge RSTn) begin
		if ( ~RSTn ) begin
			axi_arvalid <= 1'b0;
		end
		else if (start_single_read) begin
			axi_arvalid <= 1'b1;
		end
		else if (M_DTM_AXI_ARREADY && axi_arvalid) begin
			axi_arvalid <= 1'b0;
		end
	end

	always @(posedge TCK or negedge RSTn) begin
		if ( ~RSTn ) begin
			axi_rready <= 1'b0;
		end
		else if (M_DTM_AXI_RVALID && ~axi_rready) begin
			axi_rready <= 1'b1;
		end
		else if (axi_rready) begin
			axi_rready <= 1'b0;
		end
	end

	assign read_resp_error = (axi_rready & M_DTM_AXI_RVALID & M_DTM_AXI_RRESP[1]);











endmodule







