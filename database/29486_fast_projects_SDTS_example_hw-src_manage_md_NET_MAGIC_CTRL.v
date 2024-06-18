// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/////////////////////////////////////////////////////////////////////////////////
// Company:   NUDT
// Engineer:  
// Create Date:    11/11/2010 
// Module Name:    command_parse 
// Project Name: 
// Tool versions: quartus 9.1
// Description:  1.??????????????????
//               2.?????????FPGA???????????????????????????????????????????????????????????????
//               3.???????????????????
//       	       4.?????????????????????                
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns
module NET_MAGIC_CTRL(
       clk, 
       reset_n,                 //active low

       /////// local bus interface start///////
       ale,                     //Address Latch Enable.active high output
       cs_n,                    //local bus chip select ,active low.
       data,                    //32-bit bidirectional multiplexed write data and address bus output
       rd_wr,
       ack_n_um,                //local bus ack.active low. input
       ack_n_cdp,               //local bus ack.active low. input
       ack_n_sram,              //local bus ack.active low. input
       
       rdata_um,                //local bus read data from um
       rdata_cdp,               //local bus read data from cdp
       rdata_sram,              //local bus read data from sram
       
////passthrough module interface//////// 
       pass_pkt,
       pass_pkt_wrreq,
       pass_pkt_usedw,
       pass_valid_wrreq,
       pass_valid,
//////rx/tx module interface///////////
       tx_pkt,
       tx_pkt_wrreq,
       tx_pkt_valid,
       tx_pkt_valid_wrreq,
       tx_pkt_usedw,
       
////crc_check module interface///
      pkt_wrreq,
      pkt,
      pkt_usedw,
      valid_wrreq,
      valid,
////pkt insert module interface ////  
      datapath_pkt_wrreq,
      datapath_pkt,
      datapath_pkt_usedw,
      datapath_valid_wrreq,
      datapath_valid,
      FPGA_MAC,
	   FPGA_IP	
       );
	  
	   input [47:0] FPGA_MAC;
      input [31:0] FPGA_IP;
/////////////// ??? /////////////////////// 
//parameter  FPGA_MAC  = 48'h888888888888;
//parameter  FPGA_IP   = 32'h88888888;  
/////////////// ??? /////////////////////// 
/////////////// IO DATA///////////////////////  
       input        clk;  
       input        reset_n;                //active low
      
       /////// local bus interface start///////
       output       ale;                    //Address Latch Enable.active high output
       output       cs_n;                   //local bus chip select ,active low.
       output       rd_wr;                  //read or write request.1: read  0: write  output
       output [31:0]data;                   //32-bit bidirectional multiplexed write data and address bus output
       input        ack_n_um;               //local bus ack.active low. input
       input        ack_n_cdp;              //local bus ack.active low. input
       input        ack_n_sram;             //local bus ack.active low. input
       
       input [31:0] rdata_um;                //local bus read data from um
       input [31:0] rdata_cdp;               //local bus read data from cdp
       input [31:0] rdata_sram;              //local bus read data from sram

////crc_check module interface///
input         pkt_wrreq;
input[138:0]  pkt;
output [7:0]  pkt_usedw;
input         valid_wrreq;
input         valid;
////pkt insert module interface ////  
output        datapath_pkt_wrreq;
output[138:0] datapath_pkt;
input [7:0]   datapath_pkt_usedw;
output        datapath_valid_wrreq;
output        datapath_valid;

input[138:0]	pass_pkt;
input       	pass_pkt_wrreq;
output [7:0]	pass_pkt_usedw;
input       	pass_valid_wrreq;
input      		pass_valid;

output [138:0]tx_pkt;
output        tx_pkt_wrreq;
output        tx_pkt_valid;
output        tx_pkt_valid_wrreq;
input [7:0]   tx_pkt_usedw;
  
