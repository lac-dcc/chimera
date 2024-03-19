`timescale 1ns/1ns
module ddr2_interface2um(
fpga_resetn,					//system 	reset,active low
sysclk_100m,					//system 	clk=100MHz LVCOMS
ddr2_ck,									//DDR2	System Clock Pos
ddr2_ck_n,								//DDR2	System Clock Neg
//Address
ddr2_addr,  							//only addresses (12:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
ddr2_bank_addr,   				//only addresses (1:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
ddr2_ras_n,								//Row address select		
ddr2_cas_n,								//Column address select
ddr2_we_n,								//Write enable  
//command and control
ddr2_cs_n,								//Chip Select
ddr2_cke,									//Clock Enable
ddr2_odt,									//On-die termination enable
//Data Bus
ddr2_dq,									//Data
ddr2_dqs,									//Strobe Pos
ddr2_dqs_n,								//Strobe Neg
ddr2_dm,									//Byte write mask

um2ddr_wrclk,
um2ddr_wrreq,
um2ddr_data,
um2ddr_ready,
um2ddr_command_wrreq,
um2ddr_command,

ddr2um_rdclk,
ddr2um_rdreq,
ddr2um_rdata,
ddr2um_valid_rdreq,
ddr2um_valid_rdata,
ddr2um_valid_empty
);
input 				sysclk_100m;					//system 	clk=100MHz LVCOMS
input					fpga_resetn;			//system 	reset,active low
//////ddr2 interface/////////////////
inout					ddr2_ck;									//DDR2	System Clock Pos
inout					ddr2_ck_n;								//DDR2	System Clock Neg
//Address
output 	    [15:0]      ddr2_addr;  							//only addresses (12:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
output 	    [2:0]	    ddr2_bank_addr; 
  				//only addresses (1:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
output					ddr2_ras_n;								//Row address select		
output					ddr2_cas_n;								//Column address select
output					ddr2_we_n;								//Write enable  
//command and control
output					ddr2_cs_n;								//Chip Select
output					ddr2_cke;									//Clock Enable
output					ddr2_odt;									//On-die termination enable
//Data Bus
inout		[15:0]	    ddr2_dq;									//Data
inout		[1:0]		ddr2_dqs;									//Strobe Pos
inout		[1:0]		ddr2_dqs_n;								//Strobe Neg
inout		[1:0]		ddr2_dm;									//Byte write mask

///um interface //////////////
input          um2ddr_wrclk;
input          um2ddr_wrreq;
input	[127:0]  um2ddr_data; 
output         um2ddr_ready;
input          um2ddr_command_wrreq;
input	[33:0]   um2ddr_command;

input          ddr2um_rdclk;
input          ddr2um_rdreq;
output[127:0]  ddr2um_rdata;
input          ddr2um_valid_rdreq;
output[6:0]    ddr2um_valid_rdata;
output         ddr2um_valid_empty;

	wire		      local_ready;
	wire	[31:0]	local_rdata;
	wire		      local_rdata_valid;
	wire		      local_init_done;
	
	
	wire[23:0]	local_address;
	wire		   local_write_req;
	wire		   local_read_req;
	wire		   local_burstbegin;
	wire[31:0]	local_wdata;
	wire[3:0]  local_be;
	wire[3:0]	local_size;
	wire phy_clk;
assign ddr2_addr[15:13] = 3'b0;
assign ddr2_bank_addr[2] = 1'b0;
ddr2 ddr2_ctrl_hp_inst
(
	.pll_ref_clk(sysclk_100m) ,					// input  pll_ref_clk_sig
	.global_reset_n(fpga_resetn) ,					// input  global_reset_n_sig
	.soft_reset_n(fpga_resetn) ,						// input  soft_reset_n_sig
	.local_address(local_address) ,			// input [25:0] local_address_sig   //by cyj
	.local_write_req(local_write_req) ,				// input  local_write_req_sig
	.local_wdata_req() ,			// output  local_wdata_req_sig
	.local_wdata(local_wdata) ,	// input [127:0] Write data in fourth
	.local_read_req(local_read_req) ,					// input  local_read_req_sig
	.local_be(local_be) ,	// input [15:0] local_be_sig
	.local_size(local_size) ,				// input [1:0] local_size_sig     //only 1bits
	.local_ready(local_ready) ,					// output  local_ready_sig
	.local_rdata(local_rdata) ,					// output [127:0] local_rdata_sig  output 256bits data by cyj
	.local_rdata_valid(local_rdata_valid) ,		// output  local_rdata_valid_sig
	.local_init_done(local_init_done) ,		// output  local_init_done_sig -- Not used
	.local_burstbegin(local_burstbegin),
	.reset_request_n() ,		// output  reset_request_n_sig -- Not used
	.mem_odt(ddr2_odt) ,							// output [0:0] mem_odt_sig
	.mem_cs_n(ddr2_cs_n) ,						// output [0:0] mem_cs_n_sig
	.mem_cke(ddr2_cke) ,							// output [0:0] mem_cke_sig
	.mem_addr(ddr2_addr[12:0]) ,						// output [13:0] mem_addr_sig
	.mem_ba(ddr2_bank_addr[1:0]) ,							// output [1:0] mem_ba_sig   //by cyj 3 signals
	.mem_ras_n(ddr2_ras_n) ,						// output  mem_ras_n_sig
	.mem_cas_n(ddr2_cas_n) ,						// output  mem_cas_n_sig
	.mem_we_n(ddr2_we_n) ,						// output  mem_we_n_sig
	.mem_dm(ddr2_dm) ,							// output [7:0] mem_dm_sig
	.local_refresh_ack() ,	// output  local_refresh_ack_sig -- Not used
	.reset_phy_clk_n() ,		// output  reset_phy_clk_n_sig -- Not used
	.dll_reference_clk() ,	// output  dll_reference_clk_sig -- Not used
	.dqs_delay_ctrl_export() ,	// output [5:0] dqs_delay_ctrl_export_sig -- Not used
	.local_powerdn_ack(),    //by cyj 
	.phy_clk(phy_clk) ,						// output  phy_clk_sig
	.aux_full_rate_clk() ,	// output  aux_full_rate_clk_sig -- Not used
	.aux_half_rate_clk() ,	// output  aux_half_rate_clk_sig -- Not used
	.mem_clk(ddr2_ck) ,							// inout [1:0] mem_clk_sig   
	.mem_clk_n(ddr2_ck_n) ,						// inout [1:0] mem_clk_n_sig
	.mem_dq(ddr2_dq) ,							// inout [63:0] mem_dq_sig
	.mem_dqs(ddr2_dqs), 							// inout [7:0] mem_dqs_sig
	.mem_dqsn(ddr2_dqs_n)                    //by cyj
);

ddr2_ctrl ddr2_ctrl(
.sys_rst_n(fpga_resetn),

.ddr2_clk(phy_clk),
.local_init_done(local_init_done),
.local_ready(local_ready),
.local_address(local_address),
.local_read_req(local_read_req),
.local_write_req(local_write_req),
.local_wdata(local_wdata),
.local_be(local_be),
.local_size(local_size),
.local_rdata(local_rdata),
.local_rdata_valid(local_rdata_valid),
.local_burstbegin(local_burstbegin),

.um2ddr_wrclk(um2ddr_wrclk),
.um2ddr_wrreq(um2ddr_wrreq),
.um2ddr_data(um2ddr_data),
.um2ddr_ready(um2ddr_ready),
.um2ddr_command_wrreq(um2ddr_command_wrreq),
.um2ddr_command(um2ddr_command),

.ddr2um_rdclk(ddr2um_rdclk),
.ddr2um_rdreq(ddr2um_rdreq),
.ddr2um_rdata(ddr2um_rdata),
.ddr2um_valid_rdreq(ddr2um_valid_rdreq),
.ddr2um_valid_rdata(ddr2um_valid_rdata),
.ddr2um_valid_empty(ddr2um_valid_empty)
);
endmodule 