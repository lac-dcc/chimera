// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License


`define bsg_iopads_macro \
genvar i;\
\
`BSG_IO_IN (PLL_CLK,`BSG_PAD_INPUT)\
`BSG_IO_IN (reset,  `BSG_PAD_INPUT)\
\
`BSG_IO_IN_ABCD (sdi,sclk,    `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT)\
`BSG_IO_IN_ABCD (sdi,sclk_ex, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT)\
`BSG_IO_IN_ABCD (sdi,ncmd,    `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT)\
\
`BSG_IO_OUT_ABCD(sdi,token, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT)\
`BSG_IO_TIELO_VEC(sdi_token_oen_int,4)\
\
`BSG_IO_OUT_ABCD(sdi,tkn_ex,  `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT)\
\
`BSG_IO_IN_V70 (sdi_A_data, `BSG_PAD_INPUT)\
`BSG_IO_IN_V70 (sdi_B_data, `BSG_PAD_INPUT)\
`BSG_IO_IN_V70 (sdi_C_data, `BSG_PAD_INPUT)\
`BSG_IO_IN_V70 (sdi_D_data, `BSG_PAD_INPUT)\
\
`BSG_IO_OUT_ABCD(sdo,sclk,     `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT)\
`BSG_IO_TIELO_VEC(sdo_sclk_oen_int,4)\
\
`BSG_IO_OUT_ABCD(sdo,sclk_ex,  `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT)\
\
`BSG_IO_OUT_ABCD(sdo,ncmd,     `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT, `BSG_PAD_OUTPUT)\
`BSG_IO_TIELO_VEC(sdo_ncmd_oen_int,4)\
\
`BSG_IO_IN_ABCD (sdo,token,  `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT)\
`BSG_IO_IN_ABCD (sdo,tkn_ex, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT, `BSG_PAD_INPUT)\
\
`BSG_IO_OUT_V70 (sdo_A_data, `BSG_PAD_OUTPUT)\
`BSG_IO_OUT_V70 (sdo_B_data, `BSG_PAD_OUTPUT)\
`BSG_IO_OUT_V70 (sdo_C_data, `BSG_PAD_OUTPUT)\
`BSG_IO_OUT_V70 (sdo_D_data, `BSG_PAD_OUTPUT)\
\
`BSG_IO_TIELO_VEC(sdo_A_data_oen_int,8)\
`BSG_IO_TIELO_VEC(sdo_B_data_oen_int,8)\
`BSG_IO_TIELO_VEC(sdo_C_data_oen_int,8)\
`BSG_IO_TIELO_VEC(sdo_D_data_oen_int,8)\
\
`BSG_IO_IN (misc_L_7, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_L_6, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_L_5, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_L_4, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_L_2, `BSG_PAD_INPUT)\
`BSG_IO_OUT(misc_L_3,`BSG_PAD_OUTPUT)\
\
//`BSG_IO_TIELO(misc_L_3_oen_int)\
\
`BSG_IO_IN (misc_L_1, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_L_0, `BSG_PAD_INPUT)\
\
`BSG_IO_IN (misc_R_7, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_R_6, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_R_5, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_R_4, `BSG_PAD_INPUT)\
`BSG_IO_OUT(misc_R_3,`BSG_PAD_OUTPUT)\
//   `BSG_IO_TIELO(misc_R_3_oen_int)\
\
`BSG_IO_IN (misc_R_2, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_R_1, `BSG_PAD_INPUT)\
`BSG_IO_IN (misc_R_0, `BSG_PAD_INPUT)\
\
// note these are not part of the vector as bit number is in name.\
`BSG_IO_IN (misc_T_0,`BSG_PAD_INPUT)\
`BSG_IO_IN (misc_T_1,`BSG_PAD_INPUT)\
`BSG_IO_IN (misc_T_2,`BSG_PAD_INPUT)\
\
// these can be used as fast i/os\
`BSG_IO_OUT(sdo_A_data_8,`BSG_PAD_OUTPUT)\
`BSG_IO_OUT(sdo_C_data_8,`BSG_PAD_OUTPUT)\
\
//   `BSG_IO_TIELO(sdo_A_data_8_oen_int)\
//   `BSG_IO_TIELO(sdo_C_data_8_oen_int)\
\
// differential pairs\
`BSG_IO_IN_DIFF_DISABLE (clk_0, `BSG_PAD_INPUT)\
`BSG_IO_IN_DIFF_DISABLE (clk_1, `BSG_PAD_INPUT)\
`BSG_IO_IN_DIFF_DISABLE (SMA_in,`BSG_PAD_INPUT)\
\
\
// these are routed as 100 ohms to SMA connector\
// they do not have a differential termination resistor\
// on-board, so they can be driven with normal outputs\
// and used for debug.\
\
`BSG_IO_OUT(SMA_out_p,`BSG_PAD_OUTPUT)\
`BSG_IO_OUT(SMA_out_n,`BSG_PAD_OUTPUT)\
\
// Lutag inputs\
`BSG_IO_IN(JTAG_TMS, `BSG_PAD_INPUT)\
`BSG_IO_IN(JTAG_TDI, `BSG_PAD_INPUT)\
`BSG_IO_IN(JTAG_TCK, `BSG_PAD_INPUT)\
`BSG_IO_IN(JTAG_TRST,`BSG_PAD_INPUT)\
\
// debug output\
`BSG_IO_OUT(JTAG_TDO,`BSG_PAD_OUTPUT)\
