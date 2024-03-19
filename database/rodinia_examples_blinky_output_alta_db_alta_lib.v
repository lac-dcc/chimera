

module alta_asmiblock (
    dclkin,
    scein,
    sdoin,
    data0out,
    oe
    );

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_asmiblock";

input dclkin;
input scein;
input sdoin;
input oe;
output data0out;

endmodule  // alta_asmiblock
module alta_asyncctrl(Din, Dout);

parameter AsyncCtrlMux = 2'b10;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_asyncctrl";

input  Din;
output Dout;

endmodule


module alta_boot (
  i_boot,
  im_vector_sel,
  i_osc_enb,
  o_osc,
  devpor,
  devclrn,
  devoe
);

parameter coord_x  = 0;
parameter coord_y  = 0;
parameter coord_z  = 0;
parameter lpm_type = "alta_boot";

input i_boot;
input [1:0] im_vector_sel;
input i_osc_enb;
output o_osc;
input devclrn, devpor, devoe;

endmodule


module alta_bram (
  DataInA,  DataInB,
  AddressA, AddressB,
  DataOutA, DataOutB,
  Clk0, ClkEn0, AsyncReset0,
  Clk1, ClkEn1, AsyncReset1,
  WeRenA, WeRenB,
  devclrn, devpor, devoe
);
input  [17:0]  DataInA,  DataInB;
input  [11:0] AddressA, AddressB;
output [17:0] DataOutA, DataOutB;
input  Clk0, ClkEn0, AsyncReset0;
input  Clk1, ClkEn1, AsyncReset1;
input  WeRenA, WeRenB;
input  devclrn, devpor, devoe;

////parameter coord_x  = 0;
////parameter coord_y  = 0;
////parameter coord_z  = 0;
parameter lpm_type = "alta_bram";

parameter CLKMODE         = 1'b0;
parameter PORTA_WIDTH     = 4'b0000;
parameter PORTB_WIDTH     = 4'b0000;
parameter PORTA_WRITEMODE = 1'b0;
parameter PORTB_WRITEMODE = 1'b0;
parameter PORTA_WRITETHRU = 1'b0;
parameter PORTB_WRITETHRU = 1'b0;
parameter PORTA_OUTREG    = 1'b0;
parameter PORTB_OUTREG    = 1'b0;
parameter PORTB_READONLY  = 1'b0;
parameter INIT_VAL        = 4608'b0;
parameter Clk0CFG         = 2'b0;
parameter Clk1CFG         = 2'b0;

endmodule


module alta_bram9k (
  DataInA,  DataInB,
  AddressA, AddressB,
  ByteEnA,  ByteEnB,
  DataOutA, DataOutB,
  Clk0, ClkEn0, AsyncReset0,
  Clk1, ClkEn1, AsyncReset1,
  WeA, ReA, WeB, ReB,
  AddressStallA, AddressStallB,
  devclrn, devpor, devoe
);
input  [17:0]  DataInA,  DataInB;
input  [12:0] AddressA, AddressB;
input  [ 1:0]  ByteEnA,  ByteEnB;
output [17:0] DataOutA, DataOutB;
input  Clk0, ClkEn0, AsyncReset0;
input  Clk1, ClkEn1, AsyncReset1;
input  WeA, ReA, WeB, ReB;
input  AddressStallA, AddressStallB;
input  devclrn, devpor, devoe;

////parameter coord_x  = 0;
////parameter coord_y  = 0;
////parameter coord_z  = 0;
parameter lpm_type = "alta_bram9k";

parameter CLKMODE         = 2'b0;
parameter PACKEDMODE      = 1'b0;
parameter PORTA_WIDTH     = 5'b0000;
parameter PORTB_WIDTH     = 5'b0000;
parameter PORTA_WRITETHRU = 1'b0;
parameter PORTB_WRITETHRU = 1'b0;
parameter PORTA_CLKIN_EN  = 1'b0;
parameter PORTA_CLKOUT_EN = 1'b0;
parameter PORTB_CLKIN_EN  = 1'b0;
parameter PORTB_CLKOUT_EN = 1'b0;
parameter PORTA_RSTIN_EN  = 1'b0;
parameter PORTA_RSTOUT_EN = 1'b0;
parameter PORTB_RSTIN_EN  = 1'b0;
parameter PORTB_RSTOUT_EN = 1'b0;
parameter PORTA_OUTREG    = 1'b0;
parameter PORTB_OUTREG    = 1'b0;
parameter INIT_VAL        = 9216'b0;
parameter RSEN_DLY        = 2'b0;
parameter DLYTIME         = 2'b0;
parameter Clk0CFG         = 2'b0;
parameter Clk1CFG         = 2'b0;

endmodule


module alta_clk_delay_ctrl (
    clk, 
    delayctrlin, 
    disablecalibration,
    pllcalibrateclkdelayedin,
    devpor, 
    devclrn, 
    clkout
    );
   
//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_clk_delay_ctrl";

parameter behavioral_sim_delay = 0;
parameter delay_chain          = "54";  // or "1362ps"
parameter delay_chain_mode     = "static";
parameter uses_calibration     = "false";
parameter use_new_style_dq_detection  = "false";
parameter tan_delay_under_delay_ctrl_signal = "unused";
parameter delay_ctrl_sim_delay_15_0  = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_31_16 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_47_32 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_63_48 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

input clk; 
input [5:0] delayctrlin; 
input disablecalibration;
input pllcalibrateclkdelayedin;
input devpor; 
input devclrn; 
output clkout;
   
endmodule

module alta_clkctrl(
    inclk, 
    clkselect, 
    ena, 
    devpor, 
    devclrn, 
    outclk
    );
   
//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_clkctrl";

parameter clock_type = "auto";
parameter ena_register_mode = "falling edge";

input [3:0] inclk;
input [1:0] clkselect;
input ena; 
input devpor; 
input devclrn; 
output outclk;

endmodule


module alta_clkenctrl(ClkIn, ClkEn, ClkOut);

parameter ClkMux = 2'b10;
parameter ClkEnMux = 2'b10;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_clkenctrl";

input ClkIn, ClkEn;
output ClkOut;

endmodule


module alta_crcblock (
    clk,
    shiftnld,
    ldsrc,
    crcerror,
    regout
    );

input clk;
input shiftnld;
input ldsrc;
output crcerror;
output regout;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_crcblock";

parameter oscillator_divider = 1;

endmodule

module alta_dio (
  padio, datain, datainh, oe, outclk, outclkena, inclk, inclkena, areset, sreset, combout, regout,
  devclrn, devpor, devoe, differentialin, differentialout, linkin, linkout
);

