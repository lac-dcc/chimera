// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: debuger
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-17 15:15:31
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-18 19:02:41
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



module debuger (

	input [31:0] DEBUGER_AWADDR,
	input DEBUGER_AWVALID,
	output DEBUGER_AWREADY,

	input [63:0] DEBUGER_WDATA,   
	input [7:0] DEBUGER_WSTRB,
	input DEBUGER_WVALID,
	output DEBUGER_WREADY,

	output [1:0] DEBUGER_BRESP,
	output DEBUGER_BVALID,
	input DEBUGER_BREADY,

	input [31:0] DEBUGER_ARADDR,
	input DEBUGER_ARVALID,
	output DEBUGER_ARREADY,

	output [63:0] DEBUGER_RDATA,
	output [1:0] DEBUGER_RRESP,
	output DEBUGER_RVALID,
	input DEBUGER_RREADY,

	input CLK,
	input RSTn
	
);


 


	assign DEBUGER_AWREADY	= debuger_awready_qout;
	assign DEBUGER_WREADY	= debuger_wready_qout;
	assign DEBUGER_BRESP	= 2'b0;
	assign DEBUGER_BVALID	= debuger_bvalid_qout;
	assign DEBUGER_ARREADY = debuger_arready_qout;
	assign DEBUGER_RDATA	= 64'b0;
	assign DEBUGER_RRESP	= 2'b0;
	assign DEBUGER_RVALID	= debuger_rvalid_qout;

	wire debuger_awready_set, debuger_awready_rst, debuger_awready_qout;
	wire aw_en_set, aw_en_rst, aw_en_qout;
	wire debuger_wready_set, debuger_wready_rst, debuger_wready_qout;


	assign debuger_awready_set = ~debuger_awready_qout & DEBUGER_AWVALID & DEBUGER_WVALID;
	assign debuger_awready_rst = ~debuger_awready_set & (DEBUGER_BREADY & debuger_bvalid_qout);


	assign debuger_wready_set = ~debuger_wready_qout & DEBUGER_WVALID & DEBUGER_AWVALID;
	assign debuger_wready_rst = ~debuger_wready_set;

	gen_rsffr #(.DW(1)) debuger_awready_rsffr (.set_in(debuger_awready_set), .rst_in(debuger_awready_rst), .qout(debuger_awready_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) debuger_wready_rsffr (.set_in(debuger_wready_set), .rst_in(debuger_wready_rst), .qout(debuger_wready_qout), .CLK(CLK), .RSTn(RSTn));









	wire debuger_bvalid_set, debuger_bvalid_rst, debuger_bvalid_qout;
	wire debuger_arready_set, debuger_arready_rst, debuger_arready_qout;
	wire debuger_rvalid_set, debuger_rvalid_rst, debuger_rvalid_qout;

	assign debuger_bvalid_set = debuger_awready_qout && DEBUGER_AWVALID && ~debuger_bvalid_qout && debuger_wready_qout && DEBUGER_WVALID;
	assign debuger_bvalid_rst = ~debuger_bvalid_set & (DEBUGER_BREADY && debuger_bvalid_qout);
	assign debuger_arready_set = (~debuger_arready_qout && DEBUGER_ARVALID);
	assign debuger_arready_rst = ~debuger_arready_set;
	assign debuger_rvalid_set = (debuger_arready_qout & DEBUGER_ARVALID & ~debuger_rvalid_qout);
	assign debuger_rvalid_rst = ~debuger_rvalid_set & (debuger_rvalid_qout & DEBUGER_RREADY);

	gen_rsffr #(.DW(1)) debuger_bvalid_rsffr (.set_in(debuger_bvalid_set), .rst_in(debuger_bvalid_rst), .qout(debuger_bvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) debuger_arready_rsffr (.set_in(debuger_arready_set), .rst_in(debuger_arready_rst), .qout(debuger_arready_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) debuger_rvalid_rsffr (.set_in(debuger_rvalid_set), .rst_in(debuger_rvalid_rst), .qout(debuger_rvalid_qout), .CLK(CLK), .RSTn(RSTn));





`define UART_TX 32'h20000000
`define TIMER   32'h20000008
`define COTRL   32'h20000010



reg [63:0] cycle_cnt;
reg timer_start;

always @(posedge CLK or negedge RSTn) begin
	if (~RSTn) begin
		cycle_cnt <= 0;
		timer_start <= 1'b0;
	end
	else begin
		if ( (DEBUGER_AWADDR == `TIMER) & DEBUGER_AWVALID & DEBUGER_AWREADY & DEBUGER_WVALID & DEBUGER_WREADY & (DEBUGER_WDATA == 64'd1)) begin
			timer_start <= 1'b1;
		end
		if ( (DEBUGER_AWADDR == `TIMER) & DEBUGER_AWVALID & DEBUGER_WVALID & (DEBUGER_WDATA == 64'd0)) begin
			timer_start <= 1'b0;
		end		
		if (timer_start) begin
			cycle_cnt <= cycle_cnt + 1;
		end
		else begin
			cycle_cnt <= cycle_cnt;
		end
	end


end







always @(posedge CLK) begin

	if ( (DEBUGER_AWADDR == `UART_TX) & DEBUGER_AWVALID & DEBUGER_AWREADY & DEBUGER_WVALID & DEBUGER_WREADY) begin
		$write("%c", DEBUGER_WDATA[7:0]);
	end


end



integer file;
always @(posedge CLK ) begin

	if ( (DEBUGER_AWADDR == `COTRL) & DEBUGER_AWVALID & DEBUGER_AWREADY & DEBUGER_WVALID & DEBUGER_WREADY & (DEBUGER_WDATA == 64'd1)) begin

		$display("cycle_cnt = %d", cycle_cnt);
		$display( "The DMIPS/MHz is %f", 1000000.0/(cycle_cnt/500.0)/1757.0 );


		file = $fopen("./ci/dhrystone.json", "w");

		$fwrite(file, "{\n  \"schemaVersion\": 1, \n  \"label\": \"dhrystone\", \n  \"message\": \"%f\", \n  \"color\": \"ff69b4\" \n}", 1000000.0/(cycle_cnt/500.0)/1757.0 );
		$fclose(file);

		$finish;

	end
end




endmodule







