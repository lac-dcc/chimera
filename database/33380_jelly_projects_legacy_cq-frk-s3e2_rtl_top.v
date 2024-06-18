// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//
//                                 Copyright (C) 2008-2009 by Ryuz 
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps


// top module
module top
		#(
			parameter	CPU_USE_DBUGGER     = 1'b0,
			parameter	CPU_USE_EXC_SYSCALL = 1'b0,
			parameter	CPU_USE_EXC_BREAK   = 1'b0,
			parameter	CPU_USE_EXC_RI      = 1'b0,
			parameter	CPU_GPR_TYPE        = 2,
			parameter	CPU_DBBP_NUM        = 0,

			parameter	TCM_ENABLE          = 1,
			parameter	TCM_ADDR_MASK       = 32'b1111_1111_1111_1111__0000_0000_0000_0000,
			parameter	TCM_ADDR_VALUE      = 32'b0000_0000_0000_0000__0000_0000_0000_0000,
			parameter	TCM_ADDR_WIDTH      = 12,
			parameter	TCM_MEM_SIZE        = (1 << TCM_ADDR_WIDTH),
			parameter	TCM_READMEMH        = 1,
			parameter	TCM_READMEM_FIlE    = "hosv4a_sample_ram.hex",

			parameter	SIMULATION          = 0
		)
		(
			// system
			input	wire			in_clk,
			input	wire			in_reset_n,
			
			// uart
			output	wire			uart0_tx,
			input	wire			uart0_rx,
			
			output	wire			uart1_tx,
			input	wire			uart1_rx,
			
			// UI
			output	wire			led
		);
	
	
	
	// -----------------------------
	//  system
	// -----------------------------
	
	// endian
	wire				endian;
	assign endian = 1'b1;			// 0:little, 1:big
	
	
	// clock
	wire				clk;
	wire				clk_x2;
	wire				clk_uart;
	wire				locked;
	clkgen
		i_clkgen
			(
				.in_reset			(!in_reset_n), 
				.in_clk				(in_clk), 
			
				.out_clk			(clk),
				.out_clk_x2			(clk_x2),
				.out_clk_uart		(clk_uart),
				.out_reset			(reset),

				.locked				(locked)
		);
	
	
	// UART assign
	wire				uart_tx;
	wire				uart_rx;
	wire				dbg_uart_tx;
	wire				dbg_uart_rx;
	
	assign uart0_tx    = uart_tx;
	assign uart_rx     = uart0_rx;

	assign uart1_tx    = dbg_uart_tx;
	assign dbg_uart_rx = uart1_rx;
	
	
	
	// -----------------------------
	//  CPU
	// -----------------------------
	
	// interrupt
	wire			cpu_irq;
	wire			cpu_irq_ack;
	
	
	// cpu-bus (Whishbone)
	wire	[31:2]	wb_cpu_adr_o;
	wire	[31:0]	wb_cpu_dat_i;
	wire	[31:0]	wb_cpu_dat_o;
	wire			wb_cpu_we_o;
	wire	[3:0]	wb_cpu_sel_o;
	wire			wb_cpu_stb_o;
	wire			wb_cpu_ack_i;
	
	// cpu debug port
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
				.CPU_USE_DBUGGER	(CPU_USE_DBUGGER),
				.CPU_USE_EXC_SYSCALL(CPU_USE_EXC_SYSCALL),
				.CPU_USE_EXC_BREAK	(CPU_USE_EXC_BREAK),
				.CPU_USE_EXC_RI		(CPU_USE_EXC_RI),
				.CPU_GPR_TYPE		(CPU_GPR_TYPE),
				.CPU_MUL_CYCLE		(33),
				.CPU_DBBP_NUM 		(CPU_DBBP_NUM),
				
				.TCM_ENABLE			(TCM_ENABLE),
				.TCM_ADDR_MASK		(TCM_ADDR_MASK),
				.TCM_ADDR_VALUE		(TCM_ADDR_VALUE),
				.TCM_ADDR_WIDTH		(TCM_ADDR_WIDTH),
				.TCM_MEM_SIZE		(TCM_MEM_SIZE),
				.TCM_READMEMH		(TCM_READMEMH),
				.TCM_READMEM_FIlE	(TCM_READMEM_FIlE),
				
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
				.wb_dbg_ack_o		(wb_dbg_ack_i),
				
				.pause				(1'b0)
			);
	
	
	// Debug Interface (UART)
	generate
	if ( CPU_USE_DBUGGER ) begin
		wire	dbg_uart_clk;
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
					
					.wb_adr_o			(wb_dbg_adr_o),
					.wb_dat_i			(wb_dbg_dat_i),
					.wb_dat_o			(wb_dbg_dat_o),
					.wb_we_o			(wb_dbg_we_o),
					.wb_sel_o			(wb_dbg_sel_o),
					.wb_stb_o			(wb_dbg_stb_o),
					.wb_ack_i			(wb_dbg_ack_i)
				);
	end
	else begin
		assign dbg_uart_tx  = 1'b1;
		
		assign wb_dbg_adr_o = 0;
		assign wb_dbg_dat_o = 0;
		assign wb_dbg_we_o  = 1'b0;
		assign wb_dbg_sel_o = 0;
		assign wb_dbg_stb_o = 1'b0;
	end
	endgenerate
	
	
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
		i_timer0
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
	
	assign wb_irc_adr_i    = wb_cpu_adr_o;
	assign wb_irc_dat_i    = wb_cpu_dat_o;
	assign wb_irc_sel_i    = wb_cpu_sel_o;
	assign wb_irc_we_i     = wb_cpu_we_o;
	assign wb_irc_stb_i    = wb_cpu_stb_o & (wb_cpu_adr_o[31:24] == 8'hf0);

	assign wb_timer0_adr_i = wb_cpu_adr_o;
	assign wb_timer0_dat_i = wb_cpu_dat_o;
	assign wb_timer0_sel_i = wb_cpu_sel_o;
	assign wb_timer0_we_i  = wb_cpu_we_o;
	assign wb_timer0_stb_i = wb_cpu_stb_o & (wb_cpu_adr_o[31:24] == 8'hf1);

	assign wb_uart0_adr_i  = wb_cpu_adr_o;
	assign wb_uart0_dat_i  = wb_cpu_dat_o;
	assign wb_uart0_sel_i  = wb_cpu_sel_o;
	assign wb_uart0_we_i   = wb_cpu_we_o;
	assign wb_uart0_stb_i  = wb_cpu_stb_o & (wb_cpu_adr_o[31:24] == 8'hf2);
	
	assign wb_cpu_dat_i    = wb_irc_stb_i    ? wb_irc_dat_o    :
						     wb_timer0_stb_i ? wb_timer0_dat_o :
						     wb_uart0_stb_i  ? wb_uart0_dat_o  :
							 32'hxxxx_xxxx;       

	assign wb_cpu_ack_i    = wb_irc_stb_i    ? wb_irc_ack_o    :
						     wb_timer0_stb_i ? wb_timer0_ack_o :
						     wb_uart0_stb_i  ? wb_uart0_ack_o  :
							 1'b1;
	
	
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
	assign led = led_counter[23];
	
endmodule

