// This program was cloned from: https://github.com/olofk/subservient
// License: Apache License 2.0

`default_nettype none
module subservient_fpga
(
 input wire  i_clk,
 input wire  i_rst,
 output wire q);

   parameter memfile = "hello.hex";
   parameter memsize = 1024;
   localparam aw    = $clog2(memsize);

   wire      clk;
   wire      rst;

   wire [aw-1:0] sram_waddr;
   wire [7:0] 	 sram_wdata;
   wire 	 sram_wen;
   wire [aw-1:0] sram_raddr;
   wire [7:0] 	 sram_rdata;
   wire 	 sram_ren;

   subservient_fpga_clock_gen clock_gen
     (.i_clk (i_clk),
      .i_rst (i_rst),
      .o_clk (clk),
      .o_rst (rst));

   subservient_generic_ram
     #(.depth (memsize),
       .memfile (memfile))
   memory
     (.i_clk   (clk),
      .i_rst   (rst),
      .i_waddr (sram_waddr),
      .i_wdata (sram_wdata),
      .i_wen   (sram_wen),
      .i_raddr (sram_raddr),
      .o_rdata (sram_rdata),
      .i_ren   (sram_ren));
     
   subservient
     #(.memsize  (memsize),
       .WITH_CSR (0))
   dut
     (// Clock & reset
      .i_clk (clk),
      .i_rst (rst),

      //SRAM interface
      .o_sram_waddr (sram_waddr),
      .o_sram_wdata (sram_wdata),
      .o_sram_wen   (sram_wen),
      .o_sram_raddr (sram_raddr),
      .i_sram_rdata (sram_rdata),
      .o_sram_ren   (sram_ren),

      //Debug interface
      .i_debug_mode (1'b0),
      .i_wb_dbg_adr (32'd0),
      .i_wb_dbg_dat (32'd0),
      .i_wb_dbg_sel (4'd0),
      .i_wb_dbg_we  (1'd0),
      .i_wb_dbg_stb (1'd0),
      .o_wb_dbg_rdt (),
      .o_wb_dbg_ack (),

      // External I/O
      .o_gpio (q));

endmodule
