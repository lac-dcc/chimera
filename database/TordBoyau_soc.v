// This program was cloned from: https://github.com/BrunoLevy/TordBoyau
// License: BSD 3-Clause "New" or "Revised" License

/**
 * pipelineZ.v
 * femtorv32-tordboyau
 * Configurable 5-stages pipelined RV32IM
 * Bruno Levy, Sept 2022
 */

/****************************************************************************/

`ifndef BOARD

`define ARTY

`ifndef BOARD_FREQ
`define BOARD_FREQ 100
`endif

// Uncomment to change CPU freq
// If undefined, the 100MHz clock of
// the board is used.
`ifndef CPU_FREQ
`define CPU_FREQ   140
`endif

`endif

/****************************************************************************/

`define CONFIG_PC_PREDICT   // enables D -> F path (needed by RAS and GSHARE)
`define CONFIG_RAS          // return address stack
`define CONFIG_GSHARE       // gshare branch prediction (or BTFNT if not set)

`define CONFIG_RV32M      // RV32M instruction set (MUL,DIV,REM)

//`define CONFIG_DEBUG      // debug mode, displays execution
                            // See "debugger" section in source 
                            // to define breakpoints

`define CONFIG_INITIALIZE // initialize register file and BHT table
                            // (required by Icarus/iverilog 
                            // and by some synth tools)


/******************************************************************************/

`ifndef CPU_FREQ
`define CPU_FREQ 100
`define PASSTHROUGH_PLL
`endif

`ifdef BENCH
`undef BOARD_FREQ
`undef CPU_FREQ
`define BOARD_FREQ 10
`define CPU_FREQ   10
`ifndef PASSTHROUGH_PLL
`define PASSTHROUGH_PLL
`endif
`endif

/******************************************************************************/

`default_nettype none

`include "clockworks.v"
`include "emitter_uart.v"
`include "TordBoyau5.v"
// replaces TordBoyau with a 5-state core to identify bottlenecks
//`include "TordBoyau5_sequential.v" 



module SOC (
    input  wire	     CLK, // system clock 
    input  wire	     RESET,// reset button
    output reg [3:0] LEDS, // system LEDs
    output wire	     TXD  // UART transmit
);

   wire clk;
   wire resetn;
   
   wire [31:0] IO_mem_addr;
   wire [31:0] IO_mem_rdata;
   wire [31:0] IO_mem_wdata;
   wire        IO_mem_wr;

   Processor CPU(
      .clk(clk),
      .resetn(resetn),
      .IO_mem_addr(IO_mem_addr),
      .IO_mem_rdata(IO_mem_rdata),
      .IO_mem_wdata(IO_mem_wdata),
      .IO_mem_wr(IO_mem_wr)
   );

   wire [13:0] IO_wordaddr = IO_mem_addr[15:2];
   
   // Memory-mapped IO in IO page, 1-hot addressing in word address.   
   localparam IO_LEDS_bit      = 0;  // W four leds
   localparam IO_UART_DAT_bit  = 1;  // W data to send (8 bits) 
   localparam IO_UART_CNTL_bit = 2;  // R status. bit 9: busy sending
   
   always @(posedge clk) begin
      if(IO_mem_wr & IO_wordaddr[IO_LEDS_bit]) begin
	 LEDS <= IO_mem_wdata[3:0];
      end
   end

   wire uart_valid = IO_mem_wr & IO_wordaddr[IO_UART_DAT_bit];
   wire uart_ready;


   corescore_emitter_uart #(
      .clk_freq_hz(`CPU_FREQ*1000000),
          .baud_rate(1000000)
   ) UART(
      .i_clk(clk),
      .i_data(IO_mem_wdata[7:0]),
      .i_valid(uart_valid),
      .o_ready(uart_ready),
      .o_uart_tx(TXD)
   );

   assign IO_mem_rdata = 
		    IO_wordaddr[IO_UART_CNTL_bit] ? { 22'b0, !uart_ready, 9'b0}
	                                          : 32'b0;

`ifdef BENCH
   always @(posedge clk) begin
      if(uart_valid) begin
`ifdef CONFIG_DEBUG
	 $display("UART: %c", IO_mem_wdata[7:0]);
`else	 
	 $write("%c", IO_mem_wdata[7:0] );
	 $fflush(32'h8000_0001);
`endif	 
      end
   end
`endif   
   
   // Gearbox and reset circuitry.
   Clockworks CW(
     .CLK(CLK),
     .RESET(RESET),
     .clk(clk),
     .resetn(resetn)
   );

endmodule

