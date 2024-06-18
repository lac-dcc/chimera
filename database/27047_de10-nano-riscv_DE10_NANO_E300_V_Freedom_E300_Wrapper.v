// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

// wrapper for simplify connections
// by Dee Zeng

////////////////////////////////
// GPIO 0-31 map
/////////////////////
//
// GPIO,  IOF0  ,  IOF1
//  0  ,        ,pwn0_0 
//  1  ,        ,pwn0_1 
//  2  ,spi0_cs0,pwn0_2 
//  3  ,spi0_dq0,pwn0_3 
//  4  ,spi0_dq1,
//  5  ,spi0_sck,
//  6  ,spi0_dq2,
//  7  ,spi0_dq3,
//  8  ,spi0_cs1,
//  9  ,spi0_cs2,
// 10  ,spi0_cs3,pwn2_0
// 11  ,        ,pwn2_1
// 12  ,i2c0_sda,pwn2_2
// 13  ,i2c0_scl,pwn2_3
// 14  ,        ,
// 15  ,        ,
// 16  ,uart0_rx,
// 17  ,uart0_tx,
// 18  ,        ,
// 19  ,        ,pwn1_0
// 20  ,        ,pwn1_1
// 21  ,        ,pwn1_2
// 22  ,        ,pwn1_3
// 23  ,        ,
// 24  ,uart1_rx,
// 25  ,uart1_tx,
// 26  ,spi1_cs0,
// 27  ,spi1_dq0,
// 28  ,spi1_dq1,
// 29  ,spi1_sck,
// 30  ,spi1_dq2,
// 31  ,spi1_dq3,
/////  to Use GPIO, iof_en = 0 
////   to Use IOF0, iof_en = 1, iof_sel = 0
////   to Use IOF1, iof_en = 1, iof_sel = 1


module Freedom_E300_Wrapper (
 
    input  wire clock,
    input  wire aon_lfextclk,
    input  wire aon_erst_n,
    input  wire jtag_reset,
    output  wire io_ndreset,

    input  wire jtag_tck,
    input  wire jtag_tms,
    input  wire jtag_tdi,
    output wire jtag_tdo,
    
    output wire qspi_sck,
    output wire qspi_cs_0,
    inout  wire [3:0] qspi_dq,

    input  wire [31:0] e300_gpio_i_ival,
    output wire [31:0] e300_gpio_o_ie,
    output wire [31:0] e300_gpio_o_oval,
    output wire [31:0] e300_gpio_o_oe
    
);  
 
 
  wire io_pins_jtag_TDO_o_oval;
  wire io_pins_jtag_TDO_o_oe;

  assign jtag_tdo = io_pins_jtag_TDO_o_oe ? io_pins_jtag_TDO_o_oval :1'bz;

  
  assign qspi_dq[0] = io_pins_qspi_dq_0_o_oe ? io_pins_qspi_dq_0_o_oval :1'bz;
  assign qspi_dq[1] = io_pins_qspi_dq_1_o_oe ? io_pins_qspi_dq_1_o_oval :1'bz;
  assign qspi_dq[2] = io_pins_qspi_dq_2_o_oe ? io_pins_qspi_dq_2_o_oval :1'bz;
  assign qspi_dq[3] = io_pins_qspi_dq_3_o_oe ? io_pins_qspi_dq_3_o_oval :1'bz;

  assign  io_pins_qspi_dq_0_i_ival = qspi_dq[0] & io_pins_qspi_dq_0_o_ie;
  assign  io_pins_qspi_dq_1_i_ival = qspi_dq[1] & io_pins_qspi_dq_1_o_ie;
  assign  io_pins_qspi_dq_2_i_ival = qspi_dq[2] & io_pins_qspi_dq_2_o_ie;
  assign  io_pins_qspi_dq_3_i_ival = qspi_dq[3] & io_pins_qspi_dq_3_o_ie; 


  
