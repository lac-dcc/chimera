// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`include "system_conf.v"

`include "../components/lm32_top/lm32_include.v" // for {IROM,DRAM}_ADDR_WIDTH
`include "../components/lm32_top/lm32_include_all.v"

module superkdf9 ( 
	input wire clk, rst
	,output wire [3:0] led
	,input wire [31:0] interrupt_n
	,output wire [10:0] user_opcode
	,output wire [31:0] user_operand_0
	,output wire [31:0] user_operand_1
	,input wire [31:0] user_result
	,input wire user_complete
	,output wire user_valid
);

`include "../components/lm32_top/lm32_functions.v" // for clogb2_v1

wire [31:0] irom_q_rd, irom_q_wr;
wire [31:0] dram_q_rd, dram_q_wr /* unused */;
wire irom_clk_rd, irom_clk_wr;
wire irom_rst_rd, irom_rst_wr;
wire [31:0] irom_d_rd /* unused */, irom_d_wr;
wire [32-2-1:0] irom_addr_rd, irom_addr_wr;
wire irom_en_rd, irom_en_wr;
wire irom_write_rd, irom_write_wr;
wire dram_clk_rd, dram_clk_wr;
wire dram_rst_rd, dram_rst_wr;
wire [31:0] dram_d_rd /* unused */, dram_d_wr;
wire [32-2-1:0] dram_addr_rd, dram_addr_wr;
wire dram_en_rd, dram_en_wr;
wire dram_write_rd, dram_write_wr;

// IROM {{{
bram #(
	.size(1+`CFG_IROM_LIMIT - `CFG_IROM_BASE_ADDRESS),
	.name("irom")
) irom (
	.ClockA(irom_clk_rd),
	.ClockB(irom_clk_wr),
	.ResetA(irom_rst_rd),
	.ResetB(irom_rst_wr),
	.AddressA(irom_addr_rd),
	.AddressB(irom_addr_wr),
	.DataInA(irom_d_rd), /* unused */
	.DataInB(irom_d_wr),
	.DataOutA(irom_q_rd),
	.DataOutB(irom_q_wr), /* unused */
	.ClockEnA(irom_en_rd),
	.ClockEnB(irom_en_wr),
	.WriteA(irom_write_rd),
	.WriteB(irom_write_wr)
);
// }}}
// DRAM {{{
bram #(
	.size(8192), // only provide necessary
	.name("irom")
) dram (
	.ClockA(dram_clk_rd),
	.ClockB(dram_clk_wr),
	.ResetA(dram_rst_rd),
	.ResetB(dram_rst_wr),
	.AddressA(dram_addr_rd),
	.AddressB(dram_addr_wr),
	.DataInA(dram_d_rd), /* unused */
	.DataInB(dram_d_wr),
	.DataOutA(dram_q_rd),
	.DataOutB(dram_q_wr),
	.ClockEnA(dram_en_rd),
	.ClockEnB(dram_en_wr),
	.WriteA(dram_write_rd),
	.WriteB(dram_write_wr)
);
// }}}

lm32_top superkdf9( 
	// instruction wishbone bus (unused) {{{
	.I_ADR_O(),
	.I_DAT_O(),
	.I_DAT_I(),
	.I_SEL_O(),
	.I_WE_O(),
	.I_ACK_I(),
	.I_ERR_I(),
	.I_RTY_I(),
	.I_CTI_O(),
	.I_BTE_O(),
	.I_LOCK_O(),
	.I_CYC_O(),
	.I_STB_O(), // }}}
	// data wishbone bus (unused) {{{
	.D_ADR_O(),
	.D_DAT_O(),
	.D_DAT_I(),
	.D_SEL_O(),
	.D_WE_O(),
	.D_ACK_I(),
	.D_ERR_I(),
	.D_RTY_I(),
	.D_CTI_O(),
	.D_BTE_O(),
	.D_LOCK_O(),
	.D_CYC_O(),
	.D_STB_O(), // }}}
	.clk_i(clk), .rst_i(rst),
	.interrupt_n(interrupt_n),
	// the exposed IROM {{{
	.irom_clk_rd(irom_clk_rd),
	.irom_clk_wr(irom_clk_wr),
	.irom_rst_rd(irom_rst_rd),
	.irom_rst_wr(irom_rst_wr),
	.irom_d_rd(irom_d_rd), /* unused */
	.irom_d_wr(irom_d_wr),
	.irom_q_rd(irom_q_rd),
	.irom_q_wr(irom_q_wr),
	.irom_addr_rd(irom_addr_rd[`IROM_ADDR_WIDTH-1:0]),
	.irom_addr_wr(irom_addr_wr[`IROM_ADDR_WIDTH-1:0]),
	.irom_en_rd(irom_en_rd),
	.irom_en_wr(irom_en_wr),
	.irom_write_rd(irom_write_rd),
	.irom_write_wr(irom_write_wr), // }}}
	// the exposed DRAM {{{
	.dram_clk_rd(dram_clk_rd),
	.dram_clk_wr(dram_clk_wr),
	.dram_rst_rd(dram_rst_rd),
	.dram_rst_wr(dram_rst_wr),
	.dram_d_rd(dram_d_rd), /* unused */
	.dram_d_wr(dram_d_wr),
	.dram_q_rd(dram_q_rd),
	.dram_q_wr(dram_q_wr), /* unused */
	.dram_addr_rd(dram_addr_rd[`DRAM_ADDR_WIDTH-1:0]),
	.dram_addr_wr(dram_addr_wr[`DRAM_ADDR_WIDTH-1:0]),
	.dram_en_rd(dram_en_rd),
	.dram_en_wr(dram_en_wr),
	.dram_write_rd(dram_write_rd),
	.dram_write_wr(dram_write_wr), // }}}
	// user instruction {{{
	.user_result(user_result),
	.user_complete(user_complete),
	.user_valid(user_valid),
	.user_opcode(user_opcode),
	.user_operand_0(user_operand_0),
	.user_operand_1(user_operand_1) // }}}
);

endmodule
// vim: set fdm=marker : 
