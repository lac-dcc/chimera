// This program was cloned from: https://github.com/olgirard/openmsp430
// License: BSD 3-Clause "New" or "Revised" License

/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2009 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file spartan3_pmem.v when simulating
// the core, spartan3_pmem. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module spartan3_pmem(
	clka,
	ena,
	wea,
	addra,
	dina,
	douta);


input clka;
input ena;
input [0 : 0] wea;
input [11 : 0] addra;
input [7 : 0] dina;
output [7 : 0] douta;

// synthesis translate_off

      BLK_MEM_GEN_V3_3 #(
		.C_ADDRA_WIDTH(12),
		.C_ADDRB_WIDTH(12),
		.C_ALGORITHM(1),
		.C_BYTE_SIZE(9),
		.C_COMMON_CLK(0),
		.C_DEFAULT_DATA("0"),
		.C_DISABLE_WARN_BHV_COLL(0),
		.C_DISABLE_WARN_BHV_RANGE(0),
		.C_FAMILY("spartan3"),
		.C_HAS_ENA(1),
		.C_HAS_ENB(0),
		.C_HAS_INJECTERR(0),
		.C_HAS_MEM_OUTPUT_REGS_A(0),
		.C_HAS_MEM_OUTPUT_REGS_B(0),
		.C_HAS_MUX_OUTPUT_REGS_A(0),
		.C_HAS_MUX_OUTPUT_REGS_B(0),
		.C_HAS_REGCEA(0),
		.C_HAS_REGCEB(0),
		.C_HAS_RSTA(0),
		.C_HAS_RSTB(0),
		.C_INITA_VAL("0"),
		.C_INITB_VAL("0"),
		.C_INIT_FILE_NAME("no_coe_file_loaded"),
		.C_LOAD_INIT_FILE(0),
		.C_MEM_TYPE(0),
		.C_MUX_PIPELINE_STAGES(0),
		.C_PRIM_TYPE(1),
		.C_READ_DEPTH_A(4096),
		.C_READ_DEPTH_B(4096),
		.C_READ_WIDTH_A(8),
		.C_READ_WIDTH_B(8),
		.C_RSTRAM_A(0),
		.C_RSTRAM_B(0),
		.C_RST_PRIORITY_A("CE"),
		.C_RST_PRIORITY_B("CE"),
		.C_RST_TYPE("SYNC"),
		.C_SIM_COLLISION_CHECK("ALL"),
		.C_USE_BYTE_WEA(0),
		.C_USE_BYTE_WEB(0),
		.C_USE_DEFAULT_DATA(0),
		.C_USE_ECC(0),
		.C_WEA_WIDTH(1),
		.C_WEB_WIDTH(1),
		.C_WRITE_DEPTH_A(4096),
		.C_WRITE_DEPTH_B(4096),
		.C_WRITE_MODE_A("WRITE_FIRST"),
		.C_WRITE_MODE_B("WRITE_FIRST"),
		.C_WRITE_WIDTH_A(8),
		.C_WRITE_WIDTH_B(8),
		.C_XDEVICEFAMILY("spartan3"))
	inst (
		.CLKA(clka),
		.ENA(ena),
		.WEA(wea),
		.ADDRA(addra),
		.DINA(dina),
		.DOUTA(douta),
		.RSTA(),
		.REGCEA(),
		.CLKB(),
		.RSTB(),
		.ENB(),
		.REGCEB(),
		.WEB(),
		.ADDRB(),
		.DINB(),
		.DOUTB(),
		.INJECTSBITERR(),
		.INJECTDBITERR(),
		.SBITERR(),
		.DBITERR(),
		.RDADDRECC());


// synthesis translate_on

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of spartan3_pmem is "black_box"

endmodule