wire [47:0] PROXY_MAC; 
wire [31:0] PROXY_IP;
wire        proxy_addr_valid;
wire [34:0] command_data;
wire        command_wr;
wire        command_fifo_full;
wire [16:0] sequence_d;
wire        sequence_wr;
wire        sequence_fifo_full;
wire [36:0] pkt_to_gen;
wire        pkt_to_gen_wr;
wire        pkt_to_gen_afull;
wire [32:0] length_to_gen;
wire        length_to_gen_wr;
wire        length_to_gen_afull;
wire [35:0] ack_pkt;
wire        ack_wr;
wire        ack_afull;
wire        ack_valid_wr;
wire        ack_valid_afull;
wire        ack_fifo_wrclk;
manage_rx manage_rx(
   .clk(clk),
   .reset_n(reset_n),
////crc_check module interface///
   .pkt_wrreq(pkt_wrreq),
   .pkt(pkt),
   .pkt_usedw(pkt_usedw),
   .valid_wrreq(valid_wrreq),
   .valid(valid),
////pkt insert module interface ////  
   .datapath_pkt_wrreq(datapath_pkt_wrreq),
   .datapath_pkt(datapath_pkt),
   .datapath_pkt_usedw(datapath_pkt_usedw),
   .datapath_valid_wrreq(datapath_valid_wrreq),
   .datapath_valid(datapath_valid),
 //////command parse module interface/////////
   .command_data(command_data),         //command [34:32]001:???????  011:???????  010:????????   111:???????? [31:0]:??
   .command_wr(command_wr),
   .command_fifo_full(command_fifo_full),
   .sequence_d(sequence_d),           //[15:0]:??????[16]:?????? 1????? 0????? ???
   .sequence_wr(sequence_wr),
   .sequence_fifo_full(sequence_fifo_full),
   .PROXY_MAC(PROXY_MAC),
   .PROXY_IP(PROXY_IP),
   .FPGA_MAC(FPGA_MAC),
   .FPGA_IP(FPGA_IP),
   .proxy_addr_valid(proxy_addr_valid)
);
command_parse  command_parse(
       .clk(clk),
       .reset_n(reset_n),// active low
       //////??////////////
       .command_data(command_data),      //???[34:32]001:???????  011:???????  010:????????   111:???????? [31:0]:??
       .command_wr(command_wr),
       .command_fifo_full(command_fifo_full),
       .sequence_d(sequence_d),          //[15:0]:??????[16]:?????? 1????? 0????? ???
       .sequence_wr(sequence_wr),
       .sequence_fifo_full(sequence_fifo_full),
       //////////////////////////
       /////// local_bus ////////
       .ale(ale),      //Address Latch Enable.active high output
       .cs_n(cs_n),    //local bus chip select ,active low.
       .rd_wr(rd_wr),  //read or write request.1: read  0: write  output
       .ack_n_um(ack_n_um),               //local bus ack.active low. input
       .ack_n_cdp(ack_n_cdp),              //local bus ack.active low. input
       .ack_n_sram(ack_n_sram),             //local bus ack.active low. input
       
       .rdata_um(rdata_um),                //local bus read data from um
       .rdata_cdp(rdata_cdp),               //local bus read data from cdp
       .rdata_sram(rdata_sram),              //local bus read data from sram
       //32-bit bidirectional multiplexed write data and address bus output
       .data_out(data),   
              
       .pkt_to_gen(pkt_to_gen),//[36:34] 001:???????  011:???????  010:???????? 100:???? [33:31]:?????  [31:0]:??
       .pkt_to_gen_wr(pkt_to_gen_wr),
       .pkt_to_gen_afull(pkt_to_gen_afull),
       .length_to_gen(length_to_gen),//[32:24]:?????? [23:16]:count  [15:0]???
       .length_to_gen_wr(length_to_gen_wr),
       .length_to_gen_afull(length_to_gen_afull) 
       );
pkt_gen pkt_gen(
       .clk(clk),
       .reset_n(reset_n),
       .PROXY_MAC(PROXY_MAC),
       .PROXY_IP(PROXY_IP),
       .FPGA_MAC(FPGA_MAC),
       .FPGA_IP(FPGA_IP),
       .proxy_addr_valid(proxy_addr_valid),
       .pkt_to_gen(pkt_to_gen),//[36:34] 001:???????  011:???????  010:???????? 100:???? [33:31]:?????  [31:0]:??
       .pkt_to_gen_wr(pkt_to_gen_wr),
       .pkt_to_gen_afull(pkt_to_gen_afull),
       .length_to_gen(length_to_gen),//[24:16]:??????  [15:0]???
       .length_to_gen_wr(length_to_gen_wr),
       .length_to_gen_afull(length_to_gen_afull),   
       //FPGA??????????;
       .ack_pkt(ack_pkt),   //[35:34]01:???????  11:???????  10:????????  [33:32]:?????  [31:0]:??
       .ack_wr(ack_wr),
       .ack_afull(ack_afull), 
       //FPGA???????????????;??FIFO??????FIFO????????????
       .ack_valid_wr(ack_valid_wr),
       .ack_valid_afull(ack_valid_afull));
manage_tx manage_tx(
.clk(clk),
.reset_n(reset_n),
 // ack_fifo_wrclk,.
.ack_pkt(ack_pkt),   //[35:34]01:???????  11:???????  10:????????  [33:32]:?????  [31:0]:??
.ack_wr(ack_wr),
.ack_afull(ack_afull), 
//FPGA???????????????;??FIFO??????FIFO????????????
.ack_valid_wr(ack_valid_wr),
.ack_valid_afull(ack_valid_afull),

.pass_pkt(pass_pkt),
.pass_pkt_wrreq(pass_pkt_wrreq),
.pass_pkt_usedw(pass_pkt_usedw),
.pass_valid_wrreq(pass_valid_wrreq),
.pass_valid(pass_valid),

.tx_pkt(tx_pkt),
.tx_pkt_wrreq(tx_pkt_wrreq),
.tx_pkt_valid(tx_pkt_valid),
.tx_pkt_valid_wrreq(tx_pkt_valid_wrreq),
.tx_pkt_usedw(tx_pkt_usedw)
);
endmodule 