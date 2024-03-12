//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
//
// File              : airi5c_top_asic.v
// Author            : A. Stanitzki
// Creation Date     : 09.10.20
// Version           : 1.0
// Abstract          : AIRI5C top level for the ASIC implementation
//

//`define   ram_debug
`undef    ram_debug

`include "airi5c_ctrl_constants.vh"
`include "airi5c_csr_addr_map.vh"
`include "airi5c_hasti_constants.vh"
`include "airi5c_dmi_constants.vh"
`include "airi5c_arch_options.vh"

module airi5c_top_asic(
   input                           clk,
   input                           nreset,   
   input                           ext_interrupt,
   
   
// jtag interface
   input                           tdi,
   input                           tck,
   input                           tms,
   output                          tdo,
   
// scan chain interface for core
   input                           testmode,
   input                           sdi,
   output                          sdo,
   input                           sen,

// connections to IMEM/DMEM bus
   output [`HASTI_ADDR_WIDTH-1:0]  imem_haddr,
   output                          imem_hwrite,
   output [`HASTI_SIZE_WIDTH-1:0]  imem_hsize,
   output [`HASTI_BURST_WIDTH-1:0] imem_hburst,
   output                          imem_hmastlock,
   output [`HASTI_PROT_WIDTH-1:0]  imem_hprot,
   output [`HASTI_TRANS_WIDTH-1:0] imem_htrans,
   output [`HASTI_BUS_WIDTH-1:0]   imem_hwdata,
   input  [`HASTI_BUS_WIDTH-1:0]   imem_hrdata,
   input                           imem_hready,
   input                           imem_hresp,
   output [`HASTI_ADDR_WIDTH-1:0]  dmem_haddr,
   output                          dmem_hwrite,
   output [`HASTI_SIZE_WIDTH-1:0]  dmem_hsize,
   output [`HASTI_BURST_WIDTH-1:0] dmem_hburst,
   output                          dmem_hmastlock,
   output [`HASTI_PROT_WIDTH-1:0]  dmem_hprot,
   output [`HASTI_TRANS_WIDTH-1:0] dmem_htrans,
   output [`HASTI_BUS_WIDTH-1:0]   dmem_hwdata,
   input  [`HASTI_BUS_WIDTH-1:0]   dmem_hrdata,
   input                           dmem_hready,
   input                           dmem_hresp,

// -- Chip specific --

// GPIOs
   output [7:0]                    gpio0_out,
   input  [7:0]                    gpio0_in,
   output [7:0]                    gpio0_oe,

// UART 0
   output                          uart0_tx,
   input                           uart0_rx,

// SPI 0
   output                          spi0_mosi_out,
   input                           spi0_mosi_in,
   output                          spi0_mosi_oe,

   output                          spi0_miso_out,
   input                           spi0_miso_in,
   output                          spi0_miso_oe,

   output                          spi0_sclk_out,
   input                           spi0_sclk_in,
   output                          spi0_sclk_oe,

   output [3:0]                    spi0_ss_out,
   input                           spi0_ss_in,
   output                          spi0_ss_oe,

// -- Post-Synthesis debug port --
   output reg [7:0]                debug_out
);

  // ndmreset resets everything but the debug module
  wire                            ndmreset;

  // DMI Bus
  // =======
  // signals driven by debug transfer module
  // and received by the debug module
  wire  [`DMI_ADDR_WIDTH-1:0]     dmi_addr;
  wire  [`DMI_WIDTH-1:0]          dmi_wdata;
  wire  [`DMI_WIDTH-1:0]          dmi_rdata;
  wire                            dmi_en;
  wire                            dmi_wen;
  wire                            dmi_error;
  wire                            dmi_dm_busy;

  // Databus- and Peripherybus-Multiplexer signals
  // =============================================

  wire [`HASTI_BUS_WIDTH-1:0]     muxed_hrdata;
  wire [`HASTI_RESP_WIDTH-1:0]    muxed_hresp;
  wire                            muxed_hready;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_gpio0;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_gpio0;
  wire                            per_hready_gpio0;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_system_timer;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_system_timer;
  wire                            per_hready_system_timer;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_uart0;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_uart0;
  wire                            per_hready_uart0;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_spi0;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_spi0;
  wire                            per_hready_spi0;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_icap;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_icap;
  wire                            per_hready_icap;

  wire [`HASTI_BUS_WIDTH-1:0]     per_hrdata_trng;
  wire [`HASTI_RESP_WIDTH-1:0]    per_hresp_trng;
  wire                            per_hready_trng;

  wire                            nrst = nreset & ndmreset;
  wire                            system_timer_tick;

  wire                            lock_custom;

  // Interrupt signals generated by core local peripherals
  // =====================================================
  
  
  
  //Debugging statements 
`ifdef ram_debug
always@(*) begin 
  if (dmem_haddr == 32'h80002198) begin 
    $display(""); 
    $display("  DMEM Accessing 2198... "); 
    $display("    Time: %0t", $time); 
      if (dmem_hwrite) begin 
        $display("    Write Access"); 
        $display("    Content is %0h", dmem_hwdata);
      end else begin 
         $display("    Read Access"); 
         $display("    Content is 0%h", dmem_hrdata);
      end
  end 
  else if (imem_haddr == 32'h80002198) begin 
    $display(""); 
    $display("  IMEM Accessing 2198... "); 
    $display("    Time: %0t", $time); 
      if (imem_hwrite) begin 
        $display("    Write Access"); 
        $display("    Content is %0h", imem_hwdata);
      end else begin 
         $display("    Read Access"); 
         $display("    Content is 0%h", imem_hrdata);
      end  
  end 
end
`endif

  // DMEM bus multiplexer
  // ====================
  airi5c_periph_mux #
  (
    .S_COUNT(7),
    .S_BASE_ADDR({`MEMORY_BASE_ADDR,`SYSTEM_TIMER_BASE_ADDR,`UART0_BASE_ADDR,`SPI0_BASE_ADDR,`GPIO0_BASE_ADDR,`ICAP_BASE_ADDR,`TRNG_BASE_ADDR}),
    .S_ADDR_WIDTH({`MEMORY_ADDR_WIDTH,`SYSTEM_TIMER_ADDR_WIDTH,`UART0_ADDR_WIDTH,`SPI0_ADDR_WIDTH,`GPIO0_ADDR_WIDTH,`ICAP_ADDR_WIDTH,`TRNG_ADDR_WIDTH})
  )
  peripheral_mux ( 
    .clk_i(clk),
    .rst_ni(nrst),
        
    .m_haddr(dmem_haddr),
    .m_hready(muxed_hready),
    .m_hresp(muxed_hresp),
    .m_hrdata(muxed_hrdata), 
    
    .s_hready({dmem_hready,per_hready_system_timer,per_hready_uart0,per_hready_spi0,per_hready_gpio0,per_hready_icap,per_hready_trng}),
    .s_hresp({dmem_hresp,per_hresp_system_timer,per_hresp_uart0,per_hresp_spi0,per_hresp_gpio0,per_hresp_icap,per_hresp_trng}),
    .s_hrdata({dmem_hrdata,per_hrdata_system_timer,per_hrdata_uart0,per_hrdata_spi0,per_hrdata_gpio0,per_hrdata_icap,per_hrdata_trng})
  );

  // Core Complex peripherals
  // ========================

  airi5c_timer
  #(
    .BASE_ADDR(`SYSTEM_TIMER_BASE_ADDR)
  )
  system_timer (
    .nreset(nrst),
    .clk(clk),

    .timer_tick(system_timer_tick),

    .haddr(dmem_haddr),
    .hwrite(dmem_hwrite),
    .hsize(dmem_hsize),
    .hburst(dmem_hburst),
    .hmastlock(dmem_hmastlock),
    .hprot(dmem_hprot),
    .htrans(dmem_htrans),
    .hwdata(dmem_hwdata),
    .hrdata(per_hrdata_system_timer),
    .hready(per_hready_system_timer),
    .hresp(per_hresp_system_timer)
  );

  airi5c_gpio
  #(
    .BASE_ADDR(`GPIO0_BASE_ADDR),
    .WIDTH(8)
  )
  gpio0 (
    .nreset(nrst),
    .clk(clk),

    .gpio_d(gpio0_out),
    .gpio_en(gpio0_oe),
    .gpio_i(gpio0_in),

    .haddr(dmem_haddr),
    .hwrite(dmem_hwrite),
    .hsize(dmem_hsize),
    .hburst(dmem_hburst),
    .hmastlock(dmem_hmastlock),
    .hprot(dmem_hprot),
    .htrans(dmem_htrans),
    .hwdata(dmem_hwdata),
    .hrdata(per_hrdata_gpio0),
    .hready(per_hready_gpio0),
    .hresp(per_hresp_gpio0)
  );

  airi5c_uart
  #(
    .BASE_ADDR(`UART0_BASE_ADDR),
    .TX_ADDR_WIDTH(5),
    .RX_ADDR_WIDTH(5)
  )
  uart0 (
    .n_reset(nrst),
    .clk(clk),

    .tx(uart0_tx), // airi5c to dtm
    .rx(uart0_rx), // dtm to airi5c
    .cts(1'b1),
    .rts(),
  
    .int_any(),
    .int_tx_empty(),
    .int_tx_watermark_reached(),
    .int_tx_overflow_error(),
    .int_rx_full(),
    .int_rx_watermark_reached(),
    .int_rx_overflow_error(),
    .int_rx_underflow_error(),
    .int_rx_noise_error(),
    .int_rx_parity_error(),
    .int_rx_frame_error(),

    .haddr(dmem_haddr),
    .hwrite(dmem_hwrite),
    .htrans(dmem_htrans),
    .hwdata(dmem_hwdata),
    .hrdata(per_hrdata_uart0),
    .hready(per_hready_uart0),
    .hresp(per_hresp_uart0)
  );

  airi5c_spi
  #(
    .BASE_ADDR(`SPI0_BASE_ADDR),
    .RESET_CONF(1'b1),
    .FIXED_CONF(1'b0),
    .ADDR_WIDTH(3),
    .DATA_WIDTH(8)
  )
  spi0 (
    .n_reset(nrst),
    .clk(clk),

  .mosi_out(spi0_mosi_out),
  .mosi_in(spi0_mosi_in),
  .mosi_oe(spi0_mosi_oe),

  .miso_out(spi0_miso_out),
  .miso_in(spi0_miso_in),
  .miso_oe(spi0_miso_oe),

  .sclk_out(spi0_sclk_out),
  .sclk_in(spi0_sclk_in),
  .sclk_oe(spi0_sclk_oe),

  .ss_out(spi0_ss_out),
  .ss_in(spi0_ss_in),
  .ss_oe(spi0_ss_oe),

  .Int(),  

  .haddr(dmem_haddr),
  .hwrite(dmem_hwrite),
  .htrans(dmem_htrans),
  .hwdata(dmem_hwdata),
  .hrdata(per_hrdata_spi0),
  .hready(per_hready_spi0),
  .hresp(per_hresp_spi0)
);

  airi5c_icap
  #(
    .BASE_ADDR(`ICAP_BASE_ADDR),
    .CLK_FREQ_HZ(`SYS_CLK_HZ)
  )
  icap1 (
    .n_reset(nrst),
    .clk(clk),

    .lock(lock_custom),

    .haddr(dmem_haddr),
    .hwrite(dmem_hwrite),
    .hsize(dmem_hsize),
    .hburst(dmem_hburst),
    .hmastlock(dmem_hmastlock),
    .hprot(dmem_hprot),
    .htrans(dmem_htrans),
    .hwdata(dmem_hwdata),
    .hrdata(per_hrdata_icap),
    .hready(per_hready_icap),
    .hresp(per_hresp_icap)
  );

  airi5c_trng
  #(
    .BASE_ADDR(`TRNG_BASE_ADDR), 
    .FIFO_DEPTH(5)
  )
  trng (
    .n_reset(nrst),
    .clk(clk),

    .haddr(dmem_haddr),
    .hwrite(dmem_hwrite),
    .htrans(dmem_htrans),
    .hwdata(dmem_hwdata),
    .hrdata(per_hrdata_trng),
    .hready(per_hready_trng),
    .hresp(per_hresp_trng)
  );

