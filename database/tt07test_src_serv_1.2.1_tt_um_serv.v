// This program was cloned from: https://github.com/olofk/tt07test
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
/* verilator lint_off UNUSEDSIGNAL */

module tt_um_serv (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

   parameter	      memsize = 512;
   parameter aw    = $clog2(memsize);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[6:0]  = ui_in[6:0] + uio_in[6:0];  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

   wire [aw-1:0] sram_waddr;
   wire [7:0] 	 sram_wdata;
   wire 	 sram_wen;
   wire [aw-1:0] sram_raddr;
   wire [7:0] 	 sram_rdata;
   wire 	 sram_ren;
   
   subservient_generic_ram
     #(.depth (memsize))
   memory
     (.i_clk   (clk),
      .i_rst   (!rst_n),
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
      .i_rst (!rst_n),

      //SRAM interface
      .o_sram_waddr (sram_waddr),
      .o_sram_wdata (sram_wdata),
      .o_sram_wen   (sram_wen),
      .o_sram_raddr (sram_raddr),
      .i_sram_rdata (sram_rdata),
      .o_sram_ren   (sram_ren),

      // External I/O
      .o_gpio (uo_out[7]));
   
endmodule
