// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: DM
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-24 11:34:20
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2020-12-30 16:52:34
*/


/*
  Copyright (c) 2020 - 2020 Ruige Lee <wut.ruigeli@gmail.com>

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


module DM #
	(
		parameter MAXHART = 1
	)
	(


	input [7:0] S_DM_AXI_AWADDR,
	input [2:0] S_DM_AXI_AWPROT,
	input S_DM_AXI_AWVALID,
	output S_DM_AXI_AWREADY,

	input [31:0] S_DM_AXI_WDATA,  
	input [3:0] S_DM_AXI_WSTRB,
	input S_DM_AXI_WVALID,
	output S_DM_AXI_WREADY,

	output [1:0] S_DM_AXI_BRESP,
	output S_DM_AXI_BVALID,
	input S_DM_AXI_BREADY,

	input [7:0] S_DM_AXI_ARADDR,
	input [2:0] S_DM_AXI_ARPROT,
	input S_DM_AXI_ARVALID,
	output S_DM_AXI_ARREADY,

	output [31:0] S_DM_AXI_RDATA,
	output [1:0] S_DM_AXI_RRESP,
	output S_DM_AXI_RVALID,
	input S_DM_AXI_RREADY



	//core region
	output ndmreset,
	output ndmresetn,
	output dmactive,

	//core monitor
	output [MAXHART-1:0] hart_resetReq,
	output [MAXHART-1:0] hart_haltReq,
	output [MAXHART-1:0] hart_haltOnReset,
	output [MAXHART-1:0] hart_resumeReq,
	input  [MAXHART-1:0] hart_isInReset,
	input  [MAXHART-1:0] hart_isInHalt,

	output accessReg_valid,
	input accessReg_ready,
	output [15:0] accessReg_addr,
	output accessReg_wen,
	input [63:0] accessReg_read,
	output [63:0] accessReg_write,
	output is32w,

	//system bus access
	output [63:0] M_SYSBUS_AXI_AWADDR,
	output M_SYSBUS_AXI_AWVALID,
	input M_SYSBUS_AXI_AWREADY,
	output [2:0] M_SYSBUS_AXI_AWPROT,

	output [63:0] M_SYSBUS_AXI_WDATA,
	output [7:0] M_SYSBUS_AXI_WSTRB,
	output M_SYSBUS_AXI_WVALID,
	input M_SYSBUS_AXI_WREADY,
	output [3:0] M_SYSBUS_AXI_WSTRB,

	input [1:0] M_SYSBUS_AXI_BRESP,
	input M_SYSBUS_AXI_BVALID,
	output M_SYSBUS_AXI_BREADY,

	output [63:0] M_SYSBUS_AXI_ARADDR,
	output M_SYSBUS_AXI_ARVALID,
	input M_SYSBUS_AXI_ARREADY,
	output [2:0] M_SYSBUS_AXI_ARPROT,

	input [63:0] M_SYSBUS_AXI_RDATA,
	input [1:0] M_SYSBUS_AXI_RRESP,
	input M_SYSBUS_AXI_RVALID,
	output M_SYSBUS_AXI_RREADY,






	input CLK,
	input RSTn



);



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



	// AXI4LITE signals
	reg [7:0] axi_awaddr;
	reg axi_awready;
	reg axi_wready;
	reg [1 : 0] axi_bresp;
	reg axi_bvalid;
	reg [7:0] axi_araddr;
	reg axi_arready;
	reg [31 0] axi_rdata;
	reg [1:0] axi_rresp;
	reg axi_rvalid;


	wire slv_reg_rden;
	wire slv_reg_wren;
	wire [31:0] reg_data_out;
	reg	 aw_en;

	assign S_DM_AXI_AWREADY = axi_awready;
	assign S_DM_AXI_WREADY	= axi_wready;
	assign S_DM_AXI_BRESP = axi_bresp;
	assign S_DM_AXI_BVALID	= axi_bvalid;
	assign S_DM_AXI_ARREADY = axi_arready;
	assign S_DM_AXI_RDATA = axi_rdata;
	assign S_DM_AXI_RRESP = axi_rresp;
	assign S_DM_AXI_RVALID	= axi_rvalid;

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_awready <= 1'b0;
			aw_en <= 1'b1;
		end 
		else begin    
			if (~axi_awready && S_DM_AXI_AWVALID && S_DM_AXI_WVALID && aw_en) begin
				axi_awready <= 1'b1;
				aw_en <= 1'b0;
			end
			else if (S_DM_AXI_BREADY && axi_bvalid) begin
				aw_en <= 1'b1;
				axi_awready <= 1'b0;
			end
			else begin
				axi_awready <= 1'b0;
			end
		end
	end


	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
		  axi_awaddr <= 0;
		end 
		else begin
			if (~axi_awready && S_DM_AXI_AWVALID && S_DM_AXI_WVALID && aw_en) begin
				axi_awaddr <= S_DM_AXI_AWADDR;
			end
		end 
	end       

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_wready <= 1'b0;
		end 
		else begin    
			if (~axi_wready && S_DM_AXI_WVALID && S_DM_AXI_AWVALID && aw_en ) begin
				axi_wready <= 1'b1;
			end
			else begin
				axi_wready <= 1'b0;
			end
		end 
	end       

	assign slv_reg_wren = axi_wready && S_DM_AXI_WVALID && axi_awready && S_DM_AXI_AWVALID;










	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_bvalid <= 0;
			axi_bresp <= 2'b0;
		end 
		else begin
			if (axi_awready && S_DM_AXI_AWVALID && ~axi_bvalid && axi_wready && S_DM_AXI_WVALID) begin
				axi_bvalid <= 1'b1;
				axi_bresp  <= 2'b0;
			end
			else begin
				if (S_DM_AXI_BREADY && axi_bvalid) begin
					axi_bvalid <= 1'b0; 
				end  
			end
		end
	end   

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_arready <= 1'b0;
			axi_araddr  <= 32'b0;
		end 
		else begin    
			if (~axi_arready && S_DM_AXI_ARVALID) begin
				axi_arready <= 1'b1;
				axi_araddr  <= S_DM_AXI_ARADDR;
			end
			else begin
				axi_arready <= 1'b0;
			end
		end 
	end       

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_rvalid <= 0;
			axi_rresp  <= 0;
		end 
		else begin    
			if (axi_arready && S_DM_AXI_ARVALID && ~axi_rvalid) begin
				axi_rvalid <= 1'b1;
				axi_rresp  <= 2'b0;
			end   
			else if (axi_rvalid && S_DM_AXI_RREADY) begin
				axi_rvalid <= 1'b0;
			end                
		end
	end    

	assign slv_reg_rden = axi_arready & S_DM_AXI_ARVALID & ~axi_rvalid;



	always @(posedge  or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			axi_rdata  <= 0;
		end
		else begin
			if (slv_reg_rden) begin
				axi_rdata <= reg_data_out;     // register read data
			end   
		end
	end    



// DDDDDDDDDDDDD        MMMMMMMM               MMMMMMMM
// D::::::::::::DDD     M:::::::M             M:::::::M
// D:::::::::::::::DD   M::::::::M           M::::::::M
// DDD:::::DDDDD:::::D  M:::::::::M         M:::::::::M
//   D:::::D    D:::::D M::::::::::M       M::::::::::M
//   D:::::D     D:::::DM:::::::::::M     M:::::::::::M
//   D:::::D     D:::::DM:::::::M::::M   M::::M:::::::M
//   D:::::D     D:::::DM::::::M M::::M M::::M M::::::M
//   D:::::D     D:::::DM::::::M  M::::M::::M  M::::::M
//   D:::::D     D:::::DM::::::M   M:::::::M   M::::::M
//   D:::::D     D:::::DM::::::M    M:::::M    M::::::M
//   D:::::D    D:::::D M::::::M     MMMMM     M::::::M
// DDD:::::DDDDD:::::D  M::::::M               M::::::M
// D:::::::::::::::DD   M::::::M               M::::::M
// D::::::::::::DDD     M::::::M               M::::::M
// DDDDDDDDDDDDD        MMMMMMMM               MMMMMMMM



wire data0_wsel;
wire [31:0] data0_dnxt;
wire [31:0] data0_qout;

assign data0_wsel = slv_reg_wren & axi_awaddr == 8'h4;
assign data0_dnxt = ({32{accessReg_ready & transfer & ~write}} & accessReg_read[31:0])
					|
					({32{data0_wsel}} & S_DM_AXI_WDATA);
gen_dffr # (.DW(32)) data0_dffr ( .dnxt(data0_dnxt), .qout(data0_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

wire data1_wsel;
wire [31:0] data1_dnxt;
wire [31:0] data1_qout;
assign data1_wsel = slv_reg_wren & axi_awaddr == 8'h5;
assign data1_dnxt = ({32{accessReg_ready & transfer & ~write & aarsize == 3'd3}} & accessReg_read[63:32])
					|
					({32{data0_wsel}} & S_DM_AXI_WDATA);
gen_dffr # (.DW(32)) data1_dffr ( .dnxt(data1_dnxt), .qout(data1_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

wire data2_wsel;
wire [31:0] data2_dnxt;
wire [31:0] data2_qout;
assign data2_wsel = slv_reg_wren & axi_awaddr == 8'h6;
assign data2_dnxt = {32{data0_wsel}} & S_DM_AXI_WDATA;
gen_dffr # (.DW(32)) data2_dffr ( .dnxt(data2_dnxt), .qout(data2_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

wire data3_wsel;
wire [31:0] data3_dnxt;
wire [31:0] data3_qout;
assign data3_wsel = slv_reg_wren & axi_awaddr == 8'h7;
assign data3_dnxt = {32{data0_wsel}} & S_DM_AXI_WDATA;
gen_dffr # (.DW(32)) data3_dffr ( .dnxt(data3_dnxt), .qout(data3_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

wire data4_wsel;
wire [31:0] data4_dnxt;
wire [31:0] data4_qout;
assign data4_wsel = slv_reg_wren & axi_awaddr == 8'h8;
assign data4_dnxt = {32{data0_wsel}} & S_DM_AXI_WDATA;
gen_dffr # (.DW(32)) data4_dffr ( .dnxt(data4_dnxt), .qout(data4_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));


wire data5_wsel;
wire [31:0] data5_dnxt;
wire [31:0] data5_qout;
assign data5_wsel = slv_reg_wren & axi_awaddr == 8'h9;
assign data5_dnxt = {32{data0_wsel}} & S_DM_AXI_WDATA;
gen_dffr # (.DW(32)) data5_dffr ( .dnxt(data5_dnxt), .qout(data5_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));


wire [31:0] haltsum0;


assign reg_data_out =
	  ({32{axi_araddr == 8'h4}} & data0_qout)
	| ({32{axi_araddr == 8'h5}} & data1_qout)
	| ({32{axi_araddr == 8'h6}} & data2_qout)
	| ({32{axi_araddr == 8'h7}} & data3_qout)
	| ({32{axi_araddr == 8'h8}} & data4_qout)
	| ({32{axi_araddr == 8'h9}} & data5_qout)


	| ({32{axi_araddr == 8'h10}} & dmcontrol)
	| ({32{axi_araddr == 8'h11}} & dmstatus)

	| ({32{axi_araddr == 8'h16}} & abstractcs)


	| ({32{axi_araddr == 8'h38}} & sbcs)

	| ({32{axi_araddr == 8'h39}} & sbaddress0_qout)
	| ({32{axi_araddr == 8'h3a}} & sbaddress1_qout)


	| ({32{axi_araddr == 8'h3c}} & sbdata0_qout)
	| ({32{axi_araddr == 8'h3d}} & sbdata1_qout)


	| ({32{axi_araddr == 8'h40}} & haltsum0)
	| 32'b0;


	assign haltsum0 = 32'b0 | hart_isInHalt;





// RRRRRRRRRRRRRRRRR                                                                     tttt               HHHHHHHHH     HHHHHHHHH                  lllllll         tttt                       CCCCCCCCCCCCC                                            tttt                                              lllllll 
// R::::::::::::::::R                                                                 ttt:::t               H:::::::H     H:::::::H                  l:::::l      ttt:::t                    CCC::::::::::::C                                         ttt:::t                                              l:::::l 
// R::::::RRRRRR:::::R                                                                t:::::t               H:::::::H     H:::::::H                  l:::::l      t:::::t                  CC:::::::::::::::C                                         t:::::t                                              l:::::l 
// RR:::::R     R:::::R                                                               t:::::t               HH::::::H     H::::::HH                  l:::::l      t:::::t                 C:::::CCCCCCCC::::C                                         t:::::t                                              l:::::l 
//   R::::R     R:::::R    eeeeeeeeeeee        ssssssssss       eeeeeeeeeeee    ttttttt:::::ttttttt           H:::::H     H:::::H    aaaaaaaaaaaaa    l::::lttttttt:::::ttttttt          C:::::C       CCCCCC   ooooooooooo   nnnn  nnnnnnnn    ttttttt:::::ttttttt   rrrrr   rrrrrrrrr      ooooooooooo    l::::l 
//   R::::R     R:::::R  ee::::::::::::ee    ss::::::::::s    ee::::::::::::ee  t:::::::::::::::::t           H:::::H     H:::::H    a::::::::::::a   l::::lt:::::::::::::::::t         C:::::C               oo:::::::::::oo n:::nn::::::::nn  t:::::::::::::::::t   r::::rrr:::::::::r   oo:::::::::::oo  l::::l 
//   R::::RRRRRR:::::R  e::::::eeeee:::::eess:::::::::::::s  e::::::eeeee:::::eet:::::::::::::::::t           H::::::HHHHH::::::H    aaaaaaaaa:::::a  l::::lt:::::::::::::::::t         C:::::C              o:::::::::::::::on::::::::::::::nn t:::::::::::::::::t   r:::::::::::::::::r o:::::::::::::::o l::::l 
//   R:::::::::::::RR  e::::::e     e:::::es::::::ssss:::::se::::::e     e:::::etttttt:::::::tttttt           H:::::::::::::::::H             a::::a  l::::ltttttt:::::::tttttt         C:::::C              o:::::ooooo:::::onn:::::::::::::::ntttttt:::::::tttttt   rr::::::rrrrr::::::ro:::::ooooo:::::o l::::l 
//   R::::RRRRRR:::::R e:::::::eeeee::::::e s:::::s  ssssss e:::::::eeeee::::::e      t:::::t                 H:::::::::::::::::H      aaaaaaa:::::a  l::::l      t:::::t               C:::::C              o::::o     o::::o  n:::::nnnn:::::n      t:::::t          r:::::r     r:::::ro::::o     o::::o l::::l 
//   R::::R     R:::::Re:::::::::::::::::e    s::::::s      e:::::::::::::::::e       t:::::t                 H::::::HHHHH::::::H    aa::::::::::::a  l::::l      t:::::t               C:::::C              o::::o     o::::o  n::::n    n::::n      t:::::t          r:::::r     rrrrrrro::::o     o::::o l::::l 
//   R::::R     R:::::Re::::::eeeeeeeeeee        s::::::s   e::::::eeeeeeeeeee        t:::::t                 H:::::H     H:::::H   a::::aaaa::::::a  l::::l      t:::::t               C:::::C              o::::o     o::::o  n::::n    n::::n      t:::::t          r:::::r            o::::o     o::::o l::::l 
//   R::::R     R:::::Re:::::::e           ssssss   s:::::s e:::::::e                 t:::::t    tttttt       H:::::H     H:::::H  a::::a    a:::::a  l::::l      t:::::t    tttttt      C:::::C       CCCCCCo::::o     o::::o  n::::n    n::::n      t:::::t    ttttttr:::::r            o::::o     o::::o l::::l 
// RR:::::R     R:::::Re::::::::e          s:::::ssss::::::se::::::::e                t::::::tttt:::::t     HH::::::H     H::::::HHa::::a    a:::::a l::::::l     t::::::tttt:::::t       C:::::CCCCCCCC::::Co:::::ooooo:::::o  n::::n    n::::n      t::::::tttt:::::tr:::::r            o:::::ooooo:::::ol::::::l
// R::::::R     R:::::R e::::::::eeeeeeee  s::::::::::::::s  e::::::::eeeeeeee        tt::::::::::::::t     H:::::::H     H:::::::Ha:::::aaaa::::::a l::::::l     tt::::::::::::::t        CC:::::::::::::::Co:::::::::::::::o  n::::n    n::::n      tt::::::::::::::tr:::::r            o:::::::::::::::ol::::::l
// R::::::R     R:::::R  ee:::::::::::::e   s:::::::::::ss    ee:::::::::::::e          tt:::::::::::tt     H:::::::H     H:::::::H a::::::::::aa:::al::::::l       tt:::::::::::tt          CCC::::::::::::C oo:::::::::::oo   n::::n    n::::n        tt:::::::::::ttr:::::r             oo:::::::::::oo l::::::l
// RRRRRRRR     RRRRRRR    eeeeeeeeeeeeee    sssssssssss        eeeeeeeeeeeeee            ttttttttttt       HHHHHHHHH     HHHHHHHHH  aaaaaaaaaa  aaaallllllll         ttttttttttt               CCCCCCCCCCCCC   ooooooooooo     nnnnnn    nnnnnn          ttttttttttt  rrrrrrr               ooooooooooo   llllllll
 

wire [MAXHART-1:0] hartSelected;


wire dmcontrol_wsel = slv_reg_wren & ( axi_awaddr == 'h10 );






gen_dffren # (.DW(1)) haltreq_dffren ( .dnxt(S_DM_AXI_WDATA [31]), .qout(haltreq), .en(dmcontrol_wsel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
assign hart_haltReq = {MAXHART{haltreq}} & hartSelected;


gen_dffren # (.DW(1)) resumereq_dffren( .dnxt(S_DM_AXI_WDATA[30] & ~S_DM_AXI_WDATA[31]), .qout(resumereq), .en(dmcontrol_wsel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
assign hart_resume = {MAXHART{resumereq}} & hartSelected;

wire hartreset;
gen_dffren # (.DW(1)) hartreset_dffren ( .dnxt(S_DM_AXI_WDATA [29]), .qout(hartreset), .en(dmcontrol_wsel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
assign hart_resetReq = {MAXHART{hartreset}} & hartSelected;


wire [19:0] hartsel;
gen_dffren # (.DW(20)) hartsel_dffren ( .dnxt(S_DM_AXI_WDATA [25:6]), .qout(hartsel), .en(dmcontrol_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
assign hartSelected = {hartsel[9:0], hartsel[19:10]};

wire haltOnResetreq_dnxt = S_DM_AXI_WDATA[2] ? 
											1'b0 :
											( 
												S_DM_AXI_WDATA[3] ? 1'b1 : haltOnResetreq
											);

gen_dffren # (.DW(1)) haltOnResettreq_dffren ( .dnxt(haltOnResetreq_dnxt), .qout(haltOnResetreq), .en(dmcontrol_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
wire hart_haltOnReset = {MAXHART{haltOnResetreq}} & hartSelected;



gen_dffren # (.DW(1)) ndmreset_dffr ( .dnxt(S_DM_AXI_WDATA[1]), .qout(ndmreset), .en(dmcontrol_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
assign ndmresetn = ~ndmreset;


gen_dffren # (.DW(1)) dmactive_dffr ( .dnxt(S_DM_AXI_WDATA[0]), .qout(dmactive), .en(dmcontrol_sel), .CLK(CLK), .RSTn(RSTn));



assign dmcontrol = 
	{
		1'b0, //haltreq(Write Only)
		1'b0, //resumereq(Write 1 Only)
		hartreset_qout,
		1'b0, //ackhavereset (Write 1 Only)
		1'b0, //[27]N/A
		1'b0, //hasel(Multi-hart seleting is not supported)
		hartsel,
		2'b0, //[5:4] N/A
		1'b0, //setresethaltreq (Write 1 Only)
		1'b0, //clrresethaltreq (Write 1 Only)
		ndmreset,
		dmactive
	}



//private reg
wire [MAXHART-1:0] hasReset_dnxt = 
						( hasReset_qout | hart_isInReset ) & ~( {MAXHART{dmcontrol_sel & S_DM_AXI_WDATA[28]}} & hartSelected ) ;
wire [MAXHART-1:0] hasReset_qout;
gen_dffr # (.DW(MAXHART)) hasReset_dffr ( .dnxt(hasReset_dnxt), .qout(hasReset_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

//private reg
wire [MAXHART-1:0] hasResume_dnxt = 
						hasResume_qout  & ( {MAXHART{dmcontrol_sel & S_DM_AXI_WDATA[30]}} & hartSelected );
wire [MAXHART-1:0] hasResume_qout;
gen_dffr # (.DW(MAXHART)) hasResume_dffr ( .dnxt(hasResume_dnxt), .qout(hasResume_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));




wire allhavereset = & (hasReset_qout | (~hartSelected)); 
wire anyhavereset = | (hasReset_qout & hartSelected);
wire allresumeack = & (hasResume_qout | (~hartSelected));
wire anyresumeack = | (hasResume_qout & hartSelected);
wire anynonexistent = hartsel > MAXHART-1;
wire allnonexistent = anynonexistent;
wire allunavail = & ( hart_isInReset | (~hartSelected) );
wire anyunavail = | (  hart_isInReset & hartSelected);
wire allrunning = & ( (~hart_isInReset & ~hart_isInHalt) | (~hartSelected) );
wire anyrunning = | ( ~hart_isInReset & ~hart_isInHalt & hartSelected );
wire allhalted = & ( hart_isInHalt | (~hartSelected) );
wire anyhalted = | ( hart_isInHalt & hartSelected );


assign dmstatus = 
	{ 9'b0,
	1'b0, //impebreak(preset)
	2'b0,
	allhavereset, anyhavereset, allresumeack, anyresumeack, allnonexistent, anynonexistent,
	allunavail, anyunavail, allrunning, anyrunning, allhalted, anyhalted,
	1'b1, //authenticated(preset)
	1'b0, //authbusy
	1'b1, //hasresethaltreq(preset)
	1'b0, //confstrptrvalid(preset)
	4'd2 //version
	};














//                                 bbbbbbbb                                                                                                                                                                                                                                                                          dddddddd                 
//                AAA              b::::::b                                      tttt                                                                         tttt                       CCCCCCCCCCCCC                                                                                                               d::::::d                 
//               A:::A             b::::::b                                   ttt:::t                                                                      ttt:::t                    CCC::::::::::::C                                                                                                               d::::::d                 
//              A:::::A            b::::::b                                   t:::::t                                                                      t:::::t                  CC:::::::::::::::C                                                                                                               d::::::d                 
//             A:::::::A            b:::::b                                   t:::::t                                                                      t:::::t                 C:::::CCCCCCCC::::C                                                                                                               d:::::d                  
//            A:::::::::A           b:::::bbbbbbbbb        ssssssssss   ttttttt:::::ttttttt   rrrrr   rrrrrrrrr   aaaaaaaaaaaaa      ccccccccccccccccttttttt:::::ttttttt          C:::::C       CCCCCC   ooooooooooo      mmmmmmm    mmmmmmm     mmmmmmm    mmmmmmm     aaaaaaaaaaaaa  nnnn  nnnnnnnn        ddddddddd:::::d     ssssssssss   
//           A:::::A:::::A          b::::::::::::::bb    ss::::::::::s  t:::::::::::::::::t   r::::rrr:::::::::r  a::::::::::::a   cc:::::::::::::::ct:::::::::::::::::t         C:::::C               oo:::::::::::oo  mm:::::::m  m:::::::mm mm:::::::m  m:::::::mm   a::::::::::::a n:::nn::::::::nn    dd::::::::::::::d   ss::::::::::s  
//          A:::::A A:::::A         b::::::::::::::::b ss:::::::::::::s t:::::::::::::::::t   r:::::::::::::::::r aaaaaaaaa:::::a c:::::::::::::::::ct:::::::::::::::::t         C:::::C              o:::::::::::::::om::::::::::mm::::::::::m::::::::::mm::::::::::m  aaaaaaaaa:::::an::::::::::::::nn  d::::::::::::::::d ss:::::::::::::s 
//         A:::::A   A:::::A        b:::::bbbbb:::::::bs::::::ssss:::::stttttt:::::::tttttt   rr::::::rrrrr::::::r         a::::ac:::::::cccccc:::::ctttttt:::::::tttttt         C:::::C              o:::::ooooo:::::om::::::::::::::::::::::m::::::::::::::::::::::m           a::::ann:::::::::::::::nd:::::::ddddd:::::d s::::::ssss:::::s
//        A:::::A     A:::::A       b:::::b    b::::::b s:::::s  ssssss       t:::::t          r:::::r     r:::::r  aaaaaaa:::::ac::::::c     ccccccc      t:::::t               C:::::C              o::::o     o::::om:::::mmm::::::mmm:::::m:::::mmm::::::mmm:::::m    aaaaaaa:::::a  n:::::nnnn:::::nd::::::d    d:::::d  s:::::s  ssssss 
//       A:::::AAAAAAAAA:::::A      b:::::b     b:::::b   s::::::s            t:::::t          r:::::r     rrrrrrraa::::::::::::ac:::::c                   t:::::t               C:::::C              o::::o     o::::om::::m   m::::m   m::::m::::m   m::::m   m::::m  aa::::::::::::a  n::::n    n::::nd:::::d     d:::::d    s::::::s      
//      A:::::::::::::::::::::A     b:::::b     b:::::b      s::::::s         t:::::t          r:::::r           a::::aaaa::::::ac:::::c                   t:::::t               C:::::C              o::::o     o::::om::::m   m::::m   m::::m::::m   m::::m   m::::m a::::aaaa::::::a  n::::n    n::::nd:::::d     d:::::d       s::::::s   
//     A:::::AAAAAAAAAAAAA:::::A    b:::::b     b:::::bssssss   s:::::s       t:::::t    ttttttr:::::r          a::::a    a:::::ac::::::c     ccccccc      t:::::t    tttttt      C:::::C       CCCCCCo::::o     o::::om::::m   m::::m   m::::m::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::nd:::::d     d:::::d ssssss   s:::::s 
//    A:::::A             A:::::A   b:::::bbbbbb::::::bs:::::ssss::::::s      t::::::tttt:::::tr:::::r          a::::a    a:::::ac:::::::cccccc:::::c      t::::::tttt:::::t       C:::::CCCCCCCC::::Co:::::ooooo:::::om::::m   m::::m   m::::m::::m   m::::m   m::::ma::::a    a:::::a  n::::n    n::::nd::::::ddddd::::::dds:::::ssss::::::s
//   A:::::A               A:::::A  b::::::::::::::::b s::::::::::::::s       tt::::::::::::::tr:::::r          a:::::aaaa::::::a c:::::::::::::::::c      tt::::::::::::::t        CC:::::::::::::::Co:::::::::::::::om::::m   m::::m   m::::m::::m   m::::m   m::::ma:::::aaaa::::::a  n::::n    n::::n d:::::::::::::::::ds::::::::::::::s 
//  A:::::A                 A:::::A b:::::::::::::::b   s:::::::::::ss          tt:::::::::::ttr:::::r           a::::::::::aa:::a cc:::::::::::::::c        tt:::::::::::tt          CCC::::::::::::C oo:::::::::::oo m::::m   m::::m   m::::m::::m   m::::m   m::::m a::::::::::aa:::a n::::n    n::::n  d:::::::::ddd::::d s:::::::::::ss  
// AAAAAAA                   AAAAAAAbbbbbbbbbbbbbbbb     sssssssssss              ttttttttttt  rrrrrrr            aaaaaaaaaa  aaaa   cccccccccccccccc          ttttttttttt               CCCCCCCCCCCCC   ooooooooooo   mmmmmm   mmmmmm   mmmmmmmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa nnnnnn    nnnnnn   ddddddddd   ddddd  sssssssssss    




wire command_wsel = slv_reg_wren & ( axi_awaddr == 'h17 );
wire [31:0] command = S_DM_AXI_WDATA;



wire [7:0] cmdtype = command[31:24];
wire [2:0] aarsize = command[22:20];
wire aarpostincrement = command[19];
wire postexec = command[18];
wire transfer = command[17];
wire write = command[16];
wire [15:0] regno = command[15:0];

wire isAccessRegister = (cmdtype == 8'd0);

assign accessReg_valid = command_wsel & isAccessRegister & transfer;
assign accessReg_addr = regno;
assign accessReg_wen = write;
assign accessReg_write = {data1_qout, data0_qout};
assign is32w = (command[22:20] == 2);













//wire isCommandNotReady = command_sel & isQuickAccess & anyhalted;

wire isCommandUnsupport = (command_wsel & ~isAccessRegister) | ( command_wsel & isAccessRegister & ( aarpostincrement | postexec ));
wire isCommandException = accessReg_valid & (accessReg_addr > 16'h101f);





wire abstractcs_wsel = slv_reg_wren & ( axi_awaddr == 'h16 );




wire busy = (accessReg_valid);

wire [2:0] cmderr_qout;
wire [2:0] cmderr_dnxt = (abstractcs_wsel & S_DM_AXI_WDATA[10:8] == 3'd1 & ~busy) ? 3'd0 :
						(
							( slv_reg_wren & ( axi_awaddr == 8'h16 | axi_awaddr == 8'h17 ) )
							|
							( (slv_reg_rden | slv_reg_wren) & ( axi_awaddr == 8'h04 | axi_awaddr == 8'h05 | axi_awaddr == 8'h06 | axi_awaddr == 8'h07 | axi_awaddr == 8'h08 | axi_awaddr == 8'h09 ) ) 
								& busy ? 3'd1 :
							(
								command_wsel & isCommandUnsupport ? 3'd2 : 
								(											
									busy & isExpection ? 3'd3 :
									(
										//command_sel & isCommandNotReady ? 3'd4 :
										(
											//busy & isBusErrot ? 3'd5 :
											(
												cmderr_qout
											)
										)
									)
								)
							)
						);
gen_dffr # (.DW(3)) cmderr ( .dnxt(cmderr_dnxt), .qout(cmderr_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));




wire abstractcs = 
	{
		3'b0,
		5'd0, //progbufsize(Preset)
		11'b0,
		busy,
		1'b0,
		cmderr,
		4'b0,
		4'd6 //datacount(Preset)
	}







//    SSSSSSSSSSSSSSS YYYYYYY       YYYYYYY   SSSSSSSSSSSSSSS      BBBBBBBBBBBBBBBBB   UUUUUUUU     UUUUUUUU   SSSSSSSSSSSSSSS                     AAA                  CCCCCCCCCCCCC      CCCCCCCCCCCCCEEEEEEEEEEEEEEEEEEEEEE   SSSSSSSSSSSSSSS   SSSSSSSSSSSSSSS 
//  SS:::::::::::::::SY:::::Y       Y:::::Y SS:::::::::::::::S     B::::::::::::::::B  U::::::U     U::::::U SS:::::::::::::::S                   A:::A              CCC::::::::::::C   CCC::::::::::::CE::::::::::::::::::::E SS:::::::::::::::SSS:::::::::::::::S
// S:::::SSSSSS::::::SY:::::Y       Y:::::YS:::::SSSSSS::::::S     B::::::BBBBBB:::::B U::::::U     U::::::US:::::SSSSSS::::::S                  A:::::A           CC:::::::::::::::C CC:::::::::::::::CE::::::::::::::::::::ES:::::SSSSSS::::::S:::::SSSSSS::::::S
// S:::::S     SSSSSSSY::::::Y     Y::::::YS:::::S     SSSSSSS     BB:::::B     B:::::BUU:::::U     U:::::UUS:::::S     SSSSSSS                 A:::::::A         C:::::CCCCCCCC::::CC:::::CCCCCCCC::::CEE::::::EEEEEEEEE::::ES:::::S     SSSSSSS:::::S     SSSSSSS
// S:::::S            YYY:::::Y   Y:::::YYYS:::::S                   B::::B     B:::::B U:::::U     U:::::U S:::::S                            A:::::::::A       C:::::C       CCCCCC:::::C       CCCCCC  E:::::E       EEEEEES:::::S           S:::::S            
// S:::::S               Y:::::Y Y:::::Y   S:::::S                   B::::B     B:::::B U:::::D     D:::::U S:::::S                           A:::::A:::::A     C:::::C            C:::::C                E:::::E             S:::::S           S:::::S            
//  S::::SSSS             Y:::::Y:::::Y     S::::SSSS                B::::BBBBBB:::::B  U:::::D     D:::::U  S::::SSSS                       A:::::A A:::::A    C:::::C            C:::::C                E::::::EEEEEEEEEE    S::::SSSS         S::::SSSS         
//   SS::::::SSSSS         Y:::::::::Y       SS::::::SSSSS           B:::::::::::::BB   U:::::D     D:::::U   SS::::::SSSSS                 A:::::A   A:::::A   C:::::C            C:::::C                E:::::::::::::::E     SS::::::SSSSS     SS::::::SSSSS    
//     SSS::::::::SS        Y:::::::Y          SSS::::::::SS         B::::BBBBBB:::::B  U:::::D     D:::::U     SSS::::::::SS              A:::::A     A:::::A  C:::::C            C:::::C                E:::::::::::::::E       SSS::::::::SS     SSS::::::::SS  
//        SSSSSS::::S        Y:::::Y              SSSSSS::::S        B::::B     B:::::B U:::::D     D:::::U        SSSSSS::::S            A:::::AAAAAAAAA:::::A C:::::C            C:::::C                E::::::EEEEEEEEEE          SSSSSS::::S       SSSSSS::::S 
//             S:::::S       Y:::::Y                   S:::::S       B::::B     B:::::B U:::::D     D:::::U             S:::::S          A:::::::::::::::::::::AC:::::C            C:::::C                E:::::E                         S:::::S           S:::::S
//             S:::::S       Y:::::Y                   S:::::S       B::::B     B:::::B U::::::U   U::::::U             S:::::S         A:::::AAAAAAAAAAAAA:::::AC:::::C       CCCCCC:::::C       CCCCCC  E:::::E       EEEEEE            S:::::S           S:::::S
// SSSSSSS     S:::::S       Y:::::Y       SSSSSSS     S:::::S     BB:::::BBBBBB::::::B U:::::::UUU:::::::U SSSSSSS     S:::::S        A:::::A             A:::::AC:::::CCCCCCCC::::CC:::::CCCCCCCC::::CEE::::::EEEEEEEE:::::ESSSSSSS     S:::::SSSSSSS     S:::::S
// S::::::SSSSSS:::::S    YYYY:::::YYYY    S::::::SSSSSS:::::S     B:::::::::::::::::B   UU:::::::::::::UU  S::::::SSSSSS:::::S       A:::::A               A:::::ACC:::::::::::::::C CC:::::::::::::::CE::::::::::::::::::::ES::::::SSSSSS:::::S::::::SSSSSS:::::S
// S:::::::::::::::SS     Y:::::::::::Y    S:::::::::::::::SS      B::::::::::::::::B      UU:::::::::UU    S:::::::::::::::SS       A:::::A                 A:::::A CCC::::::::::::C   CCC::::::::::::CE::::::::::::::::::::ES:::::::::::::::SSS:::::::::::::::SS 
 // SSSSSSSSSSSSSSS       YYYYYYYYYYYYY     SSSSSSSSSSSSSSS        BBBBBBBBBBBBBBBBB         UUUUUUUUU       SSSSSSSSSSSSSSS        AAAAAAA                   AAAAAAA   CCCCCCCCCCCCC      CCCCCCCCCCCCCEEEEEEEEEEEEEEEEEEEEEE SSSSSSSSSSSSSSS   SSSSSSSSSSSSSSS   

 	wire sbcs_wsel = slv_reg_wren & ( axi_awaddr == 8'h38);
	wire sbaddress0_wsel = slv_reg_wren & ( axi_awaddr == 8'h39 );
	wire sbdata0_wsel = slv_reg_wren & ( axi_awaddr == 8'h3c );
	wire sbdata0_rsel = slv_reg_rden & ( axi_araddr == 8'h3c );

	wire sbbusyerror_set;
	wire sbbusyerror_rst;
	wire sbbusyerror_qout;

	gen_rsffr # (.DW(1)) sbbusyerror_rsffr ( .set_in(sbbusyerror_set), .rst_in(sbbusyerror_rst), .qout(sbbusyerror_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)) );

	
	assign sbbusyerror_set = sbbusy & 
								(
									( sbaddress0_wsel | sbdata0_wsel )
									|
									( sbdata0_rsel )
								);
	assign sbbusyerror_rst = sbcs_wsel & S_DM_AXI_WDATA[22];



	wire sbbusy_set;
	wire sbbusy_rst;
	wire sbbusy_qout;
	gen_rsffr # (.DW(1)) sbbusy ( .set_in(sbbusy_set), .rst_in(sbbusy_rst), .qout(sbbusy_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)) );
	assign sbbusy_set = (start_single_write | start_single_read) & ~sberror_qout;
	assign sbbusy_rst = write_resp | read_resp;


	wire sbreadonaddr_dnxt = S_DM_AXI_WDATA[20];
	wire sbreadonaddr_qout;
	gen_dffren # (.DW(1)) sbreadonaddr_dffren ( .dnxt(sbreadonaddr_dnxt), .qout(sbreadonaddr_qout), .en(sbcs_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));


	wire [2:0] sbaccess_dnxt = S_DM_AXI_WDATA[19:17];
	wire [2:0] sbaccess_qout;
	gen_dffren # (.DW(3), .rstValue(3'd2)) sbaccess_dffren ( .dnxt(sbaccess_dnxt), .qout(sbaccess_qout), .en(sbcs_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));


	wire sbautoincrement_dnxt = S_DM_AXI_WDATA[16];
	wire sbautoincrement_qout;
	gen_dffren # (.DW(1)) sbautoincrement_dffren ( .dnxt(sbautoincrement_dnxt), .qout(sbautoincrement_qout), .en(sbcs_sel), .CLK(CLK), .RSTn(RSTn & (~dmactive)));


	wire sbreadondate_dnxt = S_DM_AXI_WDATA[15];
	wire sbreadondate_qout;
	gen_dffren # (.DW(1)) sbreadondate_dffren ( .dnxt(sbreadondate_dnxt), .qout(sbreadondate_qout), .CLK(CLK), .en(sbcs_sel), .RSTn(RSTn & (~dmactive)));


	wire [2:0] sberror_set;
	wire [2:0] sberror_rst;
	wire [2:0] sberror_qout;
	gen_rsffr # (.DW(3)) sberror_rsffr ( .set_in(sberror_set), .rst_in(sberror_rst), .qout(sberror_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)) );
	assign sberror_set = {3{sbcs_sel}} &
							(
								{3{( start_single_write_dnxt | start_single_read_dnxt) & sbaccess_qout != 3'd3}} & 3'd4
							)
	assign sberror_rst = {3{sbcs_sel}} & S_DM_AXI_WDATA[14:12];


	wire [31:0] sbcs = 
					{
						1'b1, //sbversion
						sbbusyerror_qout,
						sbbusy,
						sbreadonaddr_qout,
						sbaccess_qout,
						sbautoincrement_qout,
						sbreadondate_qout,
						sberror_qout,
						8'd64, //sbasize(Preset)
						1'b0, //sbaccess128(Preset)
						1'b1, //sbaccess64(Preset)
						1'b0, //sbaccess32(Preset)
						1'b0, //sbaccess16(Preset)
						1'b0, //sbaccess8(Preset)
					}

















	wire sbaddress0_dnxt;
	wire sbaddress0_qout;
	wire sbaddress1_dnxt;
	wire sbaddress1_qout;
	wire sbaddress_dnxt;
	wire sbaddress_qout;
	gen_dffr # (.DW(64)) sbaddress_dffr ( .dnxt(sbaddress_dnxt), .qout(sbaddress_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

	assign sbaddress_dnxt = () & { sbaddress1_dnxt, sbaddress0_dnxt}
							|
							{64{(write_resp_success | read_resp_success) & abstractauto_qout}} & ( sbaddress_qout + 64'b1000);

	assign {sbaddress1_qout, sbaddress0_qout} = sbaddress_qout;


	wire sbdata0_dnxt;
	wire sbdata0_qout;
	wire sbdata1_dnxt;
	wire sbdata1_qout;
	wire sbdata_dnxt;
	wire sbdata_qout;


	gen_dffr # (.DW(64)) sbdata_dffr ( .dnxt(sbdata_dnxt), .qout(sbdata_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));

	assign sbdata_dnxt = { sbdata_dnxt, sbdata_dnxt };
	assign {sbdata1_qout, sbdata0_qout} = sbdata_qout;





	wire start_single_write_dnxt;
	wire start_single_read_dnxt;
	wire start_single_write_qout;
	wire start_single_read_qout;
	gen_dffr # (.DW(1)) start_single_write_dffr ( .dnxt(start_single_write_dnxt), .qout(start_single_write_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
	gen_dffr # (.DW(1)) start_single_read_dffr ( .dnxt(start_single_read_dnxt), .qout(start_single_read_qout), .CLK(CLK), .RSTn(RSTn & (~dmactive)));
	assign start_single_write_dnxt = ~sbbusyerror & sbdata0_sel;
	assign start_single_read_dnxt = ( ~sbbusyerror & sbreadonaddr_qout & sbaddress0_sel) 
									| 
									( ~sbbusyerror & sbreadondate_qout & slv_reg_rden & axi_araddr == 8'h3c ) ;


	wire write_resp;
	wire write_resp_error;
	wire write_resp_success;
	wire read_resp;
	wire read_resp_error;
	wire read_resp_success;

	assign M_SYSBUS_AXI_AWADDR = sbaddress_qout;
	assign M_SYSBUS_AXI_ARADDR = sbaddress_qout;
	assign M_SYSBUS_AXI_WDATA = sbdata_qout;

 


	assign M_SYSBUS_AXI_AWPROT	= 3'b000;
	assign M_SYSBUS_AXI_WSTRB	= 4'b1111;
	assign M_SYSBUS_AXI_ARPROT	= 3'b001;


	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive ) begin
			M_SYSBUS_AXI_AWVALID <= 1'b0;
		end
		else begin
			if (start_single_write & ~sberror_qout) begin
				M_SYSBUS_AXI_AWVALID <= 1'b1;
			end
			else if (M_AXI_AWREADY && M_SYSBUS_AXI_AWVALID) begin
				M_SYSBUS_AXI_AWVALID <= 1'b0;
			end
		end
	end


	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			 M_SYSBUS_AXI_WVALID <= 1'b0;
		end
		else if (start_single_write & ~sberror_qout) begin
			M_SYSBUS_AXI_WVALID <= 1'b1;
		end
		else if (M_AXI_WREADY && M_SYSBUS_AXI_WVALID) begin
			M_SYSBUS_AXI_WVALID <= 1'b0;
		end
	end

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			M_SYSBUS_AXI_BREADY <= 1'b0;
		end
		else if (M_AXI_BVALID && ~M_SYSBUS_AXI_BREADY) begin
			M_SYSBUS_AXI_BREADY <= 1'b1;
		end
		else if (M_SYSBUS_AXI_BREADY) begin
			M_SYSBUS_AXI_BREADY <= 1'b0;
		end
		else
		  M_SYSBUS_AXI_BREADY <= M_SYSBUS_AXI_BREADY;
	end

	assign write_resp = M_SYSBUS_AXI_BREADY & M_AXI_BVALID;
	assign write_resp_error = (write_resp & M_AXI_BRESP[1]);
	assign write_resp_success = (write_resp & ~M_AXI_BRESP[1]);

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			M_SYSBUS_AXI_ARVALID <= 1'b0;
		end
		else if (start_single_read & ~sberror_qout) begin
			M_SYSBUS_AXI_ARVALID <= 1'b1;
		end
		else if (M_AXI_ARREADY && M_SYSBUS_AXI_ARVALID) begin
			M_SYSBUS_AXI_ARVALID <= 1'b0;
		end
	end

	always @(posedge CLK or negedge RSTn) begin
		if ( ~RSTn | ~dmactive) begin
			M_SYSBUS_AXI_RREADY <= 1'b0;
		end
		else if (M_AXI_RVALID && ~M_SYSBUS_AXI_RREADY) begin
			M_SYSBUS_AXI_RREADY <= 1'b1;
		end
		else if (M_SYSBUS_AXI_RREADY) begin
			M_SYSBUS_AXI_RREADY <= 1'b0;
		end
	end

	assign read_resp = M_SYSBUS_AXI_RREADY & M_AXI_RVALID;
	assign read_resp_error = read_resp & M_AXI_RRESP[1];
	assign read_resp_success = read_resp & ~M_AXI_RRESP[1];











endmodule

