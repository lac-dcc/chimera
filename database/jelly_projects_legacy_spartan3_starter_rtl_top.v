// ----------------------------------------------------------------------------
//  Jelly -- The computing system for Spartan-3 Starter Kit
//
//                                  Copyright (C) 2008-2010 by Ryuz 
// ----------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// memory map
`define	MAP_ROM_ADDR		32'h00000000
`define	MAP_EXTSRAM_ADDR	32'h10000000
`define	MAP_IRC_ADDR		32'hffff8000
`define	MAP_TIMER0_ADDR		32'hfffff100
`define	MAP_UART0_ADDR		32'hfffff200

`define	MAP_ROM_MASK		32'hf0000000
`define	MAP_EXTSRAM_MASK	32'hf0000000
`define	MAP_IRC_MASK		32'hffffe000
`define	MAP_TIMER0_MASK		32'hfffffff0
`define	MAP_UART0_MASK		32'hfffffff0


// top module
module top
		#(
			parameter	BOOT_ROM_FILE   = "hosv4a_sample.hex",
			parameter	USE_DBUGGER     = 1'b0,
			parameter	USE_EXC_SYSCALL = 1'b0,
			parameter	USE_EXC_BREAK   = 1'b0,
			parameter	USE_EXC_RI      = 1'b0,
			parameter	GPR_TYPE        = 0,
			parameter	MUL_CYCLE       = 0,
			parameter	DBBP_NUM        = 0,
			parameter	SIMULATION      = 0
		)
		(
			// system
			input	wire				in_reset,
			input	wire				in_clk,
			
			// asram
			output	wire				asram_ce0_n,
			output	wire				asram_ce1_n,
			output	wire				asram_we_n,
			output	wire				asram_oe_n,
			output	wire	[3:0]		asram_bls_n,
			output	wire	[17:0]		asram_a,
			inout	wire	[31:0]		asram_d,
			
			// uart
			output	wire				uart0_tx,
			input	wire				uart0_rx,
			
			output	wire				uart1_tx,
			input	wire				uart1_rx,
			
			output	wire	[7:0]		led,
			input	wire	[7:0]		sw,
			
			output	wire	[30:0]		ext
		);
	
	wire				uart_tx;
	wire				uart_rx;
	
	wire				dbg_uart_tx;
	wire				dbg_uart_rx;

	assign uart0_tx    = ~sw[0] ? uart_tx  : dbg_uart_tx;
	assign uart1_tx    =  sw[0] ? uart_tx  : dbg_uart_tx;
	assign uart_rx     = ~sw[0] ? uart0_rx : uart1_rx;
	assign dbg_uart_rx = ~sw[0] ? uart1_rx : uart0_rx;
	
	
	// -------------------------
	//  system
	// -------------------------
	
	// endian
	wire				endian;
	assign endian = 1'b1;			// 0:little, 1:big
	
	
	// clock
	wire				reset;
	wire				clk;
	wire				clk_x2;
	wire				clk_uart;
	wire				locked;
	clkgen
		i_clkgen
			(
				.in_reset			(in_reset), 
				.in_clk				(in_clk),
			
				.out_clk			(clk),
				.out_clk_x2			(clk_x2),
				.out_clk_uart		(clk_uart),
				.out_reset			(reset),
				
				.locked				(locked)
		);
	
	
	// -------------------------
	//  cpu
	// -------------------------
	
	// interrupt
	wire			cpu_irq;
	wire			cpu_irq_ack;
		
	//  cpu-bus (WISHBONE)
	wire	[31:2]	wb_cpu_adr_o;
	wire	[31:0]	wb_cpu_dat_i;
	wire	[31:0]	wb_cpu_dat_o;
	wire			wb_cpu_we_o;
	wire	[3:0]	wb_cpu_sel_o;
	wire			wb_cpu_stb_o;
	wire			wb_cpu_ack_i;
	
	// cpu debug port (WISHBONE)
	wire	[3:0]	wb_dbg_adr_o;
	wire	[31:0]	wb_dbg_dat_i;
	wire	[31:0]	wb_dbg_dat_o;
	wire			wb_dbg_we_o;
	wire	[3:0]	wb_dbg_sel_o;
	wire			wb_dbg_stb_o;
	wire			wb_dbg_ack_i;
	
	// CPU
	jelly_cpu_simple_top
			#(
				.CPU_USE_DBUGGER   	(USE_DBUGGER),
				.CPU_USE_EXC_SYSCALL(USE_EXC_SYSCALL),
				.CPU_USE_EXC_BREAK	(USE_EXC_BREAK),
				.CPU_USE_EXC_RI		(USE_EXC_RI),
				.CPU_GPR_TYPE		(GPR_TYPE),
				.CPU_MUL_CYCLE		(MUL_CYCLE),
				.CPU_DBBP_NUM		(DBBP_NUM),
				.SIMULATION 		(SIMULATION)
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
				
				.wb_adr_o			(wb_cpu_adr_o),
				.wb_dat_i			(wb_cpu_dat_i),
				.wb_dat_o			(wb_cpu_dat_o),
				.wb_we_o			(wb_cpu_we_o),
				.wb_sel_o			(wb_cpu_sel_o),
				.wb_stb_o			(wb_cpu_stb_o),
				.wb_ack_i			(wb_cpu_ack_i),
				
				.wb_dbg_adr_i		(wb_dbg_adr_o),
				.wb_dbg_dat_i		(wb_dbg_dat_o),
				.wb_dbg_dat_o		(wb_dbg_dat_i),
				.wb_dbg_we_i		(wb_dbg_we_o),
				.wb_dbg_sel_i		(wb_dbg_sel_o),
				.wb_dbg_stb_i		(wb_dbg_stb_o),
				.wb_dbg_ack_o		(wb_dbg_ack_i)				
			);
	
	generate
	if ( USE_DBUGGER ) begin
		jelly_uart_debugger
				#(
					.TX_FIFO_PTR_WIDTH	(2),
					.RX_FIFO_PTR_WIDTH	(2)
				)
			i_uart_debugger
				(
					.reset				(reset),
					.clk				(clk),
					.endian				(endian),
					
					.uart_clk			(clk_uart),
					.uart_tx			(dbg_uart_tx),
					.uart_rx			(dbg_uart_rx),
					
					.wb_dbg_adr_o		(wb_dbg_adr_o),
					.wb_dbg_dat_i		(wb_dbg_dat_i),
					.wb_dbg_dat_o		(wb_dbg_dat_o),
					.wb_dbg_we_o		(wb_dbg_we_o),
					.wb_dbg_sel_o		(wb_dbg_sel_o),
					.wb_dbg_stb_o		(wb_dbg_stb_o),
					.wb_dbg_ack_i		(wb_dbg_ack_i)
				);
	end
	else begin
		assign dbg_uart_tx  = 1'b1;
		
		assign wb_dbg_adr_o = 4'h0;
		assign wb_dbg_dat_o = 32'h0000_0000;
		assign wb_dbg_we_o  = 1'b0;
		assign wb_dbg_sel_o = 4'b0000;
		assign wb_dbg_stb_o = 1'b0;
	end
	endgenerate
		
	
	
	
	// -------------------------
	//  boot rom
	// -------------------------

	wire	[31:2]		wb_rom_adr_i;
	wire	[31:0]		wb_rom_dat_i;
	wire	[31:0]		wb_rom_dat_o;
	wire	[3:0]		wb_rom_sel_i;
	wire				wb_rom_we_i;
	wire				wb_rom_stb_i;
	wire				wb_rom_ack_o;
	
	jelly_sram
			#(
				.WB_ADR_WIDTH	(12),
				.WB_DAT_WIDTH	(32),
				.READMEMH		(1),
				.READMEM_FILE	(BOOT_ROM_FILE)
			)
		i_sram_boot
			(
				.reset			(reset),
				.clk			(clk),
				
				.s_wb_adr_i		(wb_rom_adr_i[13:2]),
				.s_wb_dat_o		(wb_rom_dat_o),
				.s_wb_dat_i		(wb_rom_dat_i),
				.s_wb_we_i		(wb_rom_we_i),
				.s_wb_sel_i		(wb_rom_sel_i),
				.s_wb_stb_i		(wb_rom_stb_i),
				.s_wb_ack_o		(wb_rom_ack_o)
			);
	
	/*
	jelly_sram
		i_boot_rom
			(
				.clk				(~clk),
				.addr				(wb_rom_adr_i[13:2]),
				.data				(wb_rom_dat_o)
			);
	assign wb_rom_ack_o = wb_rom_stb_i;
	*/
	
	
	// -------------------------
	//  external asram
	// -------------------------
	
	wire	[31:2]		wb_asram_adr_i;
	wire	[31:0]		wb_asram_dat_i;
	wire	[31:0]		wb_asram_dat_o;
	wire	[3:0]		wb_asram_sel_i;
	wire				wb_asram_we_i;
	wire				wb_asram_stb_i;
	wire				wb_asram_ack_o;
	
	wire				asram_cs_n;
		
	jelly_extbus
			#(
				.WB_ADR_WIDTH		(18),
				.WB_DAT_WIDTH		(32)
			)
		i_extbus
			(
				.reset				(reset),
				.clk				(clk),
				
				.extbus_cs_n		(asram_cs_n),
				.extbus_we_n		(asram_we_n),
				.extbus_oe_n		(asram_oe_n),
				.extbus_bls_n		(asram_bls_n),
				.extbus_a			(asram_a),
				.extbus_d			(asram_d),
				
				.s_wb_adr_i			(wb_asram_adr_i[19:2]),
				.s_wb_dat_o			(wb_asram_dat_o),
				.s_wb_dat_i			(wb_asram_dat_i),
				.s_wb_we_i			(wb_asram_we_i),
				.s_wb_sel_i			(wb_asram_sel_i),
				.s_wb_stb_i			(wb_asram_stb_i),
				.s_wb_ack_o			(wb_asram_ack_o)
			);
	assign asram_ce0_n  = asram_cs_n;
	assign asram_ce1_n  = asram_cs_n;
	
	
	// -----------------------------
	//  IRC
	// -----------------------------
	
	// irq
	wire				timer0_irq;
	wire				uart0_irq_rx;
	wire				uart0_irq_tx;
	
	// irq map
	wire	[2:0]		irc_interrupt;
	assign irc_interrupt[0] = timer0_irq;
	assign irc_interrupt[1] = uart0_irq_rx;
	assign irc_interrupt[2] = uart0_irq_tx;
	

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
				.FACTOR_NUM			(3),
				.PRIORITY_WIDTH		(2),
	
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32)
			)
		i_irc
			(
				.clk				(clk),
				.reset				(reset),

				.in_interrupt		(irc_interrupt),

				.cpu_irq			(cpu_irq),
				.cpu_irq_ack		(cpu_irq_ack),
											
				.s_wb_adr_i			(wb_irc_adr_i[9:2]),
				.s_wb_dat_o			(wb_irc_dat_o),
				.s_wb_dat_i			(wb_irc_dat_i),
				.s_wb_we_i			(wb_irc_we_i),
				.s_wb_sel_i			(wb_irc_sel_i),
				.s_wb_stb_i			(wb_irc_stb_i),
				.s_wb_ack_o			(wb_irc_ack_o)
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
				.RX_FIFO_PTR_WIDTH	(2)
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
	
	
	
	// -----------------------------
	//  address decoder
	// -----------------------------

	assign wb_rom_adr_i    = wb_cpu_adr_o;
	assign wb_rom_dat_i    = wb_cpu_dat_o;
	assign wb_rom_sel_i    = wb_cpu_sel_o;
	assign wb_rom_we_i     = wb_cpu_we_o;
	assign wb_rom_stb_i    = wb_cpu_stb_o & (({wb_cpu_adr_o, 2'b00} & `MAP_ROM_MASK) == `MAP_ROM_ADDR);
	
	assign wb_asram_adr_i  = wb_cpu_adr_o;
	assign wb_asram_dat_i  = wb_cpu_dat_o;
	assign wb_asram_sel_i  = wb_cpu_sel_o;
	assign wb_asram_we_i   = wb_cpu_we_o;
	assign wb_asram_stb_i  = wb_cpu_stb_o & (({wb_cpu_adr_o, 2'b00} & `MAP_EXTSRAM_MASK) == `MAP_EXTSRAM_ADDR);
	
	assign wb_irc_adr_i    = wb_cpu_adr_o;
	assign wb_irc_dat_i    = wb_cpu_dat_o;
	assign wb_irc_sel_i    = wb_cpu_sel_o;
	assign wb_irc_we_i     = wb_cpu_we_o;
	assign wb_irc_stb_i    = wb_cpu_stb_o & (({wb_cpu_adr_o, 2'b00} & `MAP_IRC_MASK) == `MAP_IRC_ADDR);
	
	assign wb_timer0_adr_i = wb_cpu_adr_o;
	assign wb_timer0_dat_i = wb_cpu_dat_o;
	assign wb_timer0_sel_i = wb_cpu_sel_o;
	assign wb_timer0_we_i  = wb_cpu_we_o;
	assign wb_timer0_stb_i = wb_cpu_stb_o & (({wb_cpu_adr_o, 2'b00} & `MAP_TIMER0_MASK) == `MAP_TIMER0_ADDR);
	
	assign wb_uart0_adr_i  = wb_cpu_adr_o;
	assign wb_uart0_dat_i  = wb_cpu_dat_o;
	assign wb_uart0_sel_i  = wb_cpu_sel_o;
	assign wb_uart0_we_i   = wb_cpu_we_o;
	assign wb_uart0_stb_i  = wb_cpu_stb_o & (({wb_cpu_adr_o, 2'b00} & `MAP_UART0_MASK) == `MAP_UART0_ADDR);
	
	assign wb_cpu_dat_i    = wb_rom_stb_i    ? wb_rom_dat_o    :
						     wb_asram_stb_i  ? wb_asram_dat_o  :
						     wb_irc_stb_i    ? wb_irc_dat_o    :
						     wb_timer0_stb_i ? wb_timer0_dat_o :
						     wb_uart0_stb_i  ? wb_uart0_dat_o  :
							 32'hxxxx_xxxx;       

	assign wb_cpu_ack_i    = wb_rom_stb_i    ? wb_rom_ack_o    :
						     wb_asram_stb_i  ? wb_asram_ack_o  :
						     wb_irc_stb_i    ? wb_irc_ack_o    :
						     wb_timer0_stb_i ? wb_timer0_ack_o :
						     wb_uart0_stb_i  ? wb_uart0_ack_o  :
							 wb_cpu_stb_o;
	
	
	
	// -------------------------
	//  LED
	// -------------------------
	
	reg		[23:0]		led_counter;
	always @ ( posedge clk or posedge reset ) begin
		if ( reset ) begin
			led_counter <= 0;
		end
		else begin
			led_counter <= led_counter + 1;
		end
	end
	assign led[7:0] = led_counter[23:16];
	
	// debug port
	assign ext  = 0;
	
endmodule


`default_nettype wire


// end of file