inout  padio;
input  datain, datainh, oe, outclk, outclkena, inclk, inclkena, areset, sreset;
output combout, regout;
input  devclrn, devpor, devoe;
input  linkin;
input  differentialin;
output differentialout;
output linkout;

parameter lpm_type = "alta_dio";

parameter IN_ASYNC_MODE     = 1'b0;
parameter IN_SYNC_MODE      = 1'b0;
parameter IN_POWERUP        = 1'b0;
parameter IN_ASYNC_DISABLE  = 1'b0;
parameter IN_SYNC_DISABLE   = 1'b0;
parameter OUT_REG_MODE      = 1'b0;
parameter OUT_ASYNC_MODE    = 1'b0;
parameter OUT_SYNC_MODE     = 1'b0;
parameter OUT_POWERUP       = 1'b0;
parameter OUT_CLKEN_DISABLE = 1'b0;
parameter OUT_ASYNC_DISABLE = 1'b0;
parameter OUT_SYNC_DISABLE  = 1'b0;
parameter OUT_DDIO          = 1'b0;
parameter OE_REG_MODE       = 1'b0;
parameter OE_ASYNC_MODE     = 1'b0;
parameter OE_SYNC_MODE      = 1'b0;
parameter OE_POWERUP        = 1'b0;
parameter OE_CLKEN_DISABLE  = 1'b0;
parameter OE_ASYNC_DISABLE  = 1'b0;
parameter OE_SYNC_DISABLE   = 1'b0;
parameter OE_DDIO           = 1'b0;
parameter inclkCFG          = 2'b0;
parameter outclkCFG         = 2'b0;

parameter CFG_TRI_INPUT     = 1'b0;
parameter CFG_PULL_UP       = 1'b0;
parameter CFG_OPEN_DRAIN    = 1'b0;
parameter CFG_ROCT_CAL_EN   = 1'b0;
parameter CFG_PDRV          = 7'b0010000;
parameter CFG_NDRV          = 7'b0010000;
parameter CFG_KEEP          = 2'b0;
parameter CFG_LVDS_OUT_EN   = 1'b0;
parameter CFG_LVDS_SEL_CUA  = 3'b0;
parameter CFG_LVDS_IREF     = 10'b0110000000;
parameter CFG_LVDS_IN_EN    = 1'b0;
parameter CFG_SSTL_OUT_EN   = 1'b0;
parameter CFG_SSTL_INPUT_EN = 1'b0;
parameter CFG_SSTL_SEL_CUA  = 3'b011;
parameter CFG_OSCDIV        = 2'b0;
parameter CFG_ROCTUSR       = 1'b0;
parameter CFG_SEL_CUA       = 1'b0;
parameter CFG_ROCT_EN       = 1'b0;

parameter OUT_DELAY      = 1'b0;
parameter IN_DATA_DELAY  = 3'b0;
parameter IN_REG_DELAY   = 3'b0;
parameter DPCLK_DELAY    = 4'b0;

endmodule

module alta_dpclkdel(clkin, clkout);
input  clkin;
output clkout;
endmodule

module alta_gclkgen(clkin, ena, clkout);
input  clkin, ena;
output clkout;
parameter ena_reg_mode = 1'b0;
endmodule

module alta_gclkgen2(clkin, ena, mode, clkout);
input  clkin, ena, mode;
output clkout;

endmodule

module alta_gclksel(clkin, select, clkout);
input  [3:0] clkin;
input  [1:0] select;
output clkout;
endmodule

module alta_i2c (
  Clk, Rst,
  WrRdn, Strobe,
  Sdai, Scli,
  DataIn, Address,
  Wakeup, Irq, Ack,
  Sdao, Sclo,
  DataOut,
  devpor,
  devclrn,
  devoe
);
input Clk, Rst;
input WrRdn, Strobe;
input Sdai, Scli;
input [7:0] DataIn;
input [7:0] Address;
output Wakeup, Irq, Ack;
output Sdao, Sclo;
output [7:0] DataOut;
input devclrn, devpor, devoe;

parameter lpm_type = "alta_i2c";
parameter SLOT_ID = 4'b0000;
parameter ClkCFG  = 2'b0;

endmodule


module alta_io (
    datain, oe,
    outclk, outclkena, inclk, inclkena, areset, sreset,
    devclrn, devpor, devoe,
    linkin,
    differentialin,
    differentialout,
    padio,
    combout, regout,
    linkout
    );

parameter PRG_DELAYB = "1'bx";
parameter RX_SEL     = "1'bx";
parameter PDCNTL     = "2'bxx";
parameter NDCNTL     = "2'bxx";
parameter PRG_SLR    = "1'bx";
parameter CFG_KEEP   = "2'bxx";
parameter PU         = "4'bxxxx";

parameter PRG_DELAYB_P = "1'bx";
parameter RX_SEL_P     = "1'bx";
parameter PDCNTL_P     = "2'bxx";
parameter NDCNTL_P     = "2'bxx";
parameter PRG_SLR_P    = "1'bx";
parameter CFG_KEEP_P   = "2'bxx";

parameter PRG_DELAYB_N = "1'bx";
parameter RX_SEL_N     = "1'bx";
parameter PDCNTL_N     = "2'bxx";
parameter NDCNTL_N     = "2'bxx";
parameter PRG_SLR_N    = "1'bx";
parameter CFG_KEEP_N   = "2'bxx";

parameter LVDS_RSDS_IREF   = "12'bxxxxxxxxxxxx";
parameter CFG_LVDS_RSDS_EN = "1'bx";

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_io";

parameter operation_mode = "input";
parameter open_drain_output = "false";
parameter bus_hold = "false";

inout	padio;
input	datain, oe;
input	outclk, outclkena, inclk, inclkena, areset, sreset;
input	devclrn, devpor, devoe;
input   linkin;
input	differentialin;
output	differentialout;
output	combout, regout;
output  linkout;

endmodule


module alta_io_gclk(
    inclk, 
    outclk
    );
   
//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_io_gclk";

parameter clock_type = "global clock";
parameter ena_register_mode = "none";

input  inclk;
output outclk;

endmodule

module alta_irda (
  ir_clk, ir_reset,
  cal_en, tia_reset,
  pu_ivref, pu_pga, pu_dac,
  vip, vin,
  irx_data, cal_ready, dac_cal_reg,
  devpor, devclrn, devoe
);
input ir_clk;
input ir_reset;
input cal_en;
input pu_ivref;
input pu_pga;
input pu_dac;
input tia_reset;
input vip;
input vin;
output irx_data;
output cal_ready;
output [7:0] dac_cal_reg;
input devclrn, devpor, devoe;

