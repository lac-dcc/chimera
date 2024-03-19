//UM which is the only module users may redefined;
//packets are forward between port2 and port3 in passthrough mode;
//NMAC packets are input from port1;
//includes 4 interfaces: CDP input, CDP output, Localbus, DDR2;
//DDR2 interface is test via localbus interface use indirect address and data registers;
module NETMAGIC08(
//system signals
		sysclk_125m,					//system 	clk=125MHz LVCOMS
		sysclk_100m,					//system 	clk=100MHz LVCOMS
		vsc8224_clkout_125m,	      //vsc8224 clkoutmac
		fpga_resetn,					//system 	reset,active low

//four RGMII inteface (From 0-3)
		vsc8224_rstn,					//reset vsc8224 PHY
		vsc_smi_mdc,					//Managment bus clock
		vsc_smi_mdio,					//Managment bus data
		rgm0_rx_clk,rgm0_rx_ctl,rgm0_rx_data,rgm0_tx_clk,rgm0_tx_ctl,rgm0_tx_data,//interface 0
		rgm1_rx_clk,rgm1_rx_ctl,rgm1_rx_data,rgm1_tx_clk,rgm1_tx_ctl,rgm1_tx_data,//interface 1
		rgm2_rx_clk,rgm2_rx_ctl,rgm2_rx_data,rgm2_tx_clk,rgm2_tx_ctl,rgm2_tx_data,//interface 2
		rgm3_rx_clk,rgm3_rx_ctl,rgm3_rx_data,rgm3_tx_clk,rgm3_tx_ctl,rgm3_tx_data,//interface 3
/*
//inteface with 512Mb(32Mb*16) DDR2 SDRAM
		ddr2_ck,							//DDR2	System Clock Pos
		ddr2_ck_n,						//DDR2	System Clock Neg
//address
		ddr2_addr,  					//only addresses (12:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
		ddr2_bank_addr,   			//only addresses (1:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
		ddr2_ras_n,						//Row address select		
		ddr2_cas_n,						//Column address select
		ddr2_we_n,						//Write enable  
//command and control
		ddr2_cs_n,						//Chip Select
		ddr2_cke,						//Clock Enable
		ddr2_odt,						//On-die termination enable
//data Bus
		ddr2_dq,							//Data
		ddr2_dqs,						//Strobe Pos
		ddr2_dqs_n,						//Strobe Neg
		ddr2_dm,							//Byte write mask
*/
//Four SFP inteface (From 0-3)
		sfp_clk0,						//clk=125MHz Diff
		//sfp_clk1,						//clk=125MHz Diff
		sfp0_rxd,sfp0_txd,			//sfp interface 0
		sfp1_rxd,sfp1_txd,			//sfp interface 1
		sfp2_rxd,sfp2_txd,			//sfp interface 2	
		sfp3_rxd,sfp3_txd,			//sfp interface 2

//4*SFP Link & Active LED(under the SFP Cage outer light pipe)
		l_link_sfp0,r_act_sfp0,
		l_link_sfp1,r_act_sfp1,
		l_link_sfp2,r_act_sfp2,
		l_link_sfp3,r_act_sfp3,
//4*SFP Control Signals
//interface 0
		sfp_fault0, 					//Logic 0 ="Normal" ;Logic 1="Fault"
		sfp_los0, 						//Logic 0 ="Normal" ;Logic 1=" loss of signal"
		sfp_present0,					//Low ="the module is present "
		sfp_dis0,						//Low ="Transmitter on"
		sfp_scl0,						//I2C Clock
		sfp_sda0,						//I2C Data
//interface 1
		sfp_fault1, 					//Logic 0 ="Normal" ;Logic 1="Fault"
		sfp_los1, 						//Logic 0 ="Normal" ;Logic 1=" loss of signal"
		sfp_present1,					//Low ="the module is present "
		sfp_dis1,						//Low ="Transmitter on"
		sfp_scl1,						//I2C Clock
		sfp_sda1,						//I2C Data
//interface 2
		sfp_fault2, 					//Logic 0 ="Normal" ;Logic 1="Fault"
		sfp_los2, 						//Logic 0 ="Normal" ;Logic 1=" loss of signal"
		sfp_present2,					//Low ="the module is present "
		sfp_dis2,						//Low ="Transmitter on"
		sfp_scl2,						//I2C Clock
		sfp_sda2,						//I2C Data
//interface 3
		sfp_fault3, 					//Logic 0 ="Normal" ;Logic 1="Fault"
		sfp_los3, 						//Logic 0 ="Normal" ;Logic 1=" loss of signal"
		sfp_present3,					//Low ="the module is present "
		sfp_dis3,						//Low ="Transmitter on"
		sfp_scl3,						//I2C Clock
		sfp_sda3,						//I2C Data

//Misc signals
		l_debug,
		l_user_led						//user define LED

);
//system signals
input					sysclk_125m;				//system 	clk=125MHz LVCOMS
input 				sysclk_100m;				//system 	clk=100MHz LVCOMS
input					vsc8224_clkout_125m;		//vsc8224 clkoutmac
input					fpga_resetn;				//system 	reset,active low

