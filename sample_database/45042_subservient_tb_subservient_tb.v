// This program was cloned from: https://github.com/olofk/subservient
// License: Apache License 2.0

/*
 * subservient_tb.v : Verilog testbench for the subservient SoC
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
module subservient_tb;

   parameter memfile = "";
   parameter memsize = 8192;
   parameter with_csr = 0;
   parameter aw    = $clog2(memsize);

   reg clk = 1'b0;
   reg rst = 1'b1;

   wire [aw-1:0] sram_waddr;
   wire [7:0] 	 sram_wdata;
   wire 	 sram_wen;
   wire [aw-1:0] sram_raddr;
   wire [7:0] 	 sram_rdata;
   wire 	 sram_ren;

   //Debug interface
   reg 		 debug_mode;
   reg [31:0] 	 wb_dbg_adr;
   reg [31:0] 	 wb_dbg_dat;
   reg [3:0] 	 wb_dbg_sel;
   reg 		 wb_dbg_we;
   reg 		 wb_dbg_stb = 1'b0;
   wire [31:0] 	 wb_dbg_rdt;
   wire 	 wb_dbg_ack;

   wire q;

   always  #5 clk <= !clk;
   initial #62 rst <= 1'b0;

   vlog_tb_utils vtu();

   integer baudrate = 0;
   initial begin
      if ($value$plusargs("uart_baudrate=%d", baudrate))
	$display("UART decoder using baud rate %0d", baudrate);
      else
	forever
	  @(q) $display("%0t output o_gpio is %s", $time, q ? "ON" : "OFF");

   end

   reg [1023:0] firmware_file;
   integer 	idx = 0;
   reg [7:0] 	 mem [0:memsize-1];

   task wb_dbg_write32(input [31:0] adr, input [31:0] dat);
      begin
	 @ (posedge clk) begin
	    wb_dbg_adr <= adr;
	    wb_dbg_dat <= dat;
	    wb_dbg_sel <= 4'b1111;
	    wb_dbg_we  <= 1'b1;
	    wb_dbg_stb <= 1'b1;
	 end
	 while (!wb_dbg_ack)
	   @ (posedge clk);
	 wb_dbg_stb <= 1'b0;
      end
   endtask

   reg [31:0] tmp_dat;
   integer    adr;
   reg [1:0]  bsel;

   initial begin
      $display("Setting debug mode");
      debug_mode <= 1'b1;
      if ($value$plusargs("firmware=%s", firmware_file)) begin
	 $display("Writing %0s to SRAM", firmware_file);
	 $readmemh(firmware_file, mem);
      end else
	$display("No application to load. SRAM will be empty");

      repeat (10) @(posedge clk);

      //Write full 32-bit words
      while ((mem[idx] !== 8'bxxxxxxxx) && (idx < memsize)) begin
	 adr = (idx >> 2)*4;
	 bsel = idx[1:0];
	 tmp_dat[bsel*8+:8] = mem[idx];
	 if (bsel == 2'd3)
	   wb_dbg_write32(adr, tmp_dat);
	 idx = idx + 1;
      end

      //Zero-pad final word if required
      if (idx[1:0]) begin
	 adr = (idx >> 2)*4;
	 bsel = idx[1:0];
	 if (bsel == 1) tmp_dat[31:8]  = 24'd0;
	 if (bsel == 2) tmp_dat[31:16] = 16'd0;
	 if (bsel == 3) tmp_dat[31:24] = 8'd0;
	 wb_dbg_write32(adr, tmp_dat);
      end
      repeat (10) @(posedge clk);

      $display("Done writing %0d bytes to SRAM. Turning off debug mode", idx);
      debug_mode <= 1'b0;
   end

   uart_decoder uart_decoder (baudrate, q);

   subservient_generic_ram
     #(.depth (memsize))
   memory
     (.i_clk   (clk),
      .i_rst   (rst),
      .i_waddr (sram_waddr),
      .i_wdata (sram_wdata),
      .i_wen   (sram_wen),
      .i_raddr (sram_raddr),
      .o_rdata (sram_rdata),
      .i_ren   (sram_ren));

   //Note: This should probably be a proper assert instead
   always @(posedge clk)
     if (sram_ren & sram_wen)
       $display("$0t Error: Simultaneous SRAM read and write", $time);

   subservient
     #(.memsize  (memsize),
       .WITH_CSR (with_csr))
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
      .i_debug_mode (debug_mode),
      .i_wb_dbg_adr (wb_dbg_adr),
      .i_wb_dbg_dat (wb_dbg_dat),
      .i_wb_dbg_sel (wb_dbg_sel),
      .i_wb_dbg_we  (wb_dbg_we ),
      .i_wb_dbg_stb (wb_dbg_stb),
      .o_wb_dbg_rdt (wb_dbg_rdt),
      .o_wb_dbg_ack (wb_dbg_ack),

      // External I/O
      .o_gpio (q));

endmodule
