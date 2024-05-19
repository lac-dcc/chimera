// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    Spartan-3 Starter Kit
//
//                                 Copyright (C) 2008-2010 by Ryuz 
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale       1ns / 1ps
`default_nettype none


// memory map
`define	MAP_TABLE_ADDR		32'hffff0000
`define	MAP_IRC_ADDR		32'hffff8000
`define	MAP_CPUTIM_ADDR		32'hfffff000
`define	MAP_TIMER0_ADDR		32'hfffff100
`define	MAP_TIMER1_ADDR		32'hfffff110
`define	MAP_UART0_ADDR		32'hfffff200
`define	MAP_GPIO0_ADDR		32'hfffff300
`define	MAP_GPIO1_ADDR		32'hfffff310
`define	MAP_I2C0_ADDR		32'hfffff400
`define	MAP_EXTROM_ADDR		32'h80000000

`define	MAP_TABLE_MASK		32'hffffe000
`define	MAP_IRC_MASK		32'hffffe000
`define	MAP_CPUTIM_MASK		32'hffffffe0
`define	MAP_TIMER0_MASK		32'hfffffff0
`define	MAP_TIMER1_MASK		32'hfffffff0
`define	MAP_TIMER1_MASK		32'hfffffff0
`define	MAP_UART0_MASK		32'hfffffff0
`define	MAP_GPIO0_MASK		32'hfffffff0
`define	MAP_GPIO1_MASK		32'hfffffff0
`define	MAP_I2C0_MASK		32'hffffffe0
`define	MAP_EXTROM_MASK		32'hf0000000

`define	MAP_IRC_TYPE		32'h00010001
`define	MAP_IRC_ATTR		32'h00000000
`define	MAP_IRC_SIZE		32'h00002000

`define	MAP_CPUTIM_TYPE		32'h00010018
`define	MAP_CPUTIM_ATTR		32'h00000000
`define	MAP_CPUTIM_SIZE		32'h00000020

`define	MAP_TIMER0_TYPE		32'h00010010
`define	MAP_TIMER0_ATTR		32'h00000000
`define	MAP_TIMER0_SIZE		32'h00000010

`define	MAP_TIMER1_TYPE		32'h00010010
`define	MAP_TIMER1_ATTR		32'h00000000
`define	MAP_TIMER1_SIZE		32'h00000010

