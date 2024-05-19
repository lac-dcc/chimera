// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

//===============================================================================
// FPGA DONKEY KONG T8035 I/F
//
// Version : 1.01
//
// Copyright(c) 2004 Katsumi Degawa , All rights reserved
//
// Important !
//
// This program is freeware for non-commercial use. 
// An author does no guarantee about this program.
// You can use this under your own risk.
//
// 2004- 9- 2 T48-IP(beta3) was include.  K.Degawa
// 2004- 9- 2 T48 Bug Fix  K.Degawa
// 2004- 9-14 T48-IP was changed to beta4.  K.Degawa
// 2005- 2- 9 It cleaned.
//================================================================================


module I8035IP(

I_CLK,
I_CLK_EN,
I_RSTn,
I_INTn,
I_EA,
O_PSENn,
O_RDn,
O_WRn,
O_ALE,
O_PROGn,
I_T0,
O_T0,
I_T1,
I_DB,
O_DB,
I_P1,
O_P1,
I_P2,
O_P2

);

input  I_CLK;
input  I_CLK_EN;
input  I_RSTn;
input  I_INTn;
input  I_EA;
output O_PSENn;
output O_RDn;
output O_WRn;
output O_ALE;
output O_PROGn;
input  I_T0;
output O_T0;
input  I_T1;
input  [7:0]I_DB;
output [7:0]O_DB;
input  [7:0]I_P1;
output [7:0]O_P1;
input  [7:0]I_P2;
output [7:0]O_P2;

wire   W_PSENn;
assign O_PSENn = W_PSENn ;

//   64 Byte RAM  ------------------------------------------
wire   [7:0]t48_ram_a;
wire   t48_ram_we;
wire   [7:0]t48_ram_do;
wire   [7:0]t48_ram_di;

ram_64_8 t48_ram(

.I_CLK(I_CLK),
.I_ADDR(t48_ram_a[5:0]),
.I_D(t48_ram_di),
.I_CE(1'b1),
.I_WE(t48_ram_we),
.O_D(t48_ram_do)

);

//----------------------------------------------------------

wire   xtal3_s;

t48_core t48_core(

.xtal_i(I_CLK),
.xtal_en_i(I_CLK_EN),
.reset_i(I_RSTn),
.t0_i(I_T0),
.t0_o(O_T0),
.t0_dir_o(),
.int_n_i(I_INTn),
.ea_i(I_EA),
.rd_n_o(O_RDn),
.psen_n_o(W_PSENn),
.wr_n_o(O_WRn),
.ale_o(O_ALE),
.db_i(I_DB),
.db_o(O_DB),
.db_dir_o(),
.t1_i(I_T1),
.p2_i(I_P2),
.p2_o(O_P2),
//.p2_low_imp_o(),
.p1_i(I_P1),
.p1_o(O_P1),
.p1_low_imp_o(),
.prog_n_o(O_PROGn),
.clk_i(I_CLK),
.en_clk_i(xtal3_s),
.xtal3_o(xtal3_s),
.dmem_addr_o(t48_ram_a),
.dmem_we_o(t48_ram_we),
.dmem_data_i(t48_ram_do),
.dmem_data_o(t48_ram_di),
.pmem_addr_o(),
.pmem_data_i(8'h00)

);


endmodule