// core/hart instances
// ===================

airi5c_core airi5c(
  .rst_ni(nreset),
  .clk_i(clk),
  .testmode_i(testmode),

  .ndmreset_o(ndmreset),
  .ext_interrupts_i({`N_EXT_INTS{ext_interrupt}}),
  .system_timer_tick_i(system_timer_tick),

  .imem_haddr_o(imem_haddr),
  .imem_hwrite_o(imem_hwrite),
  .imem_hsize_o(imem_hsize),
  .imem_hburst_o(imem_hburst),
  .imem_hmastlock_o(imem_hmastlock),
  .imem_hprot_o(imem_hprot),
  .imem_htrans_o(imem_htrans),
  .imem_hwdata_o(imem_hwdata),
  .imem_hrdata_i(imem_hrdata),
  .imem_hready_i(imem_hready),
  .imem_hresp_i(imem_hresp),

  .dmem_haddr_o(dmem_haddr),
  .dmem_hwrite_o(dmem_hwrite),
  .dmem_hsize_o(dmem_hsize),
  .dmem_hburst_o(dmem_hburst),
  .dmem_hmastlock_o(dmem_hmastlock),
  .dmem_hprot_o(dmem_hprot),
  .dmem_htrans_o(dmem_htrans),
  .dmem_hwdata_o(dmem_hwdata),
  .dmem_hrdata_i(muxed_hrdata),
  .dmem_hready_i(muxed_hready),
  .dmem_hresp_i(muxed_hresp),

  .lock_custom_i(lock_custom),

  .dmi_addr_i(dmi_addr),
  .dmi_en_i(dmi_en),
  .dmi_error_o(dmi_error),
  .dmi_wen_i(dmi_wen),
  .dmi_wdata_i(dmi_wdata),
  .dmi_rdata_o(dmi_rdata),
  .dmi_dm_busy_o(dmi_dm_busy)
  );

// Debug Transfer Module (DTM)
// ===========================

airi5c_dtm dtm(
  .clk(clk),
  .nreset(nreset),
  .tck(tck),
  .tms(tms),
  .tdi(tdi),
  .tdo(tdo),
  .dmi_addr(dmi_addr),
  .dmi_en(dmi_en),
  .dmi_error(dmi_error),
  .dmi_wen(dmi_wen),
  .dmi_wdata(dmi_wdata),
  .dmi_rdata(dmi_rdata),
  .dmi_dm_busy(dmi_dm_busy)
);

// Debug port for post-synthesis verification
// ==========================================

reg [31:0] debug_addr;
reg    debug_hwrite;

 // DEBUG Signals
 // =============
 // The debug_out port is used in
 // verification to output testbench
 // results from the official ISA tests.
 // It can be handy for silicon verification
 // as well, but might also be excluded from
 // synthesis.

always @(posedge clk or negedge nreset) begin
  if(~nreset) begin
    debug_out <= 255;
    debug_addr <= 0;
    debug_hwrite <= 1'b0;
  end else begin
    debug_addr <= muxed_hready ? dmem_haddr : debug_addr;
    debug_hwrite <= muxed_hready ? dmem_hwrite : debug_hwrite;
    `ifndef VPIMODE
    if(((debug_addr[7:0] == 8'h00) || (debug_addr == 32'h80010000)) && (debug_hwrite))
    begin
      debug_out <= dmem_hwdata[7:0];
    end
    `endif
    `ifdef VPIMODE
    if((debug_addr == 32'hc0000024) && (debug_hwrite))
    begin
        //debug_out <= dmem_hwdata[7:0];
        $write("%c",dmem_hwdata[7:0]);
        if((dmem_hwdata[7:0] == 8'h13) || (dmem_hwdata[7:0] == 8'h10)) $fflush(1);
    end
    `endif
  end
end

endmodule