//Four RGMII inteface (From 0-3)
output				vsc8224_rstn;				//reset vsc8224 PHY
output				vsc_smi_mdc;				//Managment bus clock
inout					vsc_smi_mdio;				//Managment bus data
//interface 0
input					rgm0_rx_clk;
input					rgm0_rx_ctl;
input		[3:0]		rgm0_rx_data;
output				rgm0_tx_clk;
output				rgm0_tx_ctl;
output	[3:0]		rgm0_tx_data;
//interface 1
input					rgm1_rx_clk;
input					rgm1_rx_ctl;
input		[3:0]		rgm1_rx_data;
output				rgm1_tx_clk;
output				rgm1_tx_ctl;
output	[3:0]		rgm1_tx_data;
//interface 2
input					rgm2_rx_clk;
input					rgm2_rx_ctl;
input		[3:0]		rgm2_rx_data;
output				rgm2_tx_clk;
output				rgm2_tx_ctl;
output	[3:0]		rgm2_tx_data;
//interface 3
input					rgm3_rx_clk;
input					rgm3_rx_ctl;
input		[3:0]		rgm3_rx_data;
output				rgm3_tx_clk;
output				rgm3_tx_ctl;
output [3:0]		rgm3_tx_data;
/*
//inteface with 512Mb(32Mb*16) DDR2 SDRAM
//clk
inout					ddr2_ck;					//DDR2	System Clock Pos
inout					ddr2_ck_n;				//DDR2	System Clock Neg
//Address
output	[15:0]   ddr2_addr;  			//only addresses (12:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
output 	[2:0]	   ddr2_bank_addr; 		//only addresses (1:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
output				ddr2_ras_n;				//Row address select		
output				ddr2_cas_n;				//Column address select
output				ddr2_we_n;				//Write enable  
//command and control
output				ddr2_cs_n;				//Chip Select
output				ddr2_cke;				//Clock Enable
output				ddr2_odt;				//On-die termination enable
//Data Bus
inout		[15:0]	ddr2_dq;					//Data
inout		[1:0]		ddr2_dqs;				//Strobe Pos
inout		[1:0]		ddr2_dqs_n;				//Strobe Neg
inout		[1:0]		ddr2_dm;					//Byte write mask
*/
//Four SFP inteface (From 0-3)
input					sfp_clk0;				//clk=125MHz Diff
//input				sfp_clk1;				//clk=125MHz Diff
//interface 0
input					sfp0_rxd;
output				sfp0_txd;
//interface 1
input					sfp1_rxd;
output				sfp1_txd;
//interface 2
input					sfp2_rxd;
output				sfp2_txd;
//interface 3
input					sfp3_rxd;
output				sfp3_txd;

//4*SFP Link & Active LED(under the SFP Cage outer light pipe)
output				l_link_sfp0;
output				r_act_sfp0;
output				l_link_sfp1;
output				r_act_sfp1;
output				l_link_sfp2;
output				r_act_sfp2;
output				l_link_sfp3;
output				r_act_sfp3;
//4*SFP Control Signals
//interface 0
input					sfp_fault0; 		//Logic 0 ="Normal" ;Logic 1="Fault"
input					sfp_los0; 			//Logic 0 ="Normal" ;Logic 1=" loss of signal"
input					sfp_present0;		//Low ="the module is present "
output				sfp_dis0;			//Low ="Transmitter on"
output				sfp_scl0;			//I2C Clock
inout					sfp_sda0;			//I2C Data
//interface 1
input					sfp_fault1; 		//Logic 0 ="Normal" ;Logic 1="Fault"
input					sfp_los1; 			//Logic 0 ="Normal" ;Logic 1=" loss of signal"
input					sfp_present1;		//Low ="the module is present "
output				sfp_dis1;			//Low ="Transmitter on"
output				sfp_scl1;			//I2C Clock
inout					sfp_sda1;			//I2C Data
//interface 2
input					sfp_fault2; 		//Logic 0 ="Normal" ;Logic 1="Fault"
input					sfp_los2; 			//Logic 0 ="Normal" ;Logic 1=" loss of signal"
input					sfp_present2;		//Low ="the module is present "
output				sfp_dis2;			//Low ="Transmitter on"
output				sfp_scl2;			//I2C Clock
inout					sfp_sda2;			//I2C Data
//interface 3
input					sfp_fault3; 		//Logic 0 ="Normal" ;Logic 1="Fault"
input					sfp_los3; 			//Logic 0 ="Normal" ;Logic 1=" loss of signal"
input					sfp_present3;		//Low ="the module is present "
output				sfp_dis3;			//Low ="Transmitter on"
output				sfp_scl3;			//I2C Clock
inout					sfp_sda3;			//I2C Data

//Misc signals
output    [7:0]      l_debug;
output					l_user_led;		//user define LED


//assign 	vsc_smi_mdc =1'b0;
//assign	vsc_smi_mdio =1'b0;
assign 	sfp_scl0 =1'b0;
assign 	sfp_scl1 =1'b0;
assign	sfp_scl2 =1'b0;
assign 	sfp_scl3 =1'b0;
assign 	sfp_dis0 =1'b0;
assign 	sfp_dis1 =1'b0;
assign	sfp_dis2 =1'b0;
assign 	sfp_dis3 =1'b0;
assign 	sfp_sda0 =1'b0;
assign 	sfp_sda1 =1'b0;
assign 	sfp_sda2 =1'b0;
assign 	sfp_sda3 =1'b0;

