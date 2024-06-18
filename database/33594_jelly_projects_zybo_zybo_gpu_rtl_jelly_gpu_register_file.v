// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//   GPU用シェーダー演算ソース側制御
//
//                                 Copyright (C) 2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// レジスタファイル
module jelly_gpu_register_file
		#(
			parameter	ADDR_WIDTH = 6,
			parameter	DATA_WIDTH = 32,
			parameter	DOUT_REGS0 = 1,
			parameter	DOUT_REGS1 = 1,
			parameter	MODE0      = "WRITE_FIRST",
			parameter	MODE1      = "WRITE_FIRST",
			parameter	RAM_TYPE   = "distributed"
		)
		(
			input	wire						reset,
			input	wire						clk,
			
			// read port
			input	wire						port0_en,
			input	wire	[ADDR_WIDTH-1:0]	port0_addr,
			output	wire	[DATA_WIDTH-1:0]	port0_rdata,
			
			// read port
			input	wire						port1_en,
			input	wire	[ADDR_WIDTH-1:0]	port1_addr,
			output	wire	[DATA_WIDTH-1:0]	port1_rdata,
			
			// write port
			input	wire						port2_we,
			input	wire	[ADDR_WIDTH-1:0]	port2_addr,
			input	wire	[DATA_WIDTH-1:0]	port2_wdata
		);
	
	jelly_ram_dualport
			#(
				.ADDR_WIDTH		(ADDR_WIDTH),
				.DATA_WIDTH		(DATA_WIDTH),
				.RAM_TYPE		(RAM_TYPE),
				.DOUT_REGS0		(DOUT_REGS0),
				.DOUT_REGS1		(0),
				.MODE0			(MODE0),
				.MODE1			(MODE0)
			)
		i_ram_dualport_0
			(
				.clk0			(clk),
				.en0			(port0_en),
				.regcke0		(port0_en),
				.we0			(1'b0),
				.addr0			(port0_addr),
				.din0			({DATA_WIDTH{1'b0}}),
				.dout0			(port0_rdata),
				
				.clk1			(clk),
				.en1			(port2_we),
				.regcke1		(1'b0),
				.we1			(port2_we),
				.addr1			(port2_addr),
				.din1			(port2_wdata),
				.dout1			()
			);
	
		jelly_ram_dualport
			#(
				.ADDR_WIDTH		(ADDR_WIDTH),
				.DATA_WIDTH		(DATA_WIDTH),
				.RAM_TYPE		(RAM_TYPE),
				.DOUT_REGS0		(DOUT_REGS1),
				.DOUT_REGS1		(0),
				.MODE0			(MODE1),
				.MODE1			(MODE1)
			)
		i_ram_dualport_1
			(
				.clk0			(clk),
				.en0			(port1_en),
				.regcke0		(port1_en),
				.we0			(1'b0),
				.addr0			(port1_addr),
				.din0			({DATA_WIDTH{1'b0}}),
				.dout0			(port1_rdata),
				
				.clk1			(clk),
				.en1			(port2_we),
				.regcke1		(1'b0),
				.we1			(port2_we),
				.addr1			(port2_addr),
				.din1			(port2_wdata),
				.dout1			()
			);
	
endmodule


`default_nettype wire


// end of file
