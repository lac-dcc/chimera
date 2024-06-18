// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License


`define bsg_pinout_macro \
// MBT 8-17-2016\
//\
// **********************************************************************\
// UCSD BSG Two Pinout (Based on UCSD BGA 332)\
//\
// This file defines all of the pads that are used for a given pinout of\
// a package. It would change if we reversed the direction of a pad. It\
// is recommended not to change the name of the\
// pin (except the _i or _o) at this level so that we can maintain canonical\
// naming for the package; instead just do an assign of a wire to rename.\
//\
// convention:\
//\
// - the input ports have a prefix of "p_"\
// - the corresponding signals have no prefix\
//   and have a suffix of _int.\
// - the IO pad names are consistent with the\
//   BGA 332 pinout names (e.g, sdi_B_data_7_i, sdi_B_ncmd_i)\
//\
// it is customary to include a macro file ahead of this one;\
// for example bsg_one_iopad_macros_verilog.v\
\
//module\
// bsg_two\
(\
 // *******************************************************************\
 // all "100-ohm impedance-controlled-in-package" differential pairs\
 //\
\
 // unused differential inputs\
 // we give these as outputs, and then go high-impedance\
   output p_clk_0_p_i    , output  p_clk_0_n_i\
 , output  p_clk_1_p_i    , output  p_clk_1_n_i\
\
 // unused differential inputs\
 // we give these as outputs, and then go high-impedance\
 , output  p_SMA_in_p_i   , output p_SMA_in_n_i\
\
 , output p_SMA_out_p_o  , output p_SMA_out_n_o\
\
 // *******************************************************************\
 // ultra-shielded "50-ohm impedance-controlled-in-package" clock for PLL\
 , input   p_PLL_CLK_i\
\
 // *******************************************************************\
 // all "50-ohm impedance-controlled-in-package" signals starting here\
 // these are length matched within 1.55 mm length and\
 // .76 mm bond wire length.\
\
 // input clocks for input channels D,C,B,A\
 , input  [3:0] p_sdi_sclk_i\
\
 // input valids for input channels D,C,B,A\
 , input  [3:0] p_sdi_ncmd_i\
\
 // input datas for input channels D,C,B,A\
 , input  [7:0] p_sdi_A_data_i, input [7:0] p_sdi_B_data_i\
 , input  [7:0] p_sdi_C_data_i, input [7:0] p_sdi_D_data_i\
\
 // output tokens for input channels D,C,B,A\
 , output [3:0] p_sdi_token_o\
\
 // output clocks for output channels D,C,B,A\
 , output [3:0] p_sdo_sclk_o\
\
 // output valids for output channels\
 , output [3:0] p_sdo_ncmd_o\
\
 // output data for out channels\
 , output [7:0] p_sdo_A_data_o, output [7:0] p_sdo_B_data_o\
 , output [7:0] p_sdo_C_data_o, output [7:0] p_sdo_D_data_o\
\
 // extra output datas\
 , output p_sdo_A_data_8_o , output p_sdo_C_data_8_o\
\
 // input tokens for output channels\
 , input  [3:0] p_sdo_token_i\
\
 // spare clocks, length matched to channels\
 , input  [3:0] p_sdi_sclk_ex_i\
 , output [3:0] p_sdo_sclk_ex_o\
\
 // spare tokens for input and output channels\
 , output [3:0] p_sdi_tkn_ex_o\
 , input  [3:0] p_sdo_tkn_ex_i\
\
 // *******************************************************************\
 // all "50-ohm impedance-controlled-in-package", starting here\
 // but are next to clock or token signals\
 // and are not length-matched\
\
 , input  p_misc_T_0_i, input p_misc_T_1_i, input p_misc_T_2_i\
\
 , input  p_misc_L_7_i, input  p_misc_R_7_i\
 , input  p_misc_L_6_i, input  p_misc_R_6_i\
 , input  p_misc_L_5_i, input  p_misc_R_5_i\
 , input  p_misc_L_4_i, input  p_misc_R_4_i\
\
 // L3 and R3 are output pads because it works with the pad ring\
 , output p_misc_L_3_o, output p_misc_R_3_o\
\
 , input  p_misc_L_2_i, input  p_misc_R_2_i\
 , input  p_misc_L_1_i, input  p_misc_R_1_i\
 , input  p_misc_L_0_i, input  p_misc_R_0_i\
\
 , input  p_reset_i\
\
 // for JTAG, or other purposes\
 , input  p_JTAG_TMS_i\
 , input  p_JTAG_TDI_i\
 , input  p_JTAG_TCK_i\
 , input  p_JTAG_TRST_i\
 , output p_JTAG_TDO_o\
\
 // *******************************************************************\
 // all "not impedance controlled in package", starting here\
 // for powering PLL or can be used for low frequency debug signals\
 // NOTE: Driver selected by XTC macro must be updated according to use.\
\
// , input  p_PLL_VDD_i\
// , input  p_PLL_VSS_i\
// , input  p_PLL_V33_i\
// , input  p_PLL_VZZ_i\
 );\
\
// End UCSD BGA 332 PAD Definitions\
// **********************************************************************\
\
`bsg_iopads_macro\
// `include "bsg_iopads_physical_only.v"\