assign 	l_user_led = 1'b0;
assign 	l_debug = 8'b0;
assign 	vsc8224_rstn = sys_rstn;  
wire 					vsc8224_rstn;
reg 					sys_rstn;
reg 		[28:0] 	time_4s;
always@(posedge clk_125m_core or negedge fpga_resetn)
   if(!fpga_resetn)
		begin
			time_4s <= 29'b0;
			sys_rstn <=1'b0;
		end
	else if(time_4s[28] == 1'b1)
			sys_rstn <=1'b1;
	else
		begin
			sys_rstn <=1'b0;
			time_4s <=time_4s +1'b1;
		end


//User module, users can define their own functions here;
um UM(
		.clk(clk_125m_core),
		.reset(sys_rstn),
		
//////////////cdp define register to UM////add by bhf 2014.5.26
      //.FPGA_MAC(FPGA_MAC),
/////////////top_mido port state,1:up,0:down//add by lxj
      //.link_state(link_state),

//////////////localbus control/////////////////////////////////////                                 
      .localbus_cs_n(cs_n),
      .localbus_rd_wr(rd_wr),
      .localbus_data(data),
      .localbus_ale(ale), 
      .localbus_ack_n(ack_n_um),  
      .localbus_data_out(rdata_um),						  

////////////// CDP input control //////////////////////////////////
		.um2cdp_path(um2cdp_path),					//if um2cdp_path=0, packets are routed to UM, else id um2cdp_path=1, packets are routed to CDP.
      .cdp2um_data_valid(cdp2um_data_valid),
      .cdp2um_data(cdp2um_data),
      .um2cdp_tx_enable(um2cdp_tx_enable),	//change the name by mxl and ccz according to UM2.0;
 
////////////// CDP output control /////////////////////////////////  
      .um2cdp_data_valid(um2cdp_data_valid),
      .um2cdp_data(um2cdp_data),
      .cdp2um_tx_enable(cdp2um_tx_enable),	//change the name by mxl and ccz according to UM2.0;
		.um2cdp_rule(um2cdp_rule),
		.um2cdp_rule_wrreq(um2cdp_rule_wrreq),
		.cdp2um_rule_usedw(cdp2um_rule_usedw)
/*
////////////// UM_DDR2 control ////////////////////////////////////
		.um2ddr_wrclk(um2ddr_wrclk),
		.um2ddr_wrreq(um2ddr_wrreq), 
		.um2ddr_wdata(um2ddr_wdata), 
		.ddr2um_ready(ddr2um_ready),
		.um2ddr_command_wrreq(um2ddr_command_wrreq), 
		.um2ddr_command(um2ddr_command),
		.um2ddr_rdclk(um2ddr_rdclk),
		.um2ddr_rdreq(um2ddr_rdreq), 			
		.ddr2um_rdata(ddr2um_rdata),
		.um2ddr_valid_rdreq(um2ddr_valid_rdreq), 
		.ddr2um_valid_rdata(ddr2um_valid_rdata), 
		.ddr2um_valid_empty(ddr2um_valid_empty)*/
		);

		
wire  			cdp2um_tx_enable;
wire  			cdp2um_data_valid;
wire  [138:0]	cdp2um_data;
wire 				input2output_wrreq;
wire 	[138:0]	input2output_data;
wire 	[7:0]		input2output_usedw;
wire				um2cdp_rule_wrreq;
wire 	[4:0]		cdp2um_rule_usedw;
wire 				um2cdp_data_valid;
wire 	[138:0]	um2cdp_data;
wire 				um2cdp_tx_enable;
wire				um2cdp_path;
wire	[29:0] 	um2cdp_rule;

//CDP input control module;
input_ctrl input_ctrl(
		.clk(clk_125m_core),
		.reset(sys_rstn),
    
		.crc_check_wrreq(crc_check_wrreq),				//data fifo;
		.crc_check_data(crc_check_data),
		.crc_usedw(crc_check_usedw),
		.crc_result_wrreq(crc_result_wrreq),			//crc check fifo;
		.crc_result(crc_result),
    
		.um2cdp_tx_enable(um2cdp_tx_enable),			
		.cdp2um_data_valid(cdp2um_data_valid),			//to user module;
		.cdp2um_data(cdp2um_data),
    
		.input2output_wrreq(input2output_wrreq),		//to output control module;
		.input2output_data(input2output_data),
		.input2output_usedw(input2output_usedw),
		.um2cdp_path(um2cdp_path)
		);
  
  
wire 				pkt_valid_wrreq;
wire [18:0] 	pkt_valid;
wire 				pkt_data_wrreq;
wire [138:0]	pkt_data;
wire [7:0]		pkt_data_usedw;

//CDP output control module;
output_ctrl output_ctrl(
		.clk(clk_125m_core),
		.reset(sys_rstn),
     
		.input2output_wrreq(input2output_wrreq),	//pass through, don't use this signal,
		.input2output_data(input2output_data),
		.input2output_usedw(input2output_usedw),
    
		.cdp2um_tx_enable(cdp2um_tx_enable),		//from CDP output_ctrl;
		.um2cdp_data_valid(um2cdp_data_valid),		//data ()from user module to CDP output_ctrl;
		.um2cdp_data(um2cdp_data),
     
		.pkt_valid_wrreq(pkt_valid_wrreq),			//flag fifo(),to crc gen;
		.pkt_valid(pkt_valid),							//[18:0](),[18:17]:	10-valid pkt and normal forward(depend on data[131:128]);
																//							11-valid pkt and copy;
																//							0x-invalid pkt and discard;
																//[16:0]:if this pkt need copy([18:17]=2'b11)(),every bit is one rgmii output interface;
		.pkt_data_wrreq(pkt_data_wrreq),				//data fifo;
		.pkt_data(pkt_data),
		.pkt_data_usedw(pkt_data_usedw),
	  
		.um2cdp_rule(um2cdp_rule),						//rule fifo in cdp output control;
		.um2cdp_rule_wrreq(um2cdp_rule_wrreq),
		.cdp2um_rule_usedw(cdp2um_rule_usedw)
		);  
	 
/*
wire           um2ddr_wrclk;
wire           um2ddr_wrreq;
wire 	[127:0]  um2ddr_wdata; 
wire           ddr2um_ready;
wire           um2ddr_command_wrreq;
wire 	[33:0]   um2ddr_command;
wire           um2ddr_rdclk;
wire           um2ddr_rdreq;
wire [127:0]  	ddr2um_rdata;
wire           um2ddr_valid_rdreq;
wire [6:0]    	ddr2um_valid_rdata;
wire          	ddr2um_valid_empty;	  
	  		
//ddr2 interface;
ddr2_interface2um ddr2_interface2um(
		.fpga_resetn(sys_rstn),					
		.sysclk_100m(sysclk_100m),							//system 	clk=100MHz LVCOMS
		.ddr2_ck(ddr2_ck),									//DDR2	System Clock Pos
		.ddr2_ck_n(ddr2_ck_n),								//DDR2	System Clock Neg
		.ddr2_addr(ddr2_addr),  							//only addresses (12:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
		.ddr2_bank_addr(ddr2_bank_addr),   				//only addresses (1:0) are currently used for 512Mb(32Mb*16) DDR2 SDRAM
		.ddr2_ras_n(ddr2_ras_n),							//Row address select		
		.ddr2_cas_n(ddr2_cas_n),							//Column address select
		.ddr2_we_n(ddr2_we_n),								//Write enable  
		.ddr2_cs_n(ddr2_cs_n),								//Chip Select
		.ddr2_cke(ddr2_cke),									//Clock Enable
		.ddr2_odt(ddr2_odt),									//On-die termination enable
		.ddr2_dq(ddr2_dq),									//Data
		.ddr2_dqs(ddr2_dqs),									//Strobe Pos
		.ddr2_dqs_n(ddr2_dqs_n),							//Strobe Neg
		.ddr2_dm(ddr2_dm),									//Byte write mask
		.um2ddr_wrclk(um2ddr_wrclk),						//ddr2 signal definition rule:
		.um2ddr_wrreq(um2ddr_wrreq),								//um2ddr_*: um output to ddr2 IP core;
		.um2ddr_data(um2ddr_wdata),								//ddr2um_*: ddr2 IP core output to um;
		.um2ddr_ready(ddr2um_ready),
		.um2ddr_command_wrreq(um2ddr_command_wrreq),
		.um2ddr_command(um2ddr_command),
		.ddr2um_rdclk(um2ddr_rdclk),
		.ddr2um_rdreq(um2ddr_rdreq),
		.ddr2um_rdata(ddr2um_rdata),
		.ddr2um_valid_rdreq(um2ddr_valid_rdreq),
		.ddr2um_valid_rdata(ddr2um_valid_rdata),
		.ddr2um_valid_empty(ddr2um_valid_empty)
		);
*/
	  
wire 				ale;
wire 				cs_n;
wire [31:0]		data;
wire 				rd_wr;
wire 				ack_n_um;
wire [31:0]		rdata_um;
wire 				nmac_crc_data_valid;
wire 				nmac_pkt_valid_wrreq;
wire 				nmac_pkt_valid;
wire [138:0]	nmac_crc_data;
wire [7:0] 		nmac_pkt_usedw;
wire 				mix_crc_gen_to_txfifo_wrreq;
wire [138:0]	mix_crc_gen_to_txfifo_data;
wire [7:0]		mix_txfifo_data_usedw;
wire 				mix_pkt_output_valid_wrreq;
wire 				mix_pkt_output_valid;

wire 				mix_crc_data_valid0, mix0_crc_data_valid;
wire 				mix_pkt_valid_wrreq0, mix0_pkt_valid_wrreq;
wire 				mix_pkt_valid0, mix0_pkt_valid;
wire 	[138:0]	mix_crc_data0, mix0_crc_data;
wire 	[7:0] 	mix_pkt_usedw0, mix0_pkt_usedw;

//////////////netmagic_ctrl////////////////////////////
NET_MAGIC_CTRL NET_MAGIC_CTRL(
       .clk(clk_125m_core), 
       .reset_n(sys_rstn),                 	//active low

/////// local bus interface start///////
       .ale(ale),                     			//Address Latch Enable.active high output
       .cs_n(cs_n),                    		//local bus chip select ,active low.
       .data(data),                    		//32-bit bidirectional multiplexed write data and address bus output
       .rd_wr(rd_wr),
       .ack_n_um(ack_n_um),                	//local bus ack.active low. input
       .ack_n_cdp(ack_n_cdp),               	//local bus ack.active low. input
       .ack_n_sram(1'b1),             			//local bus ack.active low. input
       
       .rdata_um(rdata_um),                	//local bus read data from um
       .rdata_cdp(data_out_cdp),              //local bus read data from cdp
       .rdata_sram(),              				//local bus read data from sram
       
////normal packets from tx_gen bp0//////// 
       .pass_pkt(crc_gen_to_txfifo_data0),
       .pass_pkt_wrreq(crc_gen_to_txfifo_wrreq0),
       .pass_pkt_usedw(txfifo_data_usedw0),
       .pass_valid_wrreq(pkt_output_valid_wrreq0),
       .pass_valid(pkt_output_valid0),
////mixed nmac or normal packets to rx_tx0 transmit direction///////////
       .tx_pkt(mix_crc_gen_to_txfifo_data),
       .tx_pkt_wrreq(mix_crc_gen_to_txfifo_wrreq),
       .tx_pkt_valid(mix_pkt_output_valid),
       .tx_pkt_valid_wrreq(mix_pkt_output_valid_wrreq),
       .tx_pkt_usedw(mix_txfifo_data_usedw),
       
////mixed nmac or normal packets from nmac_crc_check_0 module after CRC check////////
		.pkt_wrreq(mix0_crc_data_valid),
      .pkt(mix0_crc_data),
      .pkt_usedw(mix0_pkt_usedw),
      .valid_wrreq(mix0_pkt_valid_wrreq),
      .valid(mix0_pkt_valid),
////normal packets with CRC to rx_crc module ////  
      .datapath_pkt_wrreq(crc_data_valid0),
      .datapath_pkt(crc_data0),
      .datapath_pkt_usedw(pkt_usedw0),
      .datapath_valid_wrreq(pkt_valid_wrreq0),
      .datapath_valid(pkt_valid0),
		.FPGA_MAC(FPGA_MAC),
	   .FPGA_IP(FPGA_IP)
       );

		 wire [47:0] FPGA_MAC;
       wire [31:0] FPGA_IP;
		 
nmac_crc_check nmac_crc_check_0(			//not only check NMAC packets, but normal packets also.
   .clk(clk_125m_core),
   .wr_clk(rgm0_rx_clk),
   .reset(sys_rstn),
//mixed NMAC or normal packets from rx_tx0 reiceive direction/////////////////////   
   .in_pkt_wrreq(mix_crc_data_valid0),						
   .in_pkt(mix_crc_data0),
   .in_pkt_usedw(mix_pkt_usedw0),
   .in_valid_wrreq(mix_pkt_valid_wrreq0),
   .in_valid(mix_pkt_valid0),

   .port_error(),

//to NET_MAGIC_CTRL module /////////////////////   
   .out_pkt_wrreq(mix0_crc_data_valid),
   .out_pkt(mix0_crc_data),
   .out_pkt_usedw(mix0_pkt_usedw),
   .out_valid_wrreq(mix0_pkt_valid_wrreq),
   .out_valid(mix0_pkt_valid)
  );
		 
		 
		 
////////////////crc_check//////////////////
wire 				crc_result_wrreq;
wire 				crc_result;
wire 				crc_check_wrreq;
wire [138:0]	crc_check_data;
wire [7:0] 		crc_check_usedw;
rx_crc rx_crc(
    .clk(clk_125m_core),
    .reset(sys_rstn),
    
    .crc_result_wrreq(crc_result_wrreq),
    .crc_result(crc_result),
    
    .crc_check_wrreq(crc_check_wrreq),
    .crc_check_data(crc_check_data),
    .usedw(crc_check_usedw),
    
//changed by maoxilong 20121026;
    .crc_data_valid0(crc_data_valid0),//port0, normal packets separated by NET_MAGIC_CTRL;
    .crc_data0(crc_data0),
    .pkt_usedw0(pkt_usedw0),
    .pkt_valid_wrreq0(pkt_valid_wrreq0),
    .pkt_valid0(pkt_valid0),
    
    .crc_data_valid1(crc_data_valid1),//port1
    .crc_data1(crc_data1),
    .pkt_usedw1(pkt_usedw1),
    .pkt_valid_wrreq1(pkt_valid_wrreq1),
    .pkt_valid1(pkt_valid1),
	 
    .crc_data_valid2(crc_data_valid2),//port2
    .crc_data2(crc_data2),
    .pkt_usedw2(pkt_usedw2),
    .pkt_valid_wrreq2(pkt_valid_wrreq2),
    .pkt_valid2(pkt_valid2),
	 
    .crc_data_valid3(crc_data_valid3),//port3
    .crc_data3(crc_data3),
    .pkt_usedw3(pkt_usedw3),
    .pkt_valid_wrreq3(pkt_valid_wrreq3),
    .pkt_valid3(pkt_valid3),
	 
    .crc_data_valid4(crc_data_valid4),//port4
    .crc_data4(crc_data4),
    .pkt_usedw4(pkt_usedw4),
    .pkt_valid_wrreq4(pkt_valid_wrreq4),
    .pkt_valid4(pkt_valid4),
	 
    .crc_data_valid5(crc_data_valid5),//port5
    .crc_data5(crc_data5),
    .pkt_usedw5(pkt_usedw5),
    .pkt_valid_wrreq5(pkt_valid_wrreq5),
    .pkt_valid5(pkt_valid5),
	 
    .crc_data_valid6(crc_data_valid6),//port6
    .crc_data6(crc_data6),
    .pkt_usedw6(pkt_usedw6),
    .pkt_valid_wrreq6(pkt_valid_wrreq6),
    .pkt_valid6(pkt_valid6),
	 
    .crc_data_valid7(crc_data_valid7),//port7
    .crc_data7(crc_data7),
    .pkt_usedw7(pkt_usedw7),
    .pkt_valid_wrreq7(pkt_valid_wrreq7),
    .pkt_valid7(pkt_valid7),
    
    .gmii_rxclk0(rgm0_rx_clk),
    .gmii_rxclk1(rgm1_rx_clk),
    .gmii_rxclk2(rgm2_rx_clk),
    .gmii_rxclk3(rgm3_rx_clk),
    .gmii_rxclk4(gmii_rx_clk4),
    .gmii_rxclk5(gmii_rx_clk5),
    .gmii_rxclk6(gmii_rx_clk6),
    .gmii_rxclk7(gmii_rx_clk7),

    .port_error0(port_error0),
    .port_error1(port_error1),
    .port_error2(port_error2),
    .port_error3(port_error3),
    .port_error4(port_error4),
    .port_error5(port_error5),
    .port_error6(port_error6),
    .port_error7(port_error7)

 );


	 wire crc_gen_to_txfifo_wrreq0;
    wire [138:0]crc_gen_to_txfifo_data0;
    wire [7:0]txfifo_data_usedw0;
    wire pkt_output_valid_wrreq0;
    wire pkt_output_valid0;
	 
    wire crc_gen_to_txfifo_wrreq1;
    wire [138:0]crc_gen_to_txfifo_data1;
    wire [7:0]txfifo_data_usedw1;
    wire pkt_output_valid_wrreq1;
    wire pkt_output_valid1;
	 
    wire crc_gen_to_txfifo_wrreq2;
    wire [138:0]crc_gen_to_txfifo_data2;
    wire [7:0]txfifo_data_usedw2;
    wire pkt_output_valid_wrreq2;
    wire pkt_output_valid2;
	 
	 wire crc_gen_to_txfifo_wrreq3;
    wire [138:0]crc_gen_to_txfifo_data3;
    wire [7:0]txfifo_data_usedw3;
    wire pkt_output_valid_wrreq3;
    wire pkt_output_valid3;

    wire crc_gen_to_txfifo_wrreq4;
    wire [138:0]crc_gen_to_txfifo_data4;
    wire [7:0]txfifo_data_usedw4;
    wire pkt_output_valid_wrreq4;
    wire pkt_output_valid4;
	 
    wire crc_gen_to_txfifo_wrreq5;
    wire [138:0]crc_gen_to_txfifo_data5;
    wire [7:0]txfifo_data_usedw5;
    wire pkt_output_valid_wrreq5;
    wire pkt_output_valid5;
	 
    wire crc_gen_to_txfifo_wrreq6;
    wire [138:0]crc_gen_to_txfifo_data6;
    wire [7:0]txfifo_data_usedw6;
    wire pkt_output_valid_wrreq6;
    wire pkt_output_valid6;
	 
	 wire crc_gen_to_txfifo_wrreq7;
    wire [138:0]crc_gen_to_txfifo_data7;
    wire [7:0]txfifo_data_usedw7;
    wire pkt_output_valid_wrreq7;
    wire pkt_output_valid7;
///////////////crc_gen/////////////////////
tx_gen tx_gen(
     .clk(clk_125m_core),
     .reset(sys_rstn),
     
     .pkt_valid_wrreq(pkt_valid_wrreq),//flag fifo,to crc gen;
     .pkt_valid(pkt_valid),//[18:0],[18:17]:10-valid pkt and normal forward(depend on data[131:128]);
                              //11-valid pkt and copy;
                              //0x-invalid pkt and discard;
               //[16:0]:if this pkt need copy([18:17]=2'b11),every bit is one rgmii output interface;
     .pkt_data_wrreq(pkt_data_wrreq),//data fifo;
     .pkt_data(pkt_data),
     .pkt_data_usedw(pkt_data_usedw),
   
   .crc_gen_valid0(crc_gen_to_txfifo_wrreq0),//bp0;
   .crc_gen_data0(crc_gen_to_txfifo_data0),
   .output_data_usedw0(txfifo_data_usedw0),
   .pkt_output_valid_wrreq0(pkt_output_valid_wrreq0),
   .pkt_output_valid0(pkt_output_valid0),
   
   .crc_gen_valid1(crc_gen_to_txfifo_wrreq1),//bp1;
   .crc_gen_data1(crc_gen_to_txfifo_data1),
   .output_data_usedw1(txfifo_data_usedw1),
   .pkt_output_valid_wrreq1(pkt_output_valid_wrreq1),
   .pkt_output_valid1(pkt_output_valid1),
	
   .crc_gen_valid2(crc_gen_to_txfifo_wrreq2),//bp2;
   .crc_gen_data2(crc_gen_to_txfifo_data2),
   .output_data_usedw2(txfifo_data_usedw2),
   .pkt_output_valid_wrreq2(pkt_output_valid_wrreq2),
   .pkt_output_valid2(pkt_output_valid2),	
	
   .crc_gen_valid3(crc_gen_to_txfifo_wrreq3),//bp3;
   .crc_gen_data3(crc_gen_to_txfifo_data3),
   .output_data_usedw3(txfifo_data_usedw3),
   .pkt_output_valid_wrreq3(pkt_output_valid_wrreq3),
   .pkt_output_valid3(pkt_output_valid3),	
	
   .crc_gen_valid4(crc_gen_to_txfifo_wrreq4),//bp4;
   .crc_gen_data4(crc_gen_to_txfifo_data4),
   .output_data_usedw4(txfifo_data_usedw4),
   .pkt_output_valid_wrreq4(pkt_output_valid_wrreq4),
   .pkt_output_valid4(pkt_output_valid4),	
	
   .crc_gen_valid5(crc_gen_to_txfifo_wrreq5),//bp5;
   .crc_gen_data5(crc_gen_to_txfifo_data5),
   .output_data_usedw5(txfifo_data_usedw5),
   .pkt_output_valid_wrreq5(pkt_output_valid_wrreq5),
   .pkt_output_valid5(pkt_output_valid5),	
	
   .crc_gen_valid6(crc_gen_to_txfifo_wrreq6),//bp6;
   .crc_gen_data6(crc_gen_to_txfifo_data6),
   .output_data_usedw6(txfifo_data_usedw6),
   .pkt_output_valid_wrreq6(pkt_output_valid_wrreq6),
   .pkt_output_valid6(pkt_output_valid6),

   .crc_gen_valid7(crc_gen_to_txfifo_wrreq7),//bp7;
   .crc_gen_data7(crc_gen_to_txfifo_data7),
   .output_data_usedw7(txfifo_data_usedw7),
   .pkt_output_valid_wrreq7(pkt_output_valid_wrreq7),
   .pkt_output_valid7(pkt_output_valid7)
	);
    

		wire crc_data_valid0;
      wire [138:0]	crc_data0;
      wire [7:0]		pkt_usedw0;
      wire pkt_valid_wrreq0;
      wire pkt_valid0;
      wire port_receive0;
      wire port_discard0;
      wire port_send0;
rx_tx_1000 rx_tx0(
      .clk_125m_core(clk_125m_core),
      .clk_25m_core(clk_25m_core),
      .clk_25m_tx(clk_25m_tx),
      .clk_125m_tx(clk_125m_tx0_3),
      .reset(sys_rstn),
      
      .port_receive(port_receive0),
      .port_discard(port_discard0),
      .port_send(port_send0),
      .port_pream(port_pream0),
      
      .rgmii_txd(rgm0_tx_data),              
      .rgmii_tx_ctl(rgm0_tx_ctl),           
      .rgmii_tx_clk(rgm0_tx_clk),          
      .rgmii_rxd(rgm0_rx_data),              
      .rgmii_rx_ctl(rgm0_rx_ctl),
      .rgmii_rx_clk(rgm0_rx_clk),
      
      .crc_data_valid(mix_crc_data_valid0),	//from rx0 data fifo, to nmac_crc_check_0;
      .crc_data(mix_crc_data0),
      .pkt_usedw(mix_pkt_usedw0),
      .pkt_valid_wrreq(mix_pkt_valid_wrreq0),
      .pkt_valid(mix_pkt_valid0),

      .crc_gen_to_txfifo_wrreq(mix_crc_gen_to_txfifo_wrreq),// mixed by NET_MAGIC_CTRL module, to tx0 data fifo;
      .crc_gen_to_txfifo_data(mix_crc_gen_to_txfifo_data),
      .txfifo_data_usedw(mix_txfifo_data_usedw),
      .pkt_output_valid_wrreq(mix_pkt_output_valid_wrreq),
      .pkt_output_valid(mix_pkt_output_valid)
     );   

		wire crc_data_valid1;
      wire [138:0]crc_data1;
      wire [7:0]pkt_usedw1;
      wire pkt_valid_wrreq1;
      wire pkt_valid1;
      wire port_receive1;
      wire port_discard1;
      wire port_send1;
rx_tx_1000 rx_tx1(
      .clk_125m_core(clk_125m_core),
      .clk_25m_core(clk_25m_core),
      .clk_25m_tx(clk_25m_tx),
      .clk_125m_tx(clk_125m_tx0_3),
      .reset(sys_rstn),
      
      .port_receive(port_receive1),
      .port_discard(port_discard1),
      .port_send(port_send1),
      .port_pream(port_pream1),
      
      .rgmii_txd(rgm1_tx_data),              
      .rgmii_tx_ctl(rgm1_tx_ctl),           
      .rgmii_tx_clk(rgm1_tx_clk),          
      .rgmii_rxd(rgm1_rx_data),              
      .rgmii_rx_ctl(rgm1_rx_ctl),
      .rgmii_rx_clk(rgm1_rx_clk),
      
      .crc_data_valid(crc_data_valid1),//rx data fifo
      .crc_data(crc_data1),
      .pkt_usedw(pkt_usedw1),
      .pkt_valid_wrreq(pkt_valid_wrreq1),
      .pkt_valid(pkt_valid1),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq1),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data1),
      .txfifo_data_usedw(txfifo_data_usedw1),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq1),
      .pkt_output_valid(pkt_output_valid1)
     );    

	  wire crc_data_valid2;
      wire [138:0]crc_data2;
      wire [7:0]pkt_usedw2;
      wire pkt_valid_wrreq2;
      wire pkt_valid2;
      wire port_receive2;
      wire port_discard2;
      wire port_send2;