E300ArtyDevKitPlatform E300ArtyDevKitPlatform_inst( 
  /*input   */    .clock(clock), 

  /*input   */    .io_pins_aon_erst_n_i_ival(aon_erst_n), 
  /*input   */    .io_pins_aon_lfextclk_i_ival(aon_lfextclk), 

  /*output  */    .io_ndreset(io_ndreset), 

  /*input   */    .io_jtag_reset(jtag_reset), 
 
  
  /*input   */    .io_pins_jtag_TCK_i_ival(jtag_tck), 
  /*input   */    .io_pins_jtag_TMS_i_ival(jtag_tms), 
  /*input   */    .io_pins_jtag_TDI_i_ival(jtag_tdi), 
  /*output  */    .io_pins_jtag_TDO_o_oval(io_pins_jtag_TDO_o_oval),
  /*output  */    .io_pins_jtag_TDO_o_oe(io_pins_jtag_TDO_o_oe), 
  

  /*input   */    .io_pins_gpio_pins_0_i_ival(e300_gpio_i_ival[0]), 
  /*output  */    .io_pins_gpio_pins_0_o_oval(e300_gpio_o_oval[0]), 
  /*output  */    .io_pins_gpio_pins_0_o_oe(e300_gpio_o_oe[0]), 
  /*output  */    .io_pins_gpio_pins_0_o_ie(e300_gpio_o_ie[0]), 
  /*input   */    .io_pins_gpio_pins_1_i_ival(e300_gpio_i_ival[1]), 
  /*output  */    .io_pins_gpio_pins_1_o_oval(e300_gpio_o_oval[1]), 
  /*output  */    .io_pins_gpio_pins_1_o_oe(e300_gpio_o_oe[1]), 
  /*output  */    .io_pins_gpio_pins_1_o_ie(e300_gpio_o_ie[1]), 
  /*input   */    .io_pins_gpio_pins_2_i_ival(e300_gpio_i_ival[2]), 
  /*output  */    .io_pins_gpio_pins_2_o_oval(e300_gpio_o_oval[2]), 
  /*output  */    .io_pins_gpio_pins_2_o_oe(e300_gpio_o_oe[2]), 
  /*output  */    .io_pins_gpio_pins_2_o_ie(e300_gpio_o_ie[2]), 
  /*input   */    .io_pins_gpio_pins_3_i_ival(e300_gpio_i_ival[3]), 
  /*output  */    .io_pins_gpio_pins_3_o_oval(e300_gpio_o_oval[3]), 
  /*output  */    .io_pins_gpio_pins_3_o_oe(e300_gpio_o_oe[3]), 
  /*output  */    .io_pins_gpio_pins_3_o_ie(e300_gpio_o_ie[3]), 
  /*input   */    .io_pins_gpio_pins_4_i_ival(e300_gpio_i_ival[4]), 
  /*output  */    .io_pins_gpio_pins_4_o_oval(e300_gpio_o_oval[4]), 
  /*output  */    .io_pins_gpio_pins_4_o_oe(e300_gpio_o_oe[4]), 
  /*output  */    .io_pins_gpio_pins_4_o_ie(e300_gpio_o_ie[4]), 
  /*input   */    .io_pins_gpio_pins_5_i_ival(e300_gpio_i_ival[5]), 
  /*output  */    .io_pins_gpio_pins_5_o_oval(e300_gpio_o_oval[5]), 
  /*output  */    .io_pins_gpio_pins_5_o_oe(e300_gpio_o_oe[5]), 
  /*output  */    .io_pins_gpio_pins_5_o_ie(e300_gpio_o_ie[5]), 
  /*input   */    .io_pins_gpio_pins_6_i_ival(e300_gpio_i_ival[6]), 
  /*output  */    .io_pins_gpio_pins_6_o_oval(e300_gpio_o_oval[6]), 
  /*output  */    .io_pins_gpio_pins_6_o_oe(e300_gpio_o_oe[6]), 
  /*output  */    .io_pins_gpio_pins_6_o_ie(e300_gpio_o_ie[6]), 
  /*input   */    .io_pins_gpio_pins_7_i_ival(e300_gpio_i_ival[7]), 
  /*output  */    .io_pins_gpio_pins_7_o_oval(e300_gpio_o_oval[7]), 
  /*output  */    .io_pins_gpio_pins_7_o_oe(e300_gpio_o_oe[7]), 
  /*output  */    .io_pins_gpio_pins_7_o_ie(e300_gpio_o_ie[7]), 
  /*input   */    .io_pins_gpio_pins_8_i_ival(e300_gpio_i_ival[8]), 
  /*output  */    .io_pins_gpio_pins_8_o_oval(e300_gpio_o_oval[8]), 
  /*output  */    .io_pins_gpio_pins_8_o_oe(e300_gpio_o_oe[8]), 
  /*output  */    .io_pins_gpio_pins_8_o_ie(e300_gpio_o_ie[8]), 
  /*input   */    .io_pins_gpio_pins_9_i_ival(e300_gpio_i_ival[9]), 
  /*output  */    .io_pins_gpio_pins_9_o_oval(e300_gpio_o_oval[9]), 
  /*output  */    .io_pins_gpio_pins_9_o_oe(e300_gpio_o_oe[9]), 
  /*output  */    .io_pins_gpio_pins_9_o_ie(e300_gpio_o_ie[9]), 
  /*input   */    .io_pins_gpio_pins_10_i_ival(e300_gpio_i_ival[10]), 
  /*output  */    .io_pins_gpio_pins_10_o_oval(e300_gpio_o_oval[10]), 
  /*output  */    .io_pins_gpio_pins_10_o_oe(e300_gpio_o_oe[10]), 
  /*output  */    .io_pins_gpio_pins_10_o_ie(e300_gpio_o_ie[10]), 
  /*input   */    .io_pins_gpio_pins_11_i_ival(e300_gpio_i_ival[11]), 
  /*output  */    .io_pins_gpio_pins_11_o_oval(e300_gpio_o_oval[11]), 
  /*output  */    .io_pins_gpio_pins_11_o_oe(e300_gpio_o_oe[11]), 
  /*output  */    .io_pins_gpio_pins_11_o_ie(e300_gpio_o_ie[11]), 
  /*input   */    .io_pins_gpio_pins_12_i_ival(e300_gpio_i_ival[12]), 
  /*output  */    .io_pins_gpio_pins_12_o_oval(e300_gpio_o_oval[12]), 
  /*output  */    .io_pins_gpio_pins_12_o_oe(e300_gpio_o_oe[12]), 
  /*output  */    .io_pins_gpio_pins_12_o_ie(e300_gpio_o_ie[12]), 
  /*input   */    .io_pins_gpio_pins_13_i_ival(e300_gpio_i_ival[13]), 
  /*output  */    .io_pins_gpio_pins_13_o_oval(e300_gpio_o_oval[13]), 
  /*output  */    .io_pins_gpio_pins_13_o_oe(e300_gpio_o_oe[13]), 
  /*output  */    .io_pins_gpio_pins_13_o_ie(e300_gpio_o_ie[13]), 
  /*input   */    .io_pins_gpio_pins_14_i_ival(e300_gpio_i_ival[14]), 
  /*output  */    .io_pins_gpio_pins_14_o_oval(e300_gpio_o_oval[14]), 
  /*output  */    .io_pins_gpio_pins_14_o_oe(e300_gpio_o_oe[14]), 
  /*output  */    .io_pins_gpio_pins_14_o_ie(e300_gpio_o_ie[14]), 
  /*input   */    .io_pins_gpio_pins_15_i_ival(e300_gpio_i_ival[15]), 
  /*output  */    .io_pins_gpio_pins_15_o_oval(e300_gpio_o_oval[15]), 
  /*output  */    .io_pins_gpio_pins_15_o_oe(e300_gpio_o_oe[15]), 
  /*output  */    .io_pins_gpio_pins_15_o_ie(e300_gpio_o_ie[15]), 
  /*input   */    .io_pins_gpio_pins_16_i_ival(e300_gpio_i_ival[16]), 
  /*output  */    .io_pins_gpio_pins_16_o_oval(e300_gpio_o_oval[16]), 
  /*output  */    .io_pins_gpio_pins_16_o_oe(e300_gpio_o_oe[16]), 
  /*output  */    .io_pins_gpio_pins_16_o_ie(e300_gpio_o_ie[16]), 
  /*input   */    .io_pins_gpio_pins_17_i_ival(e300_gpio_i_ival[17]), 
  /*output  */    .io_pins_gpio_pins_17_o_oval(e300_gpio_o_oval[17]), 
  /*output  */    .io_pins_gpio_pins_17_o_oe(e300_gpio_o_oe[17]), 
  /*output  */    .io_pins_gpio_pins_17_o_ie(e300_gpio_o_ie[17]), 
  /*input   */    .io_pins_gpio_pins_18_i_ival(e300_gpio_i_ival[18]), 
  /*output  */    .io_pins_gpio_pins_18_o_oval(e300_gpio_o_oval[18]), 
  /*output  */    .io_pins_gpio_pins_18_o_oe(e300_gpio_o_oe[18]), 
  /*output  */    .io_pins_gpio_pins_18_o_ie(e300_gpio_o_ie[18]), 
  /*input   */    .io_pins_gpio_pins_19_i_ival(e300_gpio_i_ival[19]), 
  /*output  */    .io_pins_gpio_pins_19_o_oval(e300_gpio_o_oval[19]), 
  /*output  */    .io_pins_gpio_pins_19_o_oe(e300_gpio_o_oe[19]), 
  /*output  */    .io_pins_gpio_pins_19_o_ie(e300_gpio_o_ie[19]), 
  /*input   */    .io_pins_gpio_pins_20_i_ival(e300_gpio_i_ival[20]), 
  /*output  */    .io_pins_gpio_pins_20_o_oval(e300_gpio_o_oval[20]), 
  /*output  */    .io_pins_gpio_pins_20_o_oe(e300_gpio_o_oe[20]), 
  /*output  */    .io_pins_gpio_pins_20_o_ie(e300_gpio_o_ie[20]), 
  /*input   */    .io_pins_gpio_pins_21_i_ival(e300_gpio_i_ival[21]), 
  /*output  */    .io_pins_gpio_pins_21_o_oval(e300_gpio_o_oval[21]), 
  /*output  */    .io_pins_gpio_pins_21_o_oe(e300_gpio_o_oe[21]), 
  /*output  */    .io_pins_gpio_pins_21_o_ie(e300_gpio_o_ie[21]), 
  /*input   */    .io_pins_gpio_pins_22_i_ival(e300_gpio_i_ival[22]), 
  /*output  */    .io_pins_gpio_pins_22_o_oval(e300_gpio_o_oval[22]), 
  /*output  */    .io_pins_gpio_pins_22_o_oe(e300_gpio_o_oe[22]), 
  /*output  */    .io_pins_gpio_pins_22_o_ie(e300_gpio_o_ie[22]), 
  /*input   */    .io_pins_gpio_pins_23_i_ival(e300_gpio_i_ival[23]), 
  /*output  */    .io_pins_gpio_pins_23_o_oval(e300_gpio_o_oval[23]), 
  /*output  */    .io_pins_gpio_pins_23_o_oe(e300_gpio_o_oe[23]), 
  /*output  */    .io_pins_gpio_pins_23_o_ie(e300_gpio_o_ie[23]), 
  /*input   */    .io_pins_gpio_pins_24_i_ival(e300_gpio_i_ival[24]), 
  /*output  */    .io_pins_gpio_pins_24_o_oval(e300_gpio_o_oval[24]), 
  /*output  */    .io_pins_gpio_pins_24_o_oe(e300_gpio_o_oe[24]), 
  /*output  */    .io_pins_gpio_pins_24_o_ie(e300_gpio_o_ie[24]), 
  /*input   */    .io_pins_gpio_pins_25_i_ival(e300_gpio_i_ival[25]), 
  /*output  */    .io_pins_gpio_pins_25_o_oval(e300_gpio_o_oval[25]), 
  /*output  */    .io_pins_gpio_pins_25_o_oe(e300_gpio_o_oe[25]), 
  /*output  */    .io_pins_gpio_pins_25_o_ie(e300_gpio_o_ie[25]), 
  /*input   */    .io_pins_gpio_pins_26_i_ival(e300_gpio_i_ival[26]), 
  /*output  */    .io_pins_gpio_pins_26_o_oval(e300_gpio_o_oval[26]), 
  /*output  */    .io_pins_gpio_pins_26_o_oe(e300_gpio_o_oe[26]), 
  /*output  */    .io_pins_gpio_pins_26_o_ie(e300_gpio_o_ie[26]), 
  /*input   */    .io_pins_gpio_pins_27_i_ival(e300_gpio_i_ival[27]), 
  /*output  */    .io_pins_gpio_pins_27_o_oval(e300_gpio_o_oval[27]), 
  /*output  */    .io_pins_gpio_pins_27_o_oe(e300_gpio_o_oe[27]), 
  /*output  */    .io_pins_gpio_pins_27_o_ie(e300_gpio_o_ie[27]), 
  /*input   */    .io_pins_gpio_pins_28_i_ival(e300_gpio_i_ival[28]), 
  /*output  */    .io_pins_gpio_pins_28_o_oval(e300_gpio_o_oval[28]), 
  /*output  */    .io_pins_gpio_pins_28_o_oe(e300_gpio_o_oe[28]), 
  /*output  */    .io_pins_gpio_pins_28_o_ie(e300_gpio_o_ie[28]), 
  /*input   */    .io_pins_gpio_pins_29_i_ival(e300_gpio_i_ival[29]), 
  /*output  */    .io_pins_gpio_pins_29_o_oval(e300_gpio_o_oval[29]), 
  /*output  */    .io_pins_gpio_pins_29_o_oe(e300_gpio_o_oe[29]), 
  /*output  */    .io_pins_gpio_pins_29_o_ie(e300_gpio_o_ie[29]), 
  /*input   */    .io_pins_gpio_pins_30_i_ival(e300_gpio_i_ival[30]), 
  /*output  */    .io_pins_gpio_pins_30_o_oval(e300_gpio_o_oval[30]), 
  /*output  */    .io_pins_gpio_pins_30_o_oe(e300_gpio_o_oe[30]), 
  /*output  */    .io_pins_gpio_pins_30_o_ie(e300_gpio_o_ie[30]), 
  /*input   */    .io_pins_gpio_pins_31_i_ival(e300_gpio_i_ival[31]), 
  /*output  */    .io_pins_gpio_pins_31_o_oval(e300_gpio_o_oval[31]), 
  /*output  */    .io_pins_gpio_pins_31_o_oe(e300_gpio_o_oe[31]), 
  /*output  */    .io_pins_gpio_pins_31_o_ie(e300_gpio_o_ie[31]), 

  /*output  */    .io_pins_qspi_sck_o_oval(qspi_sck), 
  /*output  */    .io_pins_qspi_cs_0_o_oval(qspi_cs_0), 
  /*input   */    .io_pins_qspi_dq_0_i_ival(io_pins_qspi_dq_0_i_ival), 
  /*output  */    .io_pins_qspi_dq_0_o_oval(io_pins_qspi_dq_0_o_oval), 
  /*output  */    .io_pins_qspi_dq_0_o_oe(io_pins_qspi_dq_0_o_oe), 
  /*output  */    .io_pins_qspi_dq_0_o_ie(io_pins_qspi_dq_0_o_ie), 
  /*input   */    .io_pins_qspi_dq_1_i_ival(io_pins_qspi_dq_1_i_ival), 
  /*output  */    .io_pins_qspi_dq_1_o_oval(io_pins_qspi_dq_1_o_oval), 
  /*output  */    .io_pins_qspi_dq_1_o_oe(io_pins_qspi_dq_1_o_oe), 
  /*output  */    .io_pins_qspi_dq_1_o_ie(io_pins_qspi_dq_1_o_ie), 
  /*input   */    .io_pins_qspi_dq_2_i_ival(io_pins_qspi_dq_2_i_ival), 
  /*output  */    .io_pins_qspi_dq_2_o_oval(io_pins_qspi_dq_2_o_oval), 
  /*output  */    .io_pins_qspi_dq_2_o_oe(io_pins_qspi_dq_2_o_oe), 
  /*output  */    .io_pins_qspi_dq_2_o_ie(io_pins_qspi_dq_2_o_ie), 
  /*input   */    .io_pins_qspi_dq_3_i_ival(io_pins_qspi_dq_3_i_ival), 
  /*output  */    .io_pins_qspi_dq_3_o_oval(io_pins_qspi_dq_3_o_oval), 
  /*output  */    .io_pins_qspi_dq_3_o_oe(io_pins_qspi_dq_3_o_oe), 
  /*output  */    .io_pins_qspi_dq_3_o_ie(io_pins_qspi_dq_3_o_ie)

);



endmodule