parameter lpm_type = "alta_irda";
parameter CFG_IRIP_EN         = 1'b1;
parameter CLK_SEL_SYS         = 1'b0;
parameter CLK_DIV_CMP_SYS     = 3'b010;
parameter CLK_DIV_SYS         = 3'b010;
parameter PU_HYSTER_SYS       = 1'b0;
parameter REG_BYPASS_SYS      = 1'b0;
parameter OUTPUT_SEL_SYS      = 1'b0;
parameter CAL_READY_REG_SYS   = 1'b0;
parameter CAL_READY_DR_SYS    = 1'b0;
parameter CAL_TIME_SYS        = 2'b10;
parameter CAL_DELAY_SYS       = 2'b10;
parameter CAL_SPEED_SYS       = 2'b10;
parameter DC_ACC_GAIN_SYS     = 3'b001;
parameter BYPASS_DC_CALC_SYS  = 1'b0;
parameter DC_TIME_SEL_SYS     = 3'b0;
parameter REG_VBIT_SYS        = 2'b01;
parameter RX_CAL_BIT_SYS      = 8'b10000000;
parameter RX_CAL_BIT_DR_SYS   = 1'b0;
parameter RX_DC_POLARITY_SYS  = 1'b0;
parameter RX_CAL_POLARITY_SYS = 1'b0;
parameter DC_GAIN_SYS         = 5'b10000;
parameter DAC_GAIN_SYS        = 2'b01;
parameter DAC_RANGE_SYS       = 2'b01;
parameter PGA_CAP_BIT_SYS     = 4'b1000;
parameter PGA_CAP_EN_SYS      = 1'b0;
parameter PGA_CAL_MODE_SYS    = 1'b0;
parameter PGA_GAIN2_SYS       = 2'b01;
parameter PGA_GAIN_SYS        = 3'b100;
parameter DIFF_EN_SYS         = 1'b0;
parameter TIA_GAIN_SYS        = 2'b01;
parameter BG_SEL_SYS          = 1'b0;

endmodule


module alta_jtag (
    tdouser,
    tmsutap,
    tckutap,
    tdiutap,
    shiftuser,
    clkdruser,
    updateuser,
    runidleuser,
    usr1user
    );

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_jtag";

input tdouser;

output tmsutap;
output tckutap;
output tdiutap;
output shiftuser;
output clkdruser;
output updateuser;
output runidleuser;
output usr1user;

endmodule


module alta_mac_mult(
    dataa, 
    datab,
    signa, 
    signb,
    clk, 
    aclr, 
    ena,
    dataout,
    devclrn,
    devpor
    );
    
//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_mac_mult";

parameter dataa_width   = 18;
parameter datab_width   = 18;
parameter dataa_clock	= "none";
parameter datab_clock	= "none";
parameter signa_clock	= "none"; 
parameter signb_clock	= "none";
parameter lpm_hint      = "true";

input [dataa_width-1:0] dataa;
input [datab_width-1:0] datab;
input signa;
input signb;
input clk;
input aclr;
input ena;
input devclrn;
input devpor;
output [dataa_width+datab_width-1:0]	dataout;
    
endmodule


module alta_mac_out (
    dataa, 
    clk,
    aclr,
    ena,
    dataout,
    devclrn,
    devpor
    );
 
//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_mac_out";

parameter dataa_width   = 36;
parameter lpm_hint      = "true";
parameter output_clock  = "none";

input	[dataa_width-1:0]	dataa;
output	[dataa_width-1:0]	dataout;
input   clk;
input   aclr;
input   ena;
input 	devclrn;
input 	devpor;

endmodule

module alta_mcu (
  CLK,
  JTCK,
  POR_n,
  EXT_CPU_RST_n,
  JTRST_n,
  UART_RXD,
  UART_CTS_n,
  JTDI,
  JTMS,
  EXT_RAM_EN,
  EXT_RAM_WR,
  EXT_RAM_ADDR,
  EXT_RAM_BYTE_EN,
  EXT_RAM_WDATA,
  FLASH_BIAS,
  HRESP_EXT,
  HREADY_OUT_EXT,
  HRDATA_EXT,
  HTRANS_EXT,
  HADDR_EXT,
  HWRITE_EXT,
  HSEL_EXT,
  HWDATA_EXT,
  HSIZE_EXT,
  HREADY_IN_EXT,
  FLASH_SCK,
  FLASH_CS_n,
  UART_TXD,
  UART_RTS_n,
  JTDO,
  EXT_RAM_RDATA,
  FLASH_IO0_SI,
  FLASH_IO1_SO,
  FLASH_IO2_WPn,
  FLASH_IO3_HOLDn,
  FLASH_IO0_SI_i,
  FLASH_IO1_SO_i,
  FLASH_IO2_WPn_i,
  FLASH_IO3_HOLDn_i,
  FLASH_SI_OE,
  FLASH_SO_OE,
  WPn_IO2_OE,
  HOLDn_IO3_OE,
  GPIO0_I,
  GPIO1_I,
  GPIO2_I,
  GPIO0_O,
  GPIO1_O,
  GPIO2_O,
  nGPEN0,
  nGPEN1,
  nGPEN2,
  devpor,
  devclrn,
  devoe
);
input CLK;
input JTCK;
input POR_n;
input EXT_CPU_RST_n;
input JTRST_n;
input UART_RXD;
input UART_CTS_n;
input JTDI;
input JTMS;
input EXT_RAM_EN;
input EXT_RAM_WR;
input [13:0] EXT_RAM_ADDR;
input [3:0] EXT_RAM_BYTE_EN;
input [31:0] EXT_RAM_WDATA;
input [23:0] FLASH_BIAS;
input [1:0] HRESP_EXT;
input HREADY_OUT_EXT;
input [31:0] HRDATA_EXT;
output [1:0] HTRANS_EXT;
output [31:0] HADDR_EXT;
output HWRITE_EXT;
output HSEL_EXT;
output [31:0] HWDATA_EXT;
output [2:0] HSIZE_EXT;
output HREADY_IN_EXT;
output FLASH_SCK;
output FLASH_CS_n;
output UART_TXD;
output UART_RTS_n;
output JTDO;
output [31:0] EXT_RAM_RDATA;
output FLASH_IO0_SI;
output FLASH_IO1_SO;
output FLASH_IO2_WPn;
output FLASH_IO3_HOLDn;
input  FLASH_IO0_SI_i;
input  FLASH_IO1_SO_i;
input  FLASH_IO2_WPn_i;
input  FLASH_IO3_HOLDn_i;
output FLASH_SI_OE;
output FLASH_SO_OE;
output WPn_IO2_OE;
output HOLDn_IO3_OE;
input [7:0]  GPIO0_I;
input [7:0]  GPIO1_I;
input [7:0]  GPIO2_I;
output [7:0] GPIO0_O;
output [7:0] GPIO1_O;
output [7:0] GPIO2_O;
output [7:0] nGPEN0;
output [7:0] nGPEN1;
output [7:0] nGPEN2;
input  devclrn, devpor, devoe;
parameter CLKCFG = 2'b0;
endmodule

module alta_mcu_m3 (
  CLK,
  JTCK,
  POR_n,
  EXT_CPU_RST_n,
  JTRST_n,
  UART_RXD,
  UART_CTS_n,
  JTDI,
  JTMS,
  SWDO,         
  SWDOEN,         
  EXT_RAM_EN,
  EXT_RAM_WR,
  EXT_RAM_ADDR,
  EXT_RAM_BYTE_EN,
  EXT_RAM_WDATA,
  HRESP_EXT,
  HREADY_OUT_EXT,
  HRDATA_EXT,
  HTRANS_EXT,
  HADDR_EXT,
  HWRITE_EXT,
  HSEL_EXT,
  HWDATA_EXT,
  HSIZE_EXT,
  HREADY_IN_EXT,
  HRESP_EXTM,
  HREADY_OUT_EXTM,
  HRDATA_EXTM,
  HTRANS_EXTM,
  HADDR_EXTM,
  HWRITE_EXTM,
  HSEL_EXTM,
  HWDATA_EXTM,
  HSIZE_EXTM,
  HREADY_IN_EXTM,
  HBURSTM,
  HPROTM,
  FLASH_SCK,
  FLASH_CS_n,
  UART_TXD,
  UART_RTS_n,
  JTDO,
  EXT_RAM_RDATA,
  FLASH_IO0_SI,
  FLASH_IO1_SO,
  FLASH_IO2_WPn,
  FLASH_IO3_HOLDn,
  FLASH_IO0_SI_i,
  FLASH_IO1_SO_i,
  FLASH_IO2_WPn_i,
  FLASH_IO3_HOLDn_i,
  FLASH_SI_OE,
  FLASH_SO_OE,
  WPn_IO2_OE,
  HOLDn_IO3_OE,
  GPIO0_I,
  GPIO1_I,
  GPIO2_I,
  GPIO0_O,
  GPIO1_O,
  GPIO2_O,
  nGPEN0,
  nGPEN1,
  nGPEN2,
  devpor,
  devclrn,
  devoe
);
input CLK;
input JTCK;
input POR_n;
input EXT_CPU_RST_n;
input JTRST_n;
input UART_RXD;
input UART_CTS_n;
input JTDI;
input JTMS;
output SWDO;         
output SWDOEN;         
input EXT_RAM_EN;
input EXT_RAM_WR;
input [14:0] EXT_RAM_ADDR;
input [3:0] EXT_RAM_BYTE_EN;
input [31:0] EXT_RAM_WDATA;
input [1:0] HRESP_EXT;
input HREADY_OUT_EXT;
input [31:0] HRDATA_EXT;
output [1:0] HTRANS_EXT;
output [31:0] HADDR_EXT;
output HWRITE_EXT;
output HSEL_EXT;
output [31:0] HWDATA_EXT;
output [2:0] HSIZE_EXT;
output HREADY_IN_EXT;
output [1:0] HRESP_EXTM;
output HREADY_OUT_EXTM;
output [31:0] HRDATA_EXTM;
input [1:0] HTRANS_EXTM;
input [31:0] HADDR_EXTM;
input HWRITE_EXTM;
input HSEL_EXTM;
input [31:0] HWDATA_EXTM;
input [2:0] HSIZE_EXTM;
input HREADY_IN_EXTM;	
input [2:0]   HBURSTM;
input [3:0]   HPROTM;
output FLASH_SCK;
output FLASH_CS_n;
output UART_TXD;
output UART_RTS_n;
output JTDO;
output [31:0] EXT_RAM_RDATA;
output FLASH_IO0_SI;
output FLASH_IO1_SO;
output FLASH_IO2_WPn;
output FLASH_IO3_HOLDn;
input  FLASH_IO0_SI_i;
input  FLASH_IO1_SO_i;
input  FLASH_IO2_WPn_i;
input  FLASH_IO3_HOLDn_i;
output FLASH_SI_OE;
output FLASH_SO_OE;
output WPn_IO2_OE;
output HOLDn_IO3_OE;
input [7:0]  GPIO0_I;
input [7:0]  GPIO1_I;
input [7:0]  GPIO2_I;
output [7:0] GPIO0_O;
output [7:0] GPIO1_O;
output [7:0] GPIO2_O;
output [7:0] nGPEN0;
output [7:0] nGPEN1;
output [7:0] nGPEN2;
input  devclrn, devpor, devoe;
parameter FLASH_BIAS = 24'b0;
parameter CLK_FREQ   = 8'b0;
parameter BOOT_DELAY = 1'b0;
parameter CLKCFG     = 2'b0;
endmodule

module alta_mult (
  Clk, ClkEn, AsyncReset,
  SignA, SignB,
  DataInA0, DataInB0, DataInA1, DataInB1,
  DataOut0, DataOut1,
  devpor,
  devclrn,
  devoe
);
input  Clk, ClkEn, AsyncReset;
input  SignA, SignB;
input  [8:0] DataInA0, DataInB0, DataInA1, DataInB1;
output [17:0] DataOut0, DataOut1;
input  devclrn, devpor, devoe;

parameter lpm_type = "alta_mult";
parameter MULT_MODE    = 1'b0; // 0: 18x18, 1: 9x9
parameter PORTA_INREG0 = 1'b0;
parameter PORTA_INREG1 = 1'b0;
parameter PORTB_INREG0 = 1'b0;
parameter PORTB_INREG1 = 1'b0;
parameter SIGNA_REG    = 1'b0;
parameter SIGNB_REG    = 1'b0;
parameter OUTREG0      = 1'b0;
parameter OUTREG1      = 1'b0;
parameter ClkCFG       = 2'b0;

endmodule

module alta_multm (
  Clk0, ClkEn0, AsyncReset0,
  Clk1, ClkEn1, AsyncReset1,
  SignA, SignB, SignW,
  InModeA, InModeB, InModeW,
  AddSub0, AddSub1,
  OpMode,
  OutMode,
  DataInA0, DataInA1, DataCinA0, DataCinA1,
  DataInB0, DataInB1, DataCinB0, DataCinB1,
  DataInW0, DataInW1, DataCinW0, DataCinW1,
  DataCoutA0, DataCoutA1,
  DataCoutB0, DataCoutB1,
  DataCoutW0, DataCoutW1,
  DataOutCin0, DataOutCin1,
  DataOutCout0, DataOutCout1,
  DataOut0, DataOut1,
  devpor,
  devclrn,
  devoe
);
input  Clk0, ClkEn0, AsyncReset0;
input  Clk1, ClkEn1, AsyncReset1;
input  SignA, SignB, SignW;
input  InModeA, InModeB, InModeW;
input  AddSub0, AddSub1;
input  [1:0] OpMode;
input  [1:0] OutMode;
input  [8:0] DataInA0, DataInA1, DataCinA0, DataCinA1;
input  [8:0] DataInB0, DataInB1, DataCinB0, DataCinB1;
input  [8:0] DataInW0, DataInW1, DataCinW0, DataCinW1;
output [8:0] DataCoutA0, DataCoutA1;
output [8:0] DataCoutB0, DataCoutB1;
output [8:0] DataCoutW0, DataCoutW1;
input  [35:0] DataOutCin0, DataOutCin1;
output [35:0] DataOutCout0, DataOutCout1;
output [17:0] DataOut0, DataOut1;
input  devclrn, devpor, devoe;

parameter lpm_type = "alta_multm";
parameter MULT_MODE     = 2'b0;
parameter PORTA_ASYNC   = 1'b0;
parameter PORTB_ASYNC   = 1'b0;
parameter PORTW_ASYNC   = 1'b0;
parameter SIGNA_ASYNC   = 1'b0;
parameter SIGNB_ASYNC   = 1'b0;
parameter SIGNW_ASYNC   = 1'b0;
parameter ADDSUB0_ASYNC = 1'b0;
parameter ADDSUB1_ASYNC = 1'b0;
parameter OPMODE_ASYNC  = 1'b0;
parameter MULTA_ASYNC   = 1'b0;
parameter MULTB_ASYNC   = 1'b0;
parameter ACCUA_ASYNC   = 1'b0;
parameter ACCUB_ASYNC   = 1'b0;
parameter OUT0_ASYNC    = 1'b0;
parameter OUT1_ASYNC    = 1'b0;
parameter PORTA0_CLK    = 2'b0;
parameter PORTA1_CLK    = 2'b0;
parameter PORTB0_CLK    = 2'b0;
parameter PORTB1_CLK    = 2'b0;
parameter PORTW0_CLK    = 2'b0;
parameter PORTW1_CLK    = 2'b0;
parameter SIGNA_CLK     = 2'b0;
parameter SIGNB_CLK     = 2'b0;
parameter SIGNW_CLK     = 2'b0;
parameter ADDSUB0_CLK   = 2'b0;
parameter ADDSUB1_CLK   = 2'b0;
parameter OPMODE_CLK    = 2'b0;
parameter MULTA_CLK     = 2'b0;
parameter MULTB_CLK     = 2'b0;
parameter ACCUA_CLK     = 2'b0;
parameter ACCUB_CLK     = 2'b0;
parameter OUT0_CLK      = 2'b0;
parameter OUT1_CLK      = 2'b0;
parameter Clk0CFG       = 2'b0;
parameter Clk1CFG       = 2'b0;

endmodule

module alta_oct (
  clkusr, rstnusr,
  octdone, octdoneuser,
  rupcompout, rdncompout,
  rupoctcalnout, rdnoctcalnout
);
input  clkusr, rstnusr;
output octdone, octdoneuser;
output rupcompout, rdncompout;
output rupoctcalnout, rdnoctcalnout;

parameter OCT_CLKDIV = 2'b00;
parameter OCT_EN     = 1'b0;
parameter OCT_USR    = 1'b0;

endmodule

module alta_osc (
  i_osc_enb, o_osc,
  devpor, devclrn, devoe
);
input  i_osc_enb;
output o_osc;
input  devclrn, devpor, devoe;
endmodule


module alta_pll (
  clkin,
  clkfb,
  pllen,
  resetn,
  pfden,
  clkout0,
  clkout1,
  lock,
  devpor,
  devclrn,
  devoe
);

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_pll";

parameter CLKIN_DIV     = 6'h1;
parameter CLKFB_DIV     = 6'h1;
parameter CLKOUT0_DIV   = 6'h3f;
parameter CLKOUT1_DIV   = 6'h3f;
parameter CLKOUT0_DEL   = 6'h0;
parameter CLKOUT1_DEL   = 6'h0;
parameter CLKOUT0_PHASE = 3'h0;
parameter CLKOUT1_PHASE = 3'h0;
parameter FEEDBACK_MODE = 1'b0;
parameter FEEDBACK_CLOCK = 1'b0;
parameter CLKOUT0_EN    = 1'h1;
parameter CLKOUT1_EN    = 1'h1;
parameter CLKIN_FREQ    = 10;
parameter CLKFB_FREQ    = 10;
parameter CLKOUT0_FREQ  = 10;
parameter CLKOUT1_FREQ  = 10;

input clkin, clkfb;
input pllen, resetn, pfden;
output clkout0, clkout1;
output lock;
input devclrn, devpor, devoe;

endmodule

module alta_pllv (
  clkin, clkfb,
  pllen, resetn,
  clkout0en, clkout1en, clkout2en, clkout3en, clkout4en,
  clkout0, clkout1, clkout2, clkout3, clkout4,
  clkfbout, lock,
  devpor, devclrn, devoe
);
input  clkin;
input  clkfb;
input  pllen;
input  resetn;
input  clkout0en;
input  clkout1en;
input  clkout2en;
input  clkout3en;
input  clkout4en;
output clkout0;
output clkout1;
output clkout2;
output clkout3;
output clkout4;
output clkfbout;
output lock;
input devpor, devclrn, devoe;

parameter CLKIN_DIV       = 9'b0;
parameter CLKFB_DIV       = 9'b0;
parameter CLKDIV0_EN      = 1'b0;
parameter CLKDIV1_EN      = 1'b0;
parameter CLKDIV2_EN      = 1'b0;
parameter CLKDIV3_EN      = 1'b0;
parameter CLKDIV4_EN      = 1'b0;
parameter CLKOUT0_HIGH    = 8'b0;
parameter CLKOUT0_LOW     = 8'b0;
parameter CLKOUT0_TRIM    = 1'b0;
parameter CLKOUT0_BYPASS  = 1'b0;
parameter CLKOUT1_HIGH    = 8'b0;
parameter CLKOUT1_LOW     = 8'b0;
parameter CLKOUT1_TRIM    = 1'b0;
parameter CLKOUT1_BYPASS  = 1'b0;
parameter CLKOUT2_HIGH    = 8'b0;
parameter CLKOUT2_LOW     = 8'b0;
parameter CLKOUT2_TRIM    = 1'b0;
parameter CLKOUT2_BYPASS  = 1'b0;
parameter CLKOUT3_HIGH    = 8'b0;
parameter CLKOUT3_LOW     = 8'b0;
parameter CLKOUT3_TRIM    = 1'b0;
parameter CLKOUT3_BYPASS  = 1'b0;
parameter CLKOUT4_HIGH    = 8'b0;
parameter CLKOUT4_LOW     = 8'b0;
parameter CLKOUT4_TRIM    = 1'b0;
parameter CLKOUT4_BYPASS  = 1'b0;
parameter CLKOUT0_DEL     = 8'b0;
parameter CLKOUT1_DEL     = 8'b0;
parameter CLKOUT2_DEL     = 8'b0;
parameter CLKOUT3_DEL     = 8'b0;
parameter CLKOUT4_DEL     = 8'b0;
parameter CLKOUT0_PHASE   = 3'b0;
parameter CLKOUT1_PHASE   = 3'b0;
parameter CLKOUT2_PHASE   = 3'b0;
parameter CLKOUT3_PHASE   = 3'b0;
parameter CLKOUT4_PHASE   = 3'b0;
parameter CLKFB_DEL       = 8'b0;
parameter CLKFB_PHASE     = 3'b0;
parameter CLKFB_TRIM      = 1'b0;
parameter FEEDBACK_MODE   = 3'b0;
parameter FBDELAY_VAL     = 3'b0;
parameter PLLOUTP_EN      = 1'b0;
parameter PLLOUTN_EN      = 1'b0;
parameter CLKOUT1_CASCADE = 1'b0;
parameter CLKOUT2_CASCADE = 1'b0;
parameter CLKOUT3_CASCADE = 1'b0;
parameter CLKOUT4_CASCADE = 1'b0;
parameter CP              = 3'b111;
parameter RREF            = 2'b00;
parameter RVI             = 2'b00;

endmodule

module alta_pllve (
  clkin, clkfb,
  pfden, resetn,
  phasecounterselect,
  phaseupdown, phasestep,
  scanclk, scanclkena, scandata, configupdate,
  scandataout, scandone, phasedone,
  clkout0, clkout1, clkout2, clkout3, clkout4,
  clkfbout, lock,
  devpor, devclrn, devoe
);
input  clkin;
input  clkfb;
input  pfden;
input  resetn;
input  [2:0] phasecounterselect;
input  phaseupdown, phasestep;
input  scanclk, scanclkena, scandata, configupdate;
output scandataout, scandone, phasedone;
output clkout0;
output clkout1;
output clkout2;
output clkout3;
output clkout4;
output clkfbout;
output lock;
input devpor, devclrn, devoe;

parameter CLKIN_HIGH      = 8'b0;
parameter CLKIN_LOW       = 8'b0;
parameter CLKIN_TRIM      = 1'b0;
parameter CLKIN_BYPASS    = 1'b0;
parameter CLKFB_HIGH      = 8'b0;
parameter CLKFB_LOW       = 8'b0;
parameter CLKFB_TRIM      = 1'b0;
parameter CLKFB_BYPASS    = 1'b0;
parameter CLKDIV0_EN      = 1'b0;
parameter CLKDIV1_EN      = 1'b0;
parameter CLKDIV2_EN      = 1'b0;
parameter CLKDIV3_EN      = 1'b0;
parameter CLKDIV4_EN      = 1'b0;
parameter CLKOUT0_HIGH    = 8'b0;
parameter CLKOUT0_LOW     = 8'b0;
parameter CLKOUT0_TRIM    = 1'b0;
parameter CLKOUT0_BYPASS  = 1'b0;
parameter CLKOUT1_HIGH    = 8'b0;
parameter CLKOUT1_LOW     = 8'b0;
parameter CLKOUT1_TRIM    = 1'b0;
parameter CLKOUT1_BYPASS  = 1'b0;
parameter CLKOUT2_HIGH    = 8'b0;
parameter CLKOUT2_LOW     = 8'b0;
parameter CLKOUT2_TRIM    = 1'b0;
parameter CLKOUT2_BYPASS  = 1'b0;
parameter CLKOUT3_HIGH    = 8'b0;
parameter CLKOUT3_LOW     = 8'b0;
parameter CLKOUT3_TRIM    = 1'b0;
parameter CLKOUT3_BYPASS  = 1'b0;
parameter CLKOUT4_HIGH    = 8'b0;
parameter CLKOUT4_LOW     = 8'b0;
parameter CLKOUT4_TRIM    = 1'b0;
parameter CLKOUT4_BYPASS  = 1'b0;
parameter CLKOUT0_DEL     = 8'b0;
parameter CLKOUT1_DEL     = 8'b0;
parameter CLKOUT2_DEL     = 8'b0;
parameter CLKOUT3_DEL     = 8'b0;
parameter CLKOUT4_DEL     = 8'b0;
parameter CLKOUT0_PHASE   = 3'b0;
parameter CLKOUT1_PHASE   = 3'b0;
parameter CLKOUT2_PHASE   = 3'b0;
parameter CLKOUT3_PHASE   = 3'b0;
parameter CLKOUT4_PHASE   = 3'b0;
parameter CLKFB_DEL       = 8'b0;
parameter CLKFB_PHASE     = 3'b0;
parameter FEEDBACK_MODE   = 3'b0;
parameter FBDELAY_VAL     = 3'b0;
parameter PLLOUTP_EN      = 1'b0;
parameter PLLOUTN_EN      = 1'b0;
parameter CLKOUT1_CASCADE = 1'b0;
parameter CLKOUT2_CASCADE = 1'b0;
parameter CLKOUT3_CASCADE = 1'b0;
parameter CLKOUT4_CASCADE = 1'b0;
parameter VCO_POST_DIV    = 1'b0;
parameter REG_CTRL        = 2'b10;
parameter CP              = 3'b010;
parameter RREF            = 2'b01;
parameter RVI             = 2'b01;

endmodule


module alta_pllx (
  clkin,
  clkfb,
  pllen,
  resetn,
  clkout0en,
  clkout1en,
  clkout2en,
  clkout3en,
  clkout0,
  clkout1,
  clkout2,
  clkout3,
  lock,
  devpor,
  devclrn,
  devoe
);

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_pllx";

parameter CLKIN_DIV     = 6'h1;
parameter CLKFB_DIV     = 6'h1;
parameter CLKDIV0_EN     = 1'b0;
parameter CLKDIV1_EN     = 1'b0;
parameter CLKDIV2_EN     = 1'b0;
parameter CLKDIV3_EN     = 1'b0;
parameter CLKOUT0_DIV   = 6'h3f;
parameter CLKOUT1_DIV   = 6'h3f;
parameter CLKOUT2_DIV   = 6'h3f;
parameter CLKOUT3_DIV   = 6'h3f;
parameter CLKOUT0_DEL   = 6'h0;
parameter CLKOUT1_DEL   = 6'h0;
parameter CLKOUT2_DEL   = 6'h0;
parameter CLKOUT3_DEL   = 6'h0;
parameter CLKOUT0_PHASE = 3'h0;
parameter CLKOUT1_PHASE = 3'h0;
parameter CLKOUT2_PHASE = 3'h0;
parameter CLKOUT3_PHASE = 3'h0;
parameter FEEDBACK_MODE = 1'b0;
parameter FEEDBACK_CLOCK = 2'b0;
parameter CLKIN_FREQ    = 10;
parameter CLKFB_FREQ    = 10;
parameter CLKOUT0_FREQ  = 10;
parameter CLKOUT1_FREQ  = 10;
parameter CLKOUT2_FREQ  = 10;
parameter CLKOUT3_FREQ  = 10;

input clkin, clkfb;
input pllen, resetn;
input clkout0en, clkout1en, clkout2en, clkout3en;
output clkout0, clkout1, clkout2, clkout3;
output lock;
input devclrn, devpor, devoe;

endmodule


module alta_ram_block (
     portadatain,
     portaaddr,
     portawe,
     portbdatain,
     portbaddr,
     portbrewe,
     clk0, clk1,
     ena0, ena1,
     clr0, clr1,
     portabyteenamasks,
     portbbyteenamasks,
     portaaddrstall,
     portbaddrstall,
     devclrn,
     devpor,
     portadataout,
     portbdataout
     );

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_ram_block";

parameter operation_mode = "single_port";
parameter mixed_port_feed_through_mode = "dont_care";
parameter ram_block_type = "auto";
parameter logical_ram_name = "ram_name";

parameter init_file = "init_file.hex";
parameter init_file_layout = "none";

parameter data_interleave_width_in_bits = 1;
parameter data_interleave_offset_in_bits = 1;
parameter port_a_logical_ram_depth = 0;
parameter port_a_logical_ram_width = 0;
parameter port_a_first_address = 0;
parameter port_a_last_address = 0;
parameter port_a_first_bit_number = 0;

parameter port_a_data_out_clear = "none";

parameter port_a_data_out_clock = "none";

parameter port_a_data_width = 64;
parameter port_a_address_width = 32;
parameter port_a_byte_enable_mask_width = 8;

parameter port_b_logical_ram_depth = 0;
parameter port_b_logical_ram_width = 0;
parameter port_b_first_address = 0;
parameter port_b_last_address = 0;
parameter port_b_first_bit_number = 0;

parameter port_b_data_in_clear = "none";
parameter port_b_address_clear = "none";
parameter port_b_read_enable_write_enable_clear = "none";
parameter port_b_byte_enable_clear = "none";
parameter port_b_data_out_clear = "none";

parameter port_b_data_in_clock = "clock1";
parameter port_b_address_clock = "clock1";
parameter port_b_read_enable_write_enable_clock = "clock1";
parameter port_b_byte_enable_clock = "clock1";
parameter port_b_data_out_clock = "none";

parameter port_b_data_width = 64;
parameter port_b_address_width = 32;
parameter port_b_byte_enable_mask_width = 8;

parameter power_up_uninitialized = "false";
parameter lpm_hint = "true";
parameter connectivity_checking = "off";

parameter mem_init0 = 2048'b0;
parameter mem_init1 = 2560'b0;

parameter port_a_byte_size = 0;
parameter port_a_disable_ce_on_input_registers = "off";
parameter port_a_disable_ce_on_output_registers = "off";
parameter port_b_byte_size = 0;
parameter port_b_disable_ce_on_input_registers = "off";
parameter port_b_disable_ce_on_output_registers = "off";
parameter safe_write = "err_on_2clk";
parameter init_file_restructured = "unused";

parameter port_a_data_in_clear = "none";
parameter port_a_address_clear = "none";
parameter port_a_write_enable_clear = "none";
parameter port_a_byte_enable_clear = "none";

parameter port_a_data_in_clock = "clock0";
parameter port_a_address_clock = "clock0";
parameter port_a_write_enable_clock = "clock0";
parameter port_a_byte_enable_clock = "clock0";

input portawe;
input [port_a_data_width - 1:0] portadatain;
input [port_a_address_width - 1:0] portaaddr;
input [port_a_byte_enable_mask_width - 1:0] portabyteenamasks;

input portbrewe;
input [port_b_data_width - 1:0] portbdatain;
input [port_b_address_width - 1:0] portbaddr;
input [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks;

input clr0,clr1;
input clk0,clk1;
input ena0,ena1;

input devclrn,devpor;
input portaaddrstall;
input portbaddrstall;
output [port_a_data_width - 1:0] portadataout;
output [port_b_data_width - 1:0] portbdataout;

endmodule

module alta_remote (
  clk, shift, update, din, reconfig, dout,
  devpor, devclrn, devoe
);
input  clk, shift, update, din, reconfig;
output dout;
input  devclrn, devpor, devoe;
endmodule

module alta_rio (
  padio, datain, oe, outclk, outclkena, inclk, inclkena, areset, sreset, combout, regout,
  devclrn, devpor, devoe, differentialin, differentialout, linkin, linkout
);

inout  padio;
input  datain, oe, outclk, outclkena, inclk, inclkena, areset, sreset;
output combout, regout;
input  devclrn, devpor, devoe;
input  linkin;
input  differentialin;
output differentialout;
output linkout;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_rio";

parameter IN_ASYNC_MODE  = 1'b0;
parameter IN_SYNC_MODE   = 1'b0;
parameter IN_POWERUP     = 1'b0;
parameter OUT_REG_MODE   = 1'b0;
parameter OUT_ASYNC_MODE = 1'b0;
parameter OUT_SYNC_MODE  = 1'b0;
parameter OUT_POWERUP    = 1'b0;
parameter OE_REG_MODE    = 1'b0;
parameter OE_ASYNC_MODE  = 1'b0;
parameter OE_SYNC_MODE   = 1'b0;
parameter OE_POWERUP     = 1'b0;
parameter inclkCFG       = 2'b0;
parameter outclkCFG      = 2'b0;

parameter CFG_TRI_INPUT    = 1'b0;
parameter CFG_PULL_UP      = 1'b0;
parameter CFG_SLR          = 1'b0;
parameter CFG_OPEN_DRAIN   = 1'b0;
parameter CFG_PDRCTRL      = 4'b0010;
parameter CFG_KEEP         = 2'b0;
parameter CFG_LVDS_OUT_EN  = 1'b0;
parameter CFG_LVDS_SEL_CUA = 2'b0;
parameter CFG_LVDS_IREF    = 10'b0110000000;
parameter CFG_LVDS_IN_EN   = 1'b0;

parameter OUT_DELAY      = 1'b0;
parameter IN_DATA_DELAY  = 3'b0;
parameter IN_REG_DELAY   = 3'b0;
parameter DPCLK_DELAY    = 4'b0;

endmodule

module alta_saradc (
  adcenb, sclk, insel, refsel,
  divvi8, bgenb, refin, ain,
  db, eoc,
  devpor, devclrn, devoe
);
input  devclrn, devpor, devoe;
input  adcenb, sclk;
input  [3:0] insel;
input  refsel, refin, divvi8, bgenb;
input  [8:0] ain;
output eoc;
output [11:0] db;

parameter sclkCFG = 2'b0;

endmodule


module alta_slice(
    A, B, C, D, Cin, Qin,
    Clk, AsyncReset, SyncReset, ShiftData, SyncLoad,
    LutOut, Cout, Q
    );

// The following 10 bits are actually in LB, will be propagated to each slice by packer for software 
// purpose only. 00: gnd, 01: vcc, 10: signal, 11: !signal
parameter ClkMux = 2'b10;
parameter AsyncResetMux = 2'b10;
parameter SyncResetMux = 2'b10;
parameter SyncLoadMux = 2'b10;
// These control bits are within each slice
parameter mode = "logic";
parameter modeMux = 1'b0; // Duplicat of mode
parameter FeedbackMux = 1'b0;
parameter ShiftMux = 1'b0;
parameter BypassEn = 1'b0;
parameter CarryEnb = 1'b0;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_slice";

parameter mask = 16'hFFFF;

input A, B, C, D, Cin, Qin;
input Clk, AsyncReset, SyncReset, ShiftData, SyncLoad;
output Cout, LutOut, Q;

endmodule

module alta_spi (
  Clk, Rst,
  WrRdn, Strobe,
  DataIn, Address,
  Mi, Si, Scki, Csi,
  Wakeup, Irq, Ack,
  So, Soe, Mo, Moe, Scko, Sckoe,
  Cso, Csoe,
  DataOut,
  devpor,
  devclrn,
  devoe
);
input Clk, Rst;
input WrRdn, Strobe;
input [7:0] DataIn;
input [7:0] Address;
input Mi, Si, Scki, Csi;
output Wakeup, Irq, Ack;
output So, Soe, Mo, Moe, Scko, Sckoe;
output [3:0] Cso;
output [3:0] Csoe;
output [7:0] DataOut;
input devclrn, devpor, devoe;

parameter lpm_type = "alta_spi";
parameter SLOT_ID = 4'b0000;
parameter ClkCFG  = 2'b0;

endmodule


module alta_sram(
  WEna,
  WClk,
  Din,
  WAddr,
  RAddr,
  Dout,
  devpor,
  devclrn,
  devoe
);

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_sram";

parameter INIT_VAL = 64'h0;

input WEna, WClk;
input [3:0] Din;
input [3:0] WAddr;
input [3:0] RAddr;
output [3:0] Dout;
input devclrn, devpor, devoe;

endmodule


module alta_syncctrl(Din, Dout);

parameter SyncCtrlMux = 2'b10;

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_syncctrl";

input  Din;
output Dout;

endmodule


module alta_ufm (
    i_ufm_set,
    i_program,
    i_erase,
    i_osc_ena,
    i_arclk,
    i_arshift,
    i_ardin,
    i_drdin,
    i_drclk,
    i_drshift,
    i_tdo_u,
    o_tdi_u,
    o_tms_u,
    o_tck_u,
    o_shift_u,
    o_update_u,
    o_runidle_u,
    o_rtp_busy,
    o_ufm_busy,
    o_osc,
    o_drdout,
    o_user1_valid,
    o_user0_valid
    );

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_ufm";

input  i_ufm_set                      ;//1: ufm is instantiated by user 0:not    
input  i_program                      ;//Signal that initiates a program sequence
input  i_erase                        ;//Signal that initiates an erase sequence
input  i_osc_ena                      ;//This signal turns on the internal oscillator in the UFM block, and is optional but required when the OSC output is used.
input  i_arclk                        ;//Clock input that controls the address register
input  i_arshift                      ;//Signal that determines whether to shift the address register or increment it on an ARCLK edge.
input  i_ardin                        ;//Serial input to the address register
input  i_drdin                        ;//Serial input to the data register. It is used to enter a data word when writing to the UFM.
input  i_drclk                        ;//Clock input that controls the data register                                                   
input  i_drshift                      ;//Signal that determines whether to shift the data register or load it on a DRCLK edge.
input  i_tdo_u                        ;
output o_tdi_u                        ;
output o_tms_u                        ;
output o_tck_u                        ;
output o_shift_u                      ;
output o_update_u                     ;
output o_runidle_u                    ;
output o_rtp_busy                     ;//This output signal is optional and only needed if the real-time ISP feature is used.
output o_ufm_busy                     ;//Signal that indicates when the memory is BUSY performing a PROGRAM or ERASE instruction.
output o_osc                          ;//Output of the internal oscillator.
output o_drdout                       ;//Serial output of the data register.
output o_user1_valid                  ;
output o_user0_valid                  ;

endmodule


module alta_ufm_gddd(in, out);

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_ufm_gddd";

input  in;
output out;

endmodule

module alta_ufml (
  ufm_csn, ufm_sck, ufm_sdi, ufm_sdo,
  devpor, devclrn, devoe
);
input  ufm_csn, ufm_sck, ufm_sdi;
output ufm_sdo;
input  devclrn, devpor, devoe;
endmodule


module alta_ufms (
    i_ufm_set,
    i_osc_ena,
    i_ufm_flash_csn,
    i_ufm_flash_sclk,
    i_ufm_flash_sdi,
    o_osc,
    o_ufm_flash_sdo,
    devpor,
    devclrn,
    devoe
    );

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_ufms";

input  i_ufm_set;
input  i_osc_ena;
input  i_ufm_flash_csn;
input  i_ufm_flash_sclk;
input  i_ufm_flash_sdi;
output o_osc;
output o_ufm_flash_sdo;
input	 devclrn, devpor, devoe;

endmodule


module alta_wram(
  WEna,
  WClk,
  Din,
  WAddr,
  RAddr,
  Dout,
  devpor,
  devclrn,
  devoe
);

//parameter coord_x  = 0;
//parameter coord_y  = 0;
//parameter coord_z  = 0;
parameter lpm_type = "alta_wram";

parameter INIT_VAL = 128'h0;

input WEna, WClk;
input [7:0] Din;
input [3:0] WAddr;
input [3:0] RAddr;
output [7:0] Dout;
input devclrn, devpor, devoe;

endmodule