rx_tx_1000 rx_tx2(
      .clk_125m_core(clk_125m_core),
      .clk_25m_core(clk_25m_core),
      .clk_25m_tx(clk_25m_tx),
      .clk_125m_tx(clk_125m_tx0_3),
      .reset(sys_rstn),
      
      .port_receive(port_receive2),
      .port_discard(port_discard2),
      .port_send(port_send2),
      .port_pream(port_pream2),
      
      .rgmii_txd(rgm2_tx_data),              
      .rgmii_tx_ctl(rgm2_tx_ctl),           
      .rgmii_tx_clk(rgm2_tx_clk),          
      .rgmii_rxd(rgm2_rx_data),              
      .rgmii_rx_ctl(rgm2_rx_ctl),
      .rgmii_rx_clk(rgm2_rx_clk),
      
      .crc_data_valid(crc_data_valid2),//rx data fifo
      .crc_data(crc_data2),
      .pkt_usedw(pkt_usedw2),
      .pkt_valid_wrreq(pkt_valid_wrreq2),
      .pkt_valid(pkt_valid2),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq2),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data2),
      .txfifo_data_usedw(txfifo_data_usedw2),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq2),
      .pkt_output_valid(pkt_output_valid2)
     ); 

      wire crc_data_valid3;
      wire [138:0]crc_data3;
      wire [7:0]pkt_usedw3;
      wire pkt_valid_wrreq3;
      wire pkt_valid3;
      wire port_receive3;
      wire port_discard3;
      wire port_send3;
rx_tx_1000 rx_tx3(
      .clk_125m_core(clk_125m_core),
      .clk_25m_core(clk_25m_core),
      .clk_25m_tx(clk_25m_tx),
      .clk_125m_tx(clk_125m_tx0_3),
      .reset(sys_rstn),
      
      .port_receive(port_receive3),
      .port_discard(port_discard3),
      .port_send(port_send3),
      .port_pream(port_pream3),
      
      .rgmii_txd(rgm3_tx_data),              
      .rgmii_tx_ctl(rgm3_tx_ctl),           
      .rgmii_tx_clk(rgm3_tx_clk),          
      .rgmii_rxd(rgm3_rx_data),              
      .rgmii_rx_ctl(rgm3_rx_ctl),
      .rgmii_rx_clk(rgm3_rx_clk),
      
      .crc_data_valid(crc_data_valid3),//rx data fifo
      .crc_data(crc_data3),
      .pkt_usedw(pkt_usedw3),
      .pkt_valid_wrreq(pkt_valid_wrreq3),
      .pkt_valid(pkt_valid3),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq3),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data3),
      .txfifo_data_usedw(txfifo_data_usedw3),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq3),
      .pkt_output_valid(pkt_output_valid3)
     ); 
///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////	  
      wire crc_data_valid4;
      wire [138:0]crc_data4;
      wire [7:0]pkt_usedw4;
      wire pkt_valid_wrreq4;
      wire pkt_valid4;
      wire port_receive4;
      wire port_discard4;
      wire port_send4;