`define	MAP_UART0_TYPE		32'h00010020
`define	MAP_UART0_ATTR		32'h00000000
`define	MAP_UART0_SIZE		32'h00000010


// top module
module top
		#(
			parameter	SIMULATION = 1'b0
		)
		(
			// system
			input	wire				in_clk,
			input	wire				in_reset,
			
			// GPIO
			inout	wire	[3:0]		gpio_a,
			inout	wire	[3:0]		gpio_b,
			
			// uart
			output	wire				uart0_tx,
			input	wire				uart0_rx,
			
			output	wire				uart1_tx,
			input	wire				uart1_rx,
			
			// I2C
			inout	wire				i2c0_scl,
			inout	wire				i2c0_sda,
			
			// NOR FLASH
			inout	wire				flash_sts,
			output	wire				flash_byte_n,
			output	wire				flash_cs_n,  
			output	wire				flash_oe_n, 
			output	wire				flash_we_n,
			output	wire	[24:0]		flash_a,
			inout	wire	[15:0]		flash_d,
			
			// DDR-SDRAM
			output	wire				ddr_sdram_ck_p,
			output	wire				ddr_sdram_ck_n,
			output	wire				ddr_sdram_cke,
			output	wire				ddr_sdram_cs,
			output	wire				ddr_sdram_ras,
			output	wire				ddr_sdram_cas,
			output	wire				ddr_sdram_we,
			output	wire	[1:0]		ddr_sdram_ba,
			output	wire	[12:0]		ddr_sdram_a,
			inout	wire	[15:0]		ddr_sdram_dq,
			output	wire				ddr_sdram_udm,
			output	wire				ddr_sdram_ldm,
			inout	wire				ddr_sdram_udqs,
			inout	wire				ddr_sdram_ldqs,
			input	wire				ddr_sdram_ck_fb,
			
			// UI
			output	wire	[7:0]		led,
			input	wire	[3:0]		sw
		);
	
	genvar		i;
	
	
	// -----------------------------
	//  system
	// -----------------------------
	
	// endian
	wire				endian;
	assign endian = 1'b1;			// 0:little, 1:big
	
	
	// clock
	wire				reset;
	wire				clk;
	wire				clk_x2;
	wire				clk_x2_90;
	wire				clk_uart;
	
	wire				locked;
	
	// reset
	clkgen
		i_clkgen
			(
				.in_reset			(in_reset), 
				.in_clk				(in_clk), 
			
				.out_clk			(clk),
				.out_clk_x2			(clk_x2),
				.out_clk_x2_90		(clk_x2_90),
				.out_clk_uart		(clk_uart),
				.out_reset			(reset),
				
				.locked				(locked)
		);
	

	// -----------------------------
	//  option switch
	// -----------------------------
	
	wire				option_uart_swap;
	reg					option_ram_swap;

	assign option_uart_swap = sw[0];
	always @ ( posedge clk ) begin
		if ( reset ) begin
			option_ram_swap <= sw[1];
		end
	end
	
	
	// -----------------------------
	//  UART switch
	// -----------------------------
	wire				uart_tx;
	wire				uart_rx;
	wire				dbg_uart_tx;
	wire				dbg_uart_rx;
	
	assign uart0_tx    = (option_uart_swap == 1'b0) ? uart_tx  : dbg_uart_tx;
	assign uart1_tx    = (option_uart_swap == 1'b1) ? uart_tx  : dbg_uart_tx;
	assign uart_rx     = (option_uart_swap == 1'b0) ? uart0_rx : uart1_rx;
	assign dbg_uart_rx = (option_uart_swap == 1'b0) ? uart1_rx : uart0_rx;
	
	
	
	// -----------------------------
	//  cpu
	// -----------------------------
	
	// interrupt
	wire			cpu_irq;
	wire			cpu_irq_ack;
		
	// memory bus (cached)
	wire	[31:3]	wb_mem_adr_o;
	wire	[63:0]	wb_mem_dat_i;
	wire	[63:0]	wb_mem_dat_o;
	wire			wb_mem_we_o;
	wire	[7:0]	wb_mem_sel_o;
	wire			wb_mem_stb_o;
	wire			wb_mem_ack_i;
	
	// peripheral bus (non-cache)
	wire	[31:2]	wb_peri_adr_o;
	wire	[31:0]	wb_peri_dat_i;
	wire	[31:0]	wb_peri_dat_o;
	wire			wb_peri_we_o;
	wire	[3:0]	wb_peri_sel_o;
	wire			wb_peri_stb_o;
	wire			wb_peri_ack_i;
	
	// cpu debug port
	wire	[3:0]	wb_dbg_adr_o;
	wire	[31:0]	wb_dbg_dat_i;
	wire	[31:0]	wb_dbg_dat_o;
	wire			wb_dbg_we_o;
	wire	[3:0]	wb_dbg_sel_o;
	wire			wb_dbg_stb_o;
	wire			wb_dbg_ack_i;
		
	// CPU
	jelly_cpu_top
			#(
				.CPU_USE_DBUGGER	(1),
				.CPU_USE_EXC_SYSCALL(1),
				.CPU_USE_EXC_BREAK	(1),
				.CPU_USE_EXC_RI		(1),
				.CPU_GPR_TYPE		(1),
				.CPU_MUL_CYCLE		(0),
				.CPU_DBBP_NUM		(4),
				
				.TCM_ENABLE			(0),
				
				.CACHE_ENABLE		(1),
				.CACHE_LINE_SIZE	(1),	// 2^n (0:1words, 1:2words, 2:4words ...)
				.CACHE_ARRAY_SIZE	(10),	// 2^n (1:2lines, 2:4lines 3:8lines ...)
				
				.WB_CACHE_ADR_WIDTH	(29),
				
				.SIMULATION			(SIMULATION)
			)
		i_cpu_top
			(
				.reset				(reset),
				.clk				(clk),
				.clk_x2				(clk_x2),
				
				.endian				(endian),
				
				.vect_reset			(32'h0000_0000),
				.vect_interrupt		(32'h0000_0180),
				.vect_exception		(32'h0000_0180),
				
				.interrupt_req		(cpu_irq),
				.interrupt_ack		(cpu_irq_ack),
				
				.pause				(1'b0),

				.tcm_addr_mask		(32'h0000_0000),
				.tcm_addr_value		(32'h0000_0000),
				.cache_addr_mask	(32'he000_0000),
				.cache_addr_value	(32'h0000_0000),
				
				.wb_cache_adr_o		(wb_mem_adr_o),
				.wb_cache_dat_i		(wb_mem_dat_i),
				.wb_cache_dat_o		(wb_mem_dat_o),
				.wb_cache_we_o		(wb_mem_we_o),
				.wb_cache_sel_o		(wb_mem_sel_o),
				.wb_cache_stb_o		(wb_mem_stb_o),
				.wb_cache_ack_i		(wb_mem_ack_i),
				
				.wb_through_adr_o	(wb_peri_adr_o),
				.wb_through_dat_i	(wb_peri_dat_i),
				.wb_through_dat_o	(wb_peri_dat_o),
				.wb_through_we_o	(wb_peri_we_o),
				.wb_through_sel_o	(wb_peri_sel_o),
				.wb_through_stb_o	(wb_peri_stb_o),
				.wb_through_ack_i	(wb_peri_ack_i),
				
				.wb_dbg_adr_i		(wb_dbg_adr_o),
				.wb_dbg_dat_i		(wb_dbg_dat_o),
				.wb_dbg_dat_o		(wb_dbg_dat_i),
				.wb_dbg_we_i		(wb_dbg_we_o),
				.wb_dbg_sel_i		(wb_dbg_sel_o),
				.wb_dbg_stb_i		(wb_dbg_stb_o),
				.wb_dbg_ack_o		(wb_dbg_ack_i),

				.trace_valid		(),
				.trace_pc			(),
				.trace_instruction	()
			);
	
	
	// Debug Interface (UART)
	jelly_uart_debugger
			#(
				.TX_FIFO_PTR_WIDTH	(10),
				.RX_FIFO_PTR_WIDTH	(10),
				.DIVIDER_WIDTH		(8)
			)
		i_uart_debugger
			(
				.reset				(reset),
				.clk				(clk),
				.endian				(endian),
				
				.uart_reset			(reset),
				.uart_clk			(clk),
				.uart_tx			(dbg_uart_tx),
				.uart_rx			(dbg_uart_rx),
				.divider			(8'd54 - 1'd1),
				
				.m_wb_adr_o			(wb_dbg_adr_o),
				.m_wb_dat_i			(wb_dbg_dat_i),
				.m_wb_dat_o			(wb_dbg_dat_o),
				.m_wb_we_o			(wb_dbg_we_o),
				.m_wb_sel_o			(wb_dbg_sel_o),
				.m_wb_stb_o			(wb_dbg_stb_o),
				.m_wb_ack_i			(wb_dbg_ack_i)
			);
	
	
	// -----------------------------
	//  boot rom
	// -----------------------------
	
	wire	[31:3]		wb_rom_adr_i;
	wire	[63:0]		wb_rom_dat_o;
	wire	[63:0]		wb_rom_dat_i;
	wire	[7:0]		wb_rom_sel_i;
	wire				wb_rom_we_i;
	wire				wb_rom_stb_i;
	wire				wb_rom_ack_o;
	
	
	wire	[31:2]		wb_rom32_adr_o;
	wire	[31:0]		wb_rom32_dat_i;
	wire	[31:0]		wb_rom32_dat_o;
	wire	[3:0]		wb_rom32_sel_o;
	wire				wb_rom32_we_o;
	wire				wb_rom32_stb_o;
	wire				wb_rom32_ack_i;
	
	jelly_wishbone_width_converter
			#(
				.S_WB_ADR_WIDTH		(29),
				.S_WB_DAT_SIZE		(3),	// 2^n (0:8bit, 1:16bit, 2:32bit ...)
				.M_WB_DAT_SIZE		(2)		// 2^n (0:8bit, 1:16bit, 2:32bit ...)
			)
		i_wishbone_width_converter_rom
			(
				.clk				(clk),
				.reset				(reset),
				
				.endian				(endian),
				
				.s_wb_adr_i		(wb_rom_adr_i),
				.s_wb_dat_o		(wb_rom_dat_o),
				.s_wb_dat_i		(wb_rom_dat_i),
				.s_wb_we_i		(wb_rom_we_i),
				.s_wb_sel_i		(wb_rom_sel_i),
				.s_wb_stb_i		(wb_rom_stb_i),
				.s_wb_ack_o		(wb_rom_ack_o),
                                 
				.m_wb_adr_o	(wb_rom32_adr_o),
				.m_wb_dat_o	(wb_rom32_dat_o),
				.m_wb_dat_i	(wb_rom32_dat_i),
				.m_wb_we_o		(wb_rom32_we_o),
				.m_wb_sel_o	(wb_rom32_sel_o),
				.m_wb_stb_o	(wb_rom32_stb_o),
				.m_wb_ack_i	(wb_rom32_ack_i)
			);
	
	jelly_sram
			#(
				.WB_ADR_WIDTH		(12),
				.WB_DAT_WIDTH		(32),
				.READMEMH			(1),
				.READMEM_FILE		("hosv4a_sample.hex")
			)
		i_sram_rom
			(
				.reset				(reset),
				.clk				(clk),
				
				.s_wb_adr_i			(wb_rom32_adr_o[13:2]),
				.s_wb_dat_o			(wb_rom32_dat_i),
				.s_wb_dat_i			(wb_rom32_dat_o),
				.s_wb_we_i			(wb_rom32_we_o),
				.s_wb_sel_i			(wb_rom32_sel_o),
				.s_wb_stb_i			(wb_rom32_stb_o),
				.s_wb_ack_o			(wb_rom32_ack_i)
			);
	
	
	// -----------------------------
	//  DDR-SDRAM (MT46V32M16TG-6T)
	// -----------------------------
	
	wire	[31:3]		wb_dram_adr_i;
	wire	[63:0]		wb_dram_dat_o;
	wire	[63:0]		wb_dram_dat_i;
	wire				wb_dram_we_i;
	wire	[7:0]		wb_dram_sel_i;
	wire				wb_dram_stb_i;
	wire				wb_dram_ack_o;
	
	wire	[31:2]		wb_dram32_adr_o;
	wire	[31:0]		wb_dram32_dat_o;
	wire	[31:0]		wb_dram32_dat_i;
	wire				wb_dram32_we_o;
	wire	[3:0]		wb_dram32_sel_o;
	wire				wb_dram32_stb_o;
	wire				wb_dram32_ack_i;
	
	/*
	// 64bit/clk => 32bit/clk_x2
	jelly_wishbone_width_clk_x2
			#(
				.S_WB_ADR_WIDTH	(29),
				.S_WB_DAT_WIDTH	(64)
			)
		i_wishbone_width_clk_x2
			(
				.reset				(reset),
				.clk				(clk),
				.clk_x2				(clk_x2),
									
				.endian				(endian),
				
				.s_wb_adr_i		(wb_dram_adr_i),
				.s_wb_dat_o		(wb_dram_dat_o),
				.s_wb_dat_i		(wb_dram_dat_i),
				.s_wb_we_i		(wb_dram_we_i),
				.s_wb_sel_i		(wb_dram_sel_i),
				.s_wb_stb_i		(wb_dram_stb_i),
				.s_wb_ack_o		(wb_dram_ack_o),
									
				.m_wb_adr_o	(wb_dram32_adr_o),
				.m_wb_dat_o	(wb_dram32_dat_o),
				.m_wb_dat_i	(wb_dram32_dat_i),
				.m_wb_we_o		(wb_dram32_we_o),
				.m_wb_sel_o	(wb_dram32_sel_o),
				.m_wb_stb_o	(wb_dram32_stb_o),
				.m_wb_ack_i	(wb_dram32_ack_i)
			);                        
	*/
	
	wire	[31:3]		wb_dram2x_adr_o;
	wire	[63:0]		wb_dram2x_dat_i;
	wire	[63:0]		wb_dram2x_dat_o;
	wire	[7:0]		wb_dram2x_sel_o;
	wire				wb_dram2x_we_o;
	wire				wb_dram2x_stb_o;
	wire				wb_dram2x_ack_i;
	
	jelly_wishbone_clk_x2
			#(
				.WB_ADR_WIDTH		(29),
				.WB_DAT_WIDTH		(64)
			)
		i_wishbone_clk_x2
			(
				.reset				(reset),
				.clk				(clk),
				.clk_x2				(clk_x2),
				
				.s_wb_adr_i			(wb_dram_adr_i),
				.s_wb_dat_o			(wb_dram_dat_o),
				.s_wb_dat_i			(wb_dram_dat_i),
				.s_wb_we_i			(wb_dram_we_i),
				.s_wb_sel_i			(wb_dram_sel_i),
				.s_wb_stb_i			(wb_dram_stb_i),
				.s_wb_ack_o			(wb_dram_ack_o),
                
				.m_wb_x2_adr_o		(wb_dram2x_adr_o),
				.m_wb_x2_dat_o		(wb_dram2x_dat_o),
				.m_wb_x2_dat_i		(wb_dram2x_dat_i),
				.m_wb_x2_we_o		(wb_dram2x_we_o),
				.m_wb_x2_sel_o		(wb_dram2x_sel_o),
				.m_wb_x2_stb_o		(wb_dram2x_stb_o),
				.m_wb_x2_ack_i		(wb_dram2x_ack_i)
			);       
		
	jelly_wishbone_width_converter
			#(
				.S_WB_DAT_SIZE	(3),	// 2^n (0:8bit, 1:16bit, 2:32bit ...)
				.M_WB_DAT_SIZE	(2),	// 2^n (0:8bit, 1:16bit, 2:32bit ...)
				.S_WB_ADR_WIDTH	(29)
			)
		i_wishbone_width_converter_sdram
			(
				.clk				(clk_x2),
				.reset				(reset),

				.endian				(endian),

				.s_wb_adr_i			(wb_dram2x_adr_o),
				.s_wb_dat_o			(wb_dram2x_dat_i),
				.s_wb_dat_i			(wb_dram2x_dat_o),
				.s_wb_we_i			(wb_dram2x_we_o),
				.s_wb_sel_i			(wb_dram2x_sel_o),
				.s_wb_stb_i			(wb_dram2x_stb_o),
				.s_wb_ack_o			(wb_dram2x_ack_i),
                                        
				.m_wb_adr_o			(wb_dram32_adr_o),
				.m_wb_dat_o			(wb_dram32_dat_o),
				.m_wb_dat_i			(wb_dram32_dat_i),
				.m_wb_we_o			(wb_dram32_we_o),
				.m_wb_sel_o			(wb_dram32_sel_o),
				.m_wb_stb_o			(wb_dram32_stb_o),
				.m_wb_ack_i			(wb_dram32_ack_i)
			);
	
	
	// DDR-SDRAM
	jelly_ddr_sdram
			#(
				.SIMULATION			(SIMULATION)
			)
		i_ddr_sdram
			(
				.reset				(reset),
				.clk				(clk_x2),
				.clk90				(clk_x2_90),
				
				.endian				(endian),
				
				.wb_adr_i			(wb_dram32_adr_o[25:2]),
				.wb_dat_o			(wb_dram32_dat_i),
				.wb_dat_i			(wb_dram32_dat_o),
				.wb_we_i			(wb_dram32_we_o),
				.wb_sel_i			(wb_dram32_sel_o),
				.wb_stb_i			(wb_dram32_stb_o),
				.wb_ack_o			(wb_dram32_ack_i),
				
				.ddr_sdram_ck_p		(ddr_sdram_ck_p),
				.ddr_sdram_ck_n		(ddr_sdram_ck_n),
				.ddr_sdram_cke		(ddr_sdram_cke),
				.ddr_sdram_cs		(ddr_sdram_cs),
				.ddr_sdram_ras		(ddr_sdram_ras),
				.ddr_sdram_cas		(ddr_sdram_cas),
				.ddr_sdram_we		(ddr_sdram_we),
				.ddr_sdram_ba		(ddr_sdram_ba),
				.ddr_sdram_a		(ddr_sdram_a),
				.ddr_sdram_dm		({ddr_sdram_udm, ddr_sdram_ldm}),
				.ddr_sdram_dq		(ddr_sdram_dq),
				.ddr_sdram_dqs		({ddr_sdram_udqs, ddr_sdram_ldqs})
			);
	
	
	// -----------------------------
	//  memory bus address decoder
	// -----------------------------
	
	assign wb_rom_adr_i  = wb_mem_adr_o;
	assign wb_rom_dat_i  = wb_mem_dat_o;
	assign wb_rom_sel_i  = wb_mem_sel_o;
	assign wb_rom_we_i   = wb_mem_we_o;
	assign wb_rom_stb_i  = wb_mem_stb_o & (wb_mem_adr_o[31:24] == 8'h00) & (option_ram_swap == 1'b1);
	
	assign wb_dram_adr_i = wb_mem_adr_o;
	assign wb_dram_dat_i = wb_mem_dat_o;
	assign wb_dram_sel_i = wb_mem_sel_o;
	assign wb_dram_we_i  = wb_mem_we_o;
	assign wb_dram_stb_i = wb_mem_stb_o & !wb_rom_stb_i; // (wb_mem_adr_o[31:24] == 8'h01);
	
	assign wb_mem_dat_i  = wb_rom_stb_i  ? wb_rom_dat_o  :
						   wb_dram_stb_i ? wb_dram_dat_o :
						   64'hxxxx_xxxx_xxxx_xxxx;

	assign wb_mem_ack_i  = wb_rom_stb_i  ? wb_rom_ack_o  :
						   wb_dram_stb_i ? wb_dram_ack_o :
						   1'b1;
	
	
	
	// -----------------------------
	//  memory map table
	// -----------------------------
	
	wire	[31:2]		wb_map_adr_i;
	wire	[31:0]		wb_map_dat_i;
	reg		[31:0]		wb_map_dat_o;
	wire	[3:0]		wb_map_sel_i;
	wire				wb_map_we_i;
	wire				wb_map_stb_i;
	reg					wb_map_ack_o;
	
	always @(posedge clk) begin
		if ( reset ) begin
			wb_map_dat_o <= {32{1'bx}};
			wb_map_ack_o <= 1'b0;
		end
		else begin
			wb_map_ack_o <= !wb_map_ack_o & wb_map_stb_i;
			case ( wb_map_adr_i[9:2] )
			8'h00:		wb_map_dat_o <= `MAP_IRC_TYPE;
			8'h01:		wb_map_dat_o <= `MAP_IRC_ATTR;
			8'h02:		wb_map_dat_o <= `MAP_IRC_ADDR;
			8'h03:		wb_map_dat_o <= `MAP_IRC_SIZE;
			8'h04:		wb_map_dat_o <= `MAP_CPUTIM_TYPE;
			8'h05:		wb_map_dat_o <= `MAP_CPUTIM_ATTR;
			8'h06:		wb_map_dat_o <= `MAP_CPUTIM_ADDR;
			8'h07:		wb_map_dat_o <= `MAP_CPUTIM_SIZE;
			8'h08:		wb_map_dat_o <= `MAP_TIMER0_TYPE;
			8'h09:		wb_map_dat_o <= `MAP_TIMER0_ATTR;
			8'h0a:		wb_map_dat_o <= `MAP_TIMER0_ADDR;
			8'h0b:		wb_map_dat_o <= `MAP_TIMER0_SIZE;
			8'h0c:		wb_map_dat_o <= `MAP_TIMER1_TYPE;
			8'h0d:		wb_map_dat_o <= `MAP_TIMER1_ATTR;
			8'h0e:		wb_map_dat_o <= `MAP_TIMER1_ADDR;
			8'h0f:		wb_map_dat_o <= `MAP_TIMER1_SIZE;
			8'h10:		wb_map_dat_o <= `MAP_UART0_TYPE;
			8'h11:		wb_map_dat_o <= `MAP_UART0_ATTR;
			8'h12:		wb_map_dat_o <= `MAP_UART0_ADDR;
			8'h13:		wb_map_dat_o <= `MAP_UART0_SIZE;
			default:	wb_map_dat_o <= 32'h0000_0000;
			endcase
		end
	end
	
	
	// -----------------------------
	//  IRC
	// -----------------------------
	
	// irq
	wire				timer0_irq;
	wire				timer1_irq;
	wire				uart0_irq_rx;
	wire				uart0_irq_tx;
	
	// irq map
	wire	[3:0]		irc_interrupt;
	assign irc_interrupt[0] = timer0_irq;
	assign irc_interrupt[1] = uart0_irq_rx;
	assign irc_interrupt[2] = uart0_irq_tx;
	assign irc_interrupt[3] = timer1_irq;
	
	
	// irc
	wire	[31:2]		wb_irc_adr_i;
	wire	[31:0]		wb_irc_dat_i;
	wire	[31:0]		wb_irc_dat_o;
	wire	[3:0]		wb_irc_sel_i;
	wire				wb_irc_we_i;
	wire				wb_irc_stb_i;
	wire				wb_irc_ack_o;
	
	jelly_irc
			#(
				.FACTOR_ID_WIDTH	(2),
				.FACTOR_NUM			(4),
				.PRIORITY_WIDTH		(2),
	
				.WB_ADR_WIDTH		(12),
				.WB_DAT_WIDTH		(32)
			)
		i_irc
			(
				.clk				(clk),
				.reset				(reset),

				.in_interrupt		(irc_interrupt),

				.cpu_irq			(cpu_irq),
				.cpu_irq_ack		(cpu_irq_ack),
											
				.s_wb_adr_i			(wb_irc_adr_i[13:2]),
				.s_wb_dat_o			(wb_irc_dat_o),
				.s_wb_dat_i			(wb_irc_dat_i),
				.s_wb_we_i			(wb_irc_we_i),
				.s_wb_sel_i			(wb_irc_sel_i),
				.s_wb_stb_i			(wb_irc_stb_i),
				.s_wb_ack_o			(wb_irc_ack_o)
			);                     
	
	
	// -----------------------------
	//  CPU Timer (64bit counter)
	// -----------------------------
	
	wire	[31:2]		wb_cputim_adr_i;
	wire	[31:0]		wb_cputim_dat_i;
	wire	[31:0]		wb_cputim_dat_o;
	wire	[3:0]		wb_cputim_sel_i;
	wire				wb_cputim_we_i;
	wire				wb_cputim_stb_i;
	wire				wb_cputim_ack_o;
	
	jelly_clock_counter
		i_clock_counter
			(
				.clk				(clk),
				.reset				(reset),
				
				.s_wb_adr_i			(wb_cputim_adr_i[4:2]),
				.s_wb_dat_o			(wb_cputim_dat_o),
				.s_wb_dat_i			(wb_cputim_dat_i),
				.s_wb_we_i			(wb_cputim_we_i),
				.s_wb_sel_i			(wb_cputim_sel_i),
				.s_wb_stb_i			(wb_cputim_stb_i),
				.s_wb_ack_o			(wb_cputim_ack_o)
			);       	              
	
	
	// -----------------------------
	//  Timer0
	// -----------------------------
	
	wire	[31:2]		wb_timer0_adr_i;
	wire	[31:0]		wb_timer0_dat_i;
	wire	[31:0]		wb_timer0_dat_o;
	wire	[3:0]		wb_timer0_sel_i;
	wire				wb_timer0_we_i;
	wire				wb_timer0_stb_i;
	wire				wb_timer0_ack_o;
	
	jelly_interval_timer
		i_interval_timer0
			(
				.clk				(clk),
				.reset				(reset),
				
				.interrupt_req		(timer0_irq),

				.s_wb_adr_i			(wb_timer0_adr_i[3:2]),
				.s_wb_dat_o			(wb_timer0_dat_o),
				.s_wb_dat_i			(wb_timer0_dat_i),
				.s_wb_we_i			(wb_timer0_we_i),
				.s_wb_sel_i			(wb_timer0_sel_i),
				.s_wb_stb_i			(wb_timer0_stb_i),
				.s_wb_ack_o			(wb_timer0_ack_o)
			);                     
	
	
	// -----------------------------
	//  Timer1
	// -----------------------------
	
	wire	[31:2]		wb_timer1_adr_i;
	wire	[31:0]		wb_timer1_dat_i;
	wire	[31:0]		wb_timer1_dat_o;
	wire	[3:0]		wb_timer1_sel_i;
	wire				wb_timer1_we_i;
	wire				wb_timer1_stb_i;
	wire				wb_timer1_ack_o;
	
	jelly_interval_timer
		i_interval_timer1
			(
				.clk				(clk),
				.reset				(reset),
				
				.interrupt_req		(timer1_irq),
				
				.s_wb_adr_i			(wb_timer1_adr_i[3:2]),
				.s_wb_dat_o			(wb_timer1_dat_o),
				.s_wb_dat_i			(wb_timer1_dat_i),
				.s_wb_we_i			(wb_timer1_we_i),
				.s_wb_sel_i			(wb_timer1_sel_i),
				.s_wb_stb_i			(wb_timer1_stb_i),
				.s_wb_ack_o			(wb_timer1_ack_o)
			);                     
	
	
	// -----------------------------
	//  UART
	// -----------------------------
	
	wire	[31:2]		wb_uart0_adr_i;
	wire	[31:0]		wb_uart0_dat_i;
	wire	[31:0]		wb_uart0_dat_o;
	wire	[3:0]		wb_uart0_sel_i;
	wire				wb_uart0_we_i;
	wire				wb_uart0_stb_i;
	wire				wb_uart0_ack_o;

	jelly_uart
			#(
				.TX_FIFO_PTR_WIDTH	(2),
				.RX_FIFO_PTR_WIDTH	(2),
				
				.DIVIDER_WIDTH		(8),
				.DIVIDER_INIT		(54-1),			// 115.2kbps @ 50MHz
								
				.SIMULATION			(SIMULATION),
				.DEBUG				(1)
			)
		i_uart0
			(
				.reset				(reset),
				.clk				(clk),
				
				.uart_reset			(reset),
				.uart_clk			(clk),
				.uart_tx			(uart_tx),
				.uart_rx			(uart_rx),
				
				.irq_rx				(uart0_irq_rx),
				.irq_tx				(uart0_irq_tx),
				
				.s_wb_adr_i			(wb_uart0_adr_i[3:2]),
				.s_wb_dat_o			(wb_uart0_dat_o),
				.s_wb_dat_i			(wb_uart0_dat_i),
				.s_wb_we_i			(wb_uart0_we_i),
				.s_wb_sel_i			(wb_uart0_sel_i),
				.s_wb_stb_i			(wb_uart0_stb_i),
				.s_wb_ack_o			(wb_uart0_ack_o)
			);
	
	/*
	jelly_uart
			#(
				.TX_FIFO_PTR_WIDTH	(2),
				.RX_FIFO_PTR_WIDTH	(2),
				.SIMULATION			(SIMULATION),
				.DEBUG				(1)
			)
		i_uart0
			(
				.clk				(clk),
				.reset				(reset),
				
				.uart_clk			(clk_uart),
				.uart_tx			(uart_tx),
				.uart_rx			(uart_rx),
				
				.irq_rx				(uart0_irq_rx),
				.irq_tx				(uart0_irq_tx),
				
				.s_wb_adr_i			(wb_uart0_adr_i[3:2]),
				.s_wb_dat_o			(wb_uart0_dat_o),
				.s_wb_dat_i			(wb_uart0_dat_i),
				.s_wb_we_i			(wb_uart0_we_i),
				.s_wb_sel_i			(wb_uart0_sel_i),
				.s_wb_stb_i			(wb_uart0_stb_i),
				.s_wb_ack_o			(wb_uart0_ack_o)
			);
	*/
	
	
	// -----------------------------
	//  I2C
	// -----------------------------
	
	wire	[31:2]		wb_i2c0_adr_i;
	wire	[31:0]		wb_i2c0_dat_i;
	wire	[31:0]		wb_i2c0_dat_o;
	wire	[3:0]		wb_i2c0_sel_i;
	wire				wb_i2c0_we_i;
	wire				wb_i2c0_stb_i;
	wire				wb_i2c0_ack_o;
	
	wire				i2c0_scl_t;
	wire				i2c0_sda_t;
	
	jelly_i2c
			#(
				.DIVIDER_WIDTH		(16),
				.DIVIDER_INIT		(500),
				.WB_ADR_WIDTH		(3),
				.WB_DAT_WIDTH		(32)
			)
		i_i2c0
			(
				.clk				(clk),
				.reset				(reset),
				
				.i2c_scl_t			(i2c0_scl_t),
				.i2c_scl_i			(i2c0_scl),
				.i2c_sda_t			(i2c0_sda_t),
				.i2c_sda_i			(i2c0_sda),
				
				.s_wb_adr_i			(wb_i2c0_adr_i[3:2]),
				.s_wb_dat_o			(wb_i2c0_dat_o),
				.s_wb_dat_i			(wb_i2c0_dat_i),
				.s_wb_we_i			(wb_i2c0_we_i),
				.s_wb_sel_i			(wb_i2c0_sel_i),
				.s_wb_stb_i			(wb_i2c0_stb_i),
				.s_wb_ack_o			(wb_i2c0_ack_o)
			);
	
	assign i2c0_scl = i2c0_scl_t ? 1'bz : 1'b0;
	assign i2c0_sda = i2c0_sda_t ? 1'bz : 1'b0;
	
	
	// -----------------------------
	//  GPIO A
	// -----------------------------

	wire	[31:2]		wb_gpio0_adr_i;
	wire	[31:0]		wb_gpio0_dat_i;
	wire	[31:0]		wb_gpio0_dat_o;
	wire	[3:0]		wb_gpio0_sel_i;
	wire				wb_gpio0_we_i;
	wire				wb_gpio0_stb_i;
	wire				wb_gpio0_ack_o;
	
	wire	[3:0]		gpio_a_i;
	wire	[3:0]		gpio_a_o;
	wire	[3:0]		gpio_a_t;
	
	jelly_gpio
			#(
				.PORT_WIDTH			(4),
				.INIT_DIRECTION		(4'b0000),
				.INIT_OUTPUT		(4'b0000)
			)
		i_gpio_a
			(
				.reset				(reset),
				.clk				(clk),
				
				.port_i				(gpio_a_i),
				.port_o				(gpio_a_o),
				.port_t				(gpio_a_t),
				
				.s_wb_adr_i			(wb_gpio0_adr_i[3:2]),
				.s_wb_dat_o			(wb_gpio0_dat_o),
				.s_wb_dat_i			(wb_gpio0_dat_i),
				.s_wb_we_i			(wb_gpio0_we_i),
				.s_wb_sel_i			(wb_gpio0_sel_i),
				.s_wb_stb_i			(wb_gpio0_stb_i),
				.s_wb_ack_o			(wb_gpio0_ack_o)
			);                     
	
	generate
	for ( i = 0; i < 4; i = i+1 ) begin : gpio_a_loop 
		IOBUF	i_iob_gpioa(.I(gpio_a_o[i]), .O(gpio_a_i[i]), .T(gpio_a_t[i]), .IO(gpio_a[i]));
	end
	endgenerate
	
	
	// -----------------------------
	//  GPIO B
	// -----------------------------

	wire	[31:2]		wb_gpio1_adr_i;
	wire	[31:0]		wb_gpio1_dat_i;
	wire	[31:0]		wb_gpio1_dat_o;
	wire	[3:0]		wb_gpio1_sel_i;
	wire				wb_gpio1_we_i;
	wire				wb_gpio1_stb_i;
	wire				wb_gpio1_ack_o;
	
	wire	[3:0]		gpio_b_i;
	wire	[3:0]		gpio_b_o;
	wire	[3:0]		gpio_b_t;
	
	jelly_gpio
			#(
				.PORT_WIDTH			(4),
				.INIT_DIRECTION		(4'b0000),
				.INIT_OUTPUT		(4'b0000)
			)
		i_gpio_b
			(
				.reset				(reset),
				.clk				(clk),

				.port_i				(gpio_b_i),
				.port_o				(gpio_b_o),
				.port_t				(gpio_b_t),

				.s_wb_adr_i			(wb_gpio1_adr_i[3:2]),
				.s_wb_dat_o			(wb_gpio1_dat_o),
				.s_wb_dat_i			(wb_gpio1_dat_i),
				.s_wb_we_i			(wb_gpio1_we_i),
				.s_wb_sel_i			(wb_gpio1_sel_i),
				.s_wb_stb_i			(wb_gpio1_stb_i),
				.s_wb_ack_o			(wb_gpio1_ack_o)	
			);
	
	generate
	for ( i = 0; i < 4; i = i+1 ) begin : gpio_b_loop 
		IOBUF	i_iob_gpiob(.I(gpio_b_o[i]), .O(gpio_b_i[i]), .T(gpio_b_t[i]), .IO(gpio_b[i]));
	end
	endgenerate
	
	
	// -----------------------------
	//  nor flash
	// -----------------------------
	
	wire	[31:2]		wb_flash_adr_i;
	wire	[31:0]		wb_flash_dat_i;
	wire	[31:0]		wb_flash_dat_o;
	wire	[3:0]		wb_flash_sel_i;
	wire				wb_flash_we_i;
	wire				wb_flash_stb_i;
	wire				wb_flash_ack_o;
	
	wire	[31:1]		wb_flash16_adr_o;
	wire	[15:0]		wb_flash16_dat_o;
	wire	[15:0]		wb_flash16_dat_i;
	wire	[1:0]		wb_flash16_sel_o;
	wire				wb_flash16_we_o;
	wire				wb_flash16_stb_o;
	wire				wb_flash16_ack_i;
	
	jelly_wishbone_width_converter
			#(
				.S_WB_DAT_SIZE		(2),	// 2^n (0:8bit, 1:16bit, 2:32bit ...)
				.M_WB_DAT_SIZE		(1),	// 2^n (0:8bit, 1:16bit, 2:32bit ...)
				.S_WB_ADR_WIDTH		(30)
			)
		i_wishbone_width_converter_flash
			(
				.clk				(clk),
				.reset				(reset),
				
				.endian				(endian),
				
				.s_wb_adr_i			(wb_flash_adr_i),
				.s_wb_dat_o			(wb_flash_dat_o),
				.s_wb_dat_i			(wb_flash_dat_i),
				.s_wb_we_i			(wb_flash_we_i),
				.s_wb_sel_i			(wb_flash_sel_i),
				.s_wb_stb_i			(wb_flash_stb_i),
				.s_wb_ack_o			(wb_flash_ack_o),
				
				.m_wb_adr_o			(wb_flash16_adr_o),
				.m_wb_dat_o			(wb_flash16_dat_o),
				.m_wb_dat_i			(wb_flash16_dat_i),
				.m_wb_we_o			(wb_flash16_we_o),
				.m_wb_sel_o			(wb_flash16_sel_o),
				.m_wb_stb_o			(wb_flash16_stb_o),
				.m_wb_ack_i			(wb_flash16_ack_i)
			);
	
	jelly_extbus
			#(
				.ACCESS_CYCLE		(4),
				.WB_ADR_WIDTH		(24),
				.WB_DAT_WIDTH		(16)
			)
		i_extbus_flash
			(
				.reset				(reset),
				.clk				(clk),
								
				.extbus_cs_n		(flash_cs_n),
				.extbus_we_n		(flash_we_n),
				.extbus_oe_n		(flash_oe_n),
				.extbus_bls_n		(),
				.extbus_a			(flash_a[24:1]),
				.extbus_d			(flash_d),
				
				.s_wb_adr_i			(wb_flash16_adr_o[24:1]),
				.s_wb_dat_o			(wb_flash16_dat_i),
				.s_wb_dat_i			(wb_flash16_dat_o),
				.s_wb_we_i			(wb_flash16_we_o),
				.s_wb_sel_i			(wb_flash16_sel_o),
				.s_wb_stb_i			(wb_flash16_stb_o),
				.s_wb_ack_o			(wb_flash16_ack_i)
			);
	
	assign flash_sts    = 1'bz;
	assign flash_byte_n = 1'b1;
	assign flash_a[0]   = 1'b0;
	
	
	
	// -----------------------------
	//  peri bus address decoder
	// -----------------------------

	assign wb_irc_adr_i    = wb_peri_adr_o;
	assign wb_irc_dat_i    = wb_peri_dat_o;
	assign wb_irc_sel_i    = wb_peri_sel_o;
	assign wb_irc_we_i     = wb_peri_we_o;
	assign wb_irc_stb_i    = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_IRC_MASK) == `MAP_IRC_ADDR);

	assign wb_cputim_adr_i = wb_peri_adr_o;
	assign wb_cputim_dat_i = wb_peri_dat_o;
	assign wb_cputim_sel_i = wb_peri_sel_o;
	assign wb_cputim_we_i  = wb_peri_we_o;
	assign wb_cputim_stb_i = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_CPUTIM_MASK) == `MAP_CPUTIM_ADDR);

	assign wb_timer0_adr_i = wb_peri_adr_o;
	assign wb_timer0_dat_i = wb_peri_dat_o;
	assign wb_timer0_sel_i = wb_peri_sel_o;
	assign wb_timer0_we_i  = wb_peri_we_o;
	assign wb_timer0_stb_i = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_TIMER0_MASK) == `MAP_TIMER0_ADDR);
	
	assign wb_timer1_adr_i = wb_peri_adr_o;
	assign wb_timer1_dat_i = wb_peri_dat_o;
	assign wb_timer1_sel_i = wb_peri_sel_o;
	assign wb_timer1_we_i  = wb_peri_we_o;
	assign wb_timer1_stb_i = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_TIMER1_MASK) == `MAP_TIMER1_ADDR);
	
	assign wb_uart0_adr_i  = wb_peri_adr_o;
	assign wb_uart0_dat_i  = wb_peri_dat_o;
	assign wb_uart0_sel_i  = wb_peri_sel_o;
	assign wb_uart0_we_i   = wb_peri_we_o;
	assign wb_uart0_stb_i  = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_UART0_MASK) == `MAP_UART0_ADDR);
	
	assign wb_i2c0_adr_i   = wb_peri_adr_o;
	assign wb_i2c0_dat_i   = wb_peri_dat_o;
	assign wb_i2c0_sel_i   = wb_peri_sel_o;
	assign wb_i2c0_we_i    = wb_peri_we_o;
	assign wb_i2c0_stb_i   = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_I2C0_MASK) == `MAP_I2C0_ADDR);
	
	assign wb_gpio0_adr_i  = wb_peri_adr_o;
	assign wb_gpio0_dat_i  = wb_peri_dat_o;
	assign wb_gpio0_sel_i  = wb_peri_sel_o;
	assign wb_gpio0_we_i   = wb_peri_we_o;
	assign wb_gpio0_stb_i  = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_GPIO0_MASK) == `MAP_GPIO0_ADDR);

	assign wb_gpio1_adr_i  = wb_peri_adr_o;
	assign wb_gpio1_dat_i  = wb_peri_dat_o;
	assign wb_gpio1_sel_i  = wb_peri_sel_o;
	assign wb_gpio1_we_i   = wb_peri_we_o;
	assign wb_gpio1_stb_i  = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_GPIO1_MASK) == `MAP_GPIO1_ADDR);

	assign wb_flash_adr_i  = wb_peri_adr_o;
	assign wb_flash_dat_i  = wb_peri_dat_o;
	assign wb_flash_sel_i  = wb_peri_sel_o;
	assign wb_flash_we_i   = wb_peri_we_o;
	assign wb_flash_stb_i  = wb_peri_stb_o & (({wb_peri_adr_o, 2'b00} & `MAP_EXTROM_MASK) == `MAP_EXTROM_ADDR);
	
	assign wb_peri_dat_i   = wb_irc_stb_i    ? wb_irc_dat_o    :
						     wb_cputim_stb_i ? wb_cputim_dat_o :
						     wb_timer0_stb_i ? wb_timer0_dat_o :
						     wb_timer1_stb_i ? wb_timer1_dat_o :
						     wb_uart0_stb_i  ? wb_uart0_dat_o  :
						     wb_i2c0_stb_i   ? wb_i2c0_dat_o   :
						     wb_gpio0_stb_i  ? wb_gpio0_dat_o  :
						     wb_gpio1_stb_i  ? wb_gpio1_dat_o  :
							 wb_flash_stb_i  ? wb_flash_dat_o  :
							 32'hxxxx_xxxx;       
	
	assign wb_peri_ack_i   = wb_irc_stb_i    ? wb_irc_ack_o    :
						     wb_cputim_stb_i ? wb_cputim_ack_o :
						     wb_timer0_stb_i ? wb_timer0_ack_o :
						     wb_timer1_stb_i ? wb_timer1_ack_o :
						     wb_uart0_stb_i  ? wb_uart0_ack_o  :
						     wb_i2c0_stb_i   ? wb_i2c0_ack_o  :
						     wb_gpio0_stb_i  ? wb_gpio0_ack_o  :
						     wb_gpio1_stb_i  ? wb_gpio1_ack_o  :
							 wb_flash_stb_i  ? wb_flash_ack_o  :
							 1'b1;
		
	// -----------------------------
	//  LED
	// -----------------------------
	
	reg		[23:0]		led_counter;
	always @ ( posedge clk ) begin
		if ( reset ) begin
			led_counter <= 0;
		end
		else begin
			led_counter <= led_counter + 1;
		end
	end
	assign led[7:0] = led_counter[23:16];
	
endmodule



`default_nettype wire


// end of file