sfp_rx_tx_1000 sfp_rx_tx_4(
      .clk(sysclk_125m),
      .sfp_clk(sfp_clk0),
      .reset(sys_rstn),
      .gmii_rx_clk(gmii_rx_clk4),
      .gmii_tx_clk(send_clk4),
      .sfp_rxp(sfp0_rxd),
      .sfp_txp(sfp0_txd),
      
      .l_link_sfp(l_link_sfp0),
      .r_act_sfp(r_act_sfp0),
      
      .crc_data_valid(crc_data_valid4),//rx data fifo
      .crc_data(crc_data4),
      .pkt_usedw(pkt_usedw4),
      .pkt_valid_wrreq(pkt_valid_wrreq4),
      .pkt_valid(pkt_valid4),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq4),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data4),
      .txfifo_data_usedw(txfifo_data_usedw4),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq4),
      .pkt_output_valid(pkt_output_valid4),
      
      .port_receive(port_receive4),
      .port_discard(port_discard4),
      .port_send(port_send4),
      .port_pream(port_pream4)
     );
	  
	  
      wire crc_data_valid5;
      wire [138:0]crc_data5;
      wire [7:0]pkt_usedw5;
      wire pkt_valid_wrreq5;
      wire pkt_valid5;
      wire port_receive5;
      wire port_discard5;
      wire port_send5;
sfp_rx_tx_1000 sfp_rx_tx_5(
      .clk(sysclk_125m),
      .sfp_clk(sfp_clk0),
      .reset(sys_rstn),
      .gmii_rx_clk(gmii_rx_clk5),
      .gmii_tx_clk(send_clk5),
      .sfp_rxp(sfp1_rxd),
      .sfp_txp(sfp1_txd),
      
      .l_link_sfp(l_link_sfp1),
      .r_act_sfp(r_act_sfp1),
      
      .crc_data_valid(crc_data_valid5),//rx data fifo
      .crc_data(crc_data5),
      .pkt_usedw(pkt_usedw5),
      .pkt_valid_wrreq(pkt_valid_wrreq5),
      .pkt_valid(pkt_valid5),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq5),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data5),
      .txfifo_data_usedw(txfifo_data_usedw5),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq5),
      .pkt_output_valid(pkt_output_valid5),
      
      .port_receive(port_receive5),
      .port_discard(port_discard5),
      .port_send(port_send5),
      .port_pream(port_pream5)
     );	  
      
		wire crc_data_valid6;
      wire [138:0]crc_data6;
      wire [7:0]pkt_usedw6;
      wire pkt_valid_wrreq6;
      wire pkt_valid6;
      wire port_receive6;
      wire port_discard6;
      wire port_send6;
sfp_rx_tx_1000 sfp_rx_tx_6(
      .clk(sysclk_125m),
      .sfp_clk(sfp_clk0),
      .reset(sys_rstn),
      .gmii_rx_clk(gmii_rx_clk6),
      .gmii_tx_clk(send_clk6),
      .sfp_rxp(sfp2_rxd),
      .sfp_txp(sfp2_txd),
      
      .l_link_sfp(l_link_sfp2),
      .r_act_sfp(r_act_sfp2),
      
      .crc_data_valid(crc_data_valid6),//rx data fifo
      .crc_data(crc_data6),
      .pkt_usedw(pkt_usedw6),
      .pkt_valid_wrreq(pkt_valid_wrreq6),
      .pkt_valid(pkt_valid6),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq6),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data6),
      .txfifo_data_usedw(txfifo_data_usedw6),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq6),
      .pkt_output_valid(pkt_output_valid6),
      
      .port_receive(port_receive6),
      .port_discard(port_discard6),
      .port_send(port_send6),
      .port_pream(port_pream6)
     );

	  wire crc_data_valid7;
      wire [138:0]crc_data7;
      wire [7:0]pkt_usedw7;
      wire pkt_valid_wrreq7;
      wire pkt_valid7;
      wire port_receive7;
      wire port_discard7;
      wire port_send7;
sfp_rx_tx_1000 sfp_rx_tx_7(
      .clk(sysclk_125m),
      .sfp_clk(sfp_clk0),
      .reset(sys_rstn),
      .gmii_rx_clk(gmii_rx_clk7),
      .gmii_tx_clk(send_clk7),
      .sfp_rxp(sfp3_rxd),
      .sfp_txp(sfp3_txd),
      
      .l_link_sfp(l_link_sfp3),
      .r_act_sfp(r_act_sfp3),
      
      .crc_data_valid(crc_data_valid7),//rx data fifo
      .crc_data(crc_data7),
      .pkt_usedw(pkt_usedw7),
      .pkt_valid_wrreq(pkt_valid_wrreq7),
      .pkt_valid(pkt_valid7),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq7),//tx fifo;
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data7),
      .txfifo_data_usedw(txfifo_data_usedw7),
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq7),
      .pkt_output_valid(pkt_output_valid7),
      
      .port_receive(port_receive7),
      .port_discard(port_discard7),
      .port_send(port_send7),
      .port_pream(port_pream7)
     );	  
//////////////////////////////////////////////////////////////////////////////	  
//////////////////////////local bus with cdp///////////////////////////////////////////////////
     wire [31:0]data_out_cdp;
     wire ack_n_cdp;
     wire send_clk4;
     wire send_clk5;
     wire send_clk6;
     wire send_clk7;
     wire gmii_rx_clk4;
     wire gmii_rx_clk5;
     wire gmii_rx_clk6;
     wire gmii_rx_clk7;
     wire port_pream0;
     wire port_pream1;
     wire port_pream2;
     wire port_pream3;
     wire port_pream4;
     wire port_pream5;
     wire port_pream6;
     wire port_pream7;
     wire port_error0;
     wire port_error1;
     wire port_error2;
     wire port_error3;
     wire port_error4;
     wire port_error5;
     wire port_error6;
     wire port_error7;

cdp_local_bus cdp_local_bus(
    .clk(clk_125m_core),
    .clk_25m_core(clk_25m_core), 
    .reset(sys_rstn),
    
    .cs_n(cs_n),//local bus;
    .rd_wr(rd_wr),//only write,no read;
    .ack_n(ack_n_cdp),
    .data(data),
    .data_out(data_out_cdp),
    .ale(ale),
    
    .port_receive0(port_receive0),
    .port_discard0(port_discard0),
    .port_send0(port_send0),
    .send_clk0(clk_125m_core),
    
    .port_receive1(port_receive1),
    .port_discard1(port_discard1),
    .port_send1(port_send1),
    .send_clk1(clk_125m_core),
    
    .port_receive2(port_receive2),
    .port_discard2(port_discard2),
    .port_send2(port_send2),
    .send_clk2(clk_125m_core),
    
    .port_receive3(port_receive3),
    .port_discard3(port_discard3),
    .port_send3(port_send3),
    .send_clk3(clk_125m_core),
    
    .port_receive4(port_receive4),
    .port_discard4(port_discard4),
    .port_send4(port_send4),
    .send_clk4(send_clk4),
    
    .port_receive5(port_receive5),
    .port_discard5(port_discard5),
    .port_send5(port_send5),
    .send_clk5(send_clk5),
    
    .port_receive6(port_receive6),
    .port_discard6(port_discard6),
    .port_send6(port_send6),
    .send_clk6(send_clk6),
    
    .port_receive7(port_receive7),
    .port_discard7(port_discard7),
    .port_send7(port_send7),
    .send_clk7(send_clk7),
   
    .gmii_rxclk0(rgm0_rx_clk),
    .gmii_rxclk1(rgm1_rx_clk),
    .gmii_rxclk2(rgm2_rx_clk),
    .gmii_rxclk3(rgm3_rx_clk),
    .gmii_rxclk4(gmii_rx_clk4),
    .gmii_rxclk5(gmii_rx_clk5),
    .gmii_rxclk6(gmii_rx_clk6),
    .gmii_rxclk7(gmii_rx_clk7),
    
    .port_error0(port_error0),
    .port_error1(port_error1),
    .port_error2(port_error2),
    .port_error3(port_error3),
    .port_error4(port_error4),
    .port_error5(port_error5),
    .port_error6(port_error6),
    .port_error7(port_error7),
    
    .port_pream0(port_pream0),
    .port_pream1(port_pream1),
    .port_pream2(port_pream2),
    .port_pream3(port_pream3),
    .port_pream4(port_pream4),
    .port_pream5(port_pream5),
    .port_pream6(port_pream6),
    .port_pream7(port_pream7),
	 .FPGA_MAC(FPGA_MAC),
	 .FPGA_IP(FPGA_IP)
  ); 
///////////////////////////////////////////////////////////////////////////////////  

///////////////////////////////////////////////////////////////////////////////////	  
	   
wire [3:0] elec_port_link;
top_mido top_mido(
.clk(clk_12m_5_mdio),
.reset(sys_rstn),
//-----------------------------------mdio 接口---------------------------------
.mdc(vsc_smi_mdc),//输出给外部芯片的时钟
.mdio(vsc_smi_mdio),
.port_link(elec_port_link)
);

wire [7:0] link_state;
assign link_state = {~l_link_sfp3,~l_link_sfp2,~l_link_sfp1,~l_link_sfp0,elec_port_link};
///////////////////////////////////////////////////////////////////////////////////	  
	  
   wire clk_125m_tx0_3;
   wire clk_25m_core;
   wire clk_125m_core;
   wire clk_25m_tx;
	wire clk_12m_5_mdio;
pll_clk pll_clk(
   .clk_125m_sys(sysclk_125m),
   .clk_125m_core(clk_125m_core),
   .clk_125m_tx0_7(clk_125m_tx0_3),
   .clk_125m_tx8_15(),
   .clk_25m_core(clk_25m_core), 
   .clk_25m_tx(clk_25m_tx),
	.clk_12m_5_mdio(clk_12m_5_mdio)
  );

endmodule 