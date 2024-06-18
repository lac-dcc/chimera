// This program was cloned from: https://github.com/johnathan-convertino-afrl/fmcomms2-3
// License: MIT License

//******************************************************************************
/// @FILE    system_pl_wrapper.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2023.11.02
/// @BRIEF   System wrapper for pl only.
///
/// @LICENSE MIT
///  Copyright 2023 Jay Convertino
///
///  Permission is hereby grante, free of charge, to any person obtaining a copy
///  of this software and associated documentation files (the "Software"), to
///  deal in the Software without restriction, including without limitation the
///  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
///  sell copies of the Software, and to permit persons to whom the Software is
///  furnished to do so, subject to the following conditions:
///
///  The above copyright notice and this permission notice shall be included in
///  all copies or substantial portions of the Software.
///
///  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
///  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
///  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
///  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
///  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
///  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
///  IN THE SOFTWARE.
//******************************************************************************

module system_pl_wrapper #(
    parameter FPGA_TECHNOLOGY = 0,
    parameter FPGA_FAMILY = 0,
    parameter SPEED_GRADE = 0,
    parameter DEV_PACKAGE = 0,
    parameter ADC_INIT_DELAY = 23,
    parameter DAC_INIT_DELAY = 0,
    parameter DELAY_REFCLK_FREQUENCY = 200
  ) (
    //AXI4LITE SLAVE INTERFACE TO CROSSBAR
    input axi_aclk,
    input axi_aresetn,

    input         s_axi_awvalid,
    input  [31:0] s_axi_awaddr,
    output        s_axi_awready,
    input   [2:0] s_axi_awprot,
    input         s_axi_wvalid,
    input  [31:0] s_axi_wdata,
    input  [ 3:0] s_axi_wstrb,
    output        s_axi_wready,
    output        s_axi_bvalid,
    output [ 1:0] s_axi_bresp,
    input         s_axi_bready,
    input         s_axi_arvalid,
    input  [31:0] s_axi_araddr,
    output        s_axi_arready,
    input   [2:0] s_axi_arprot,
    output        s_axi_rvalid,
    input         s_axi_rready,
    output [ 1:0] s_axi_rresp,
    output [31:0] s_axi_rdata,

    //irq
    output        adc_dma_irq,
    output        dac_dma_irq,

    //AD9361 IO
    //clocks
    input         delay_clk,
    //RX LVDS
    input         rx_clk_in_p,
    input         rx_clk_in_n,
    input         rx_frame_in_p,
    input         rx_frame_in_n,
    input   [5:0] rx_data_in_p,
    input   [5:0] rx_data_in_n,
    //TX LVDS
    output        tx_clk_out_p,
    output        tx_clk_out_n,
    output        tx_frame_out_p,
    output        tx_frame_out_n,
    output  [5:0] tx_data_out_p,
    output  [5:0] tx_data_out_n,
    //MISC
    output        enable,
    output        txnrx,
    input         up_enable,
    input         up_txnrx,
    //sync
    output        tdd_sync_t,
    input         tdd_sync_i,
    output        tdd_sync_o,

    //axi interface for the adc to the hp interface
    output [31:0]   adc_m_dest_axi_awaddr,
    output [ 3:0]   adc_m_dest_axi_awlen,
    output [ 2:0]   adc_m_dest_axi_awsize,
    output [ 1:0]   adc_m_dest_axi_awburst,
    output [ 2:0]   adc_m_dest_axi_awprot,
    output [ 3:0]   adc_m_dest_axi_awcache,
    output          adc_m_dest_axi_awvalid,
    input           adc_m_dest_axi_awready,
    output [63:0]   adc_m_dest_axi_wdata,
    output [ 7:0]   adc_m_dest_axi_wstrb,
    input           adc_m_dest_axi_wready,
    output          adc_m_dest_axi_wvalid,
    output          adc_m_dest_axi_wlast,
    input           adc_m_dest_axi_bvalid,
    input  [ 1:0]   adc_m_dest_axi_bresp,
    output          adc_m_dest_axi_bready,

    //axi interface for dac to the hp interface
    input           dac_m_src_axi_arready,
    output          dac_m_src_axi_arvalid,
    output [31:0]   dac_m_src_axi_araddr,
    output [ 3:0]   dac_m_src_axi_arlen,
    output [ 2:0]   dac_m_src_axi_arsize,
    output [ 1:0]   dac_m_src_axi_arburst,
    output [ 2:0]   dac_m_src_axi_arprot,
    output [ 3:0]   dac_m_src_axi_arcache,
    input  [63:0]   dac_m_src_axi_rdata,
    output          dac_m_src_axi_rready,
    input           dac_m_src_axi_rvalid,
    input  [ 1:0]   dac_m_src_axi_rresp,
    input           dac_m_src_axi_rlast
  );

  ad9361_pl_wrapper #(
    .FPGA_TECHNOLOGY(FPGA_TECHNOLOGY),
    .FPGA_FAMILY(FPGA_FAMILY),
    .SPEED_GRADE(SPEED_GRADE),
    .DEV_PACKAGE(DEV_PACKAGE),
    .ADC_INIT_DELAY(ADC_INIT_DELAY),
    .DAC_INIT_DELAY(DAC_INIT_DELAY),
    .DELAY_REFCLK_FREQUENCY(DELAY_REFCLK_FREQUENCY),
    .DMA_AXI_PROTOCOL_TO_PS(0), //AXI4
    .AXI_DMAC_ADC_ADDR(32'h9C400000),
    .AXI_DMAC_DAC_ADDR(32'h9C420000),
    .AXI_AD9361_ADDR(32'h99020000)
  ) inst_ad9361_pl_wrapper (
    //AXI4LITE SLAVE INTERFACE TO CROSSBAR
    .axi_aclk(axi_aclk),
    .axi_aresetn(axi_aresetn),

    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awready(s_axi_awready),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wready(s_axi_wready),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bready(s_axi_bready),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arready(s_axi_arready),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rdata(s_axi_rdata),

    //irq
    .adc_dma_irq(adc_dma_irq),
    .dac_dma_irq(dac_dma_irq),

    //AD9361 IO
    //clocks
    .delay_clk(delay_clk),
    //RX LVDS
    .rx_clk_in_p(rx_clk_in_p),
    .rx_clk_in_n(rx_clk_in_n),
    .rx_frame_in_p(rx_frame_in_p),
    .rx_frame_in_n(rx_frame_in_n),
    .rx_data_in_p(rx_data_in_p),
    .rx_data_in_n(rx_data_in_n),
    //TX LVDS
    .tx_clk_out_p(tx_clk_out_p),
    .tx_clk_out_n(tx_clk_out_n),
    .tx_frame_out_p(tx_frame_out_p),
    .tx_frame_out_n(tx_frame_out_n),
    .tx_data_out_p(tx_data_out_p),
    .tx_data_out_n(tx_data_out_n),
    //MISC
    .enable(enable),
    .txnrx(txnrx),
    .up_enable(up_enable),
    .up_txnrx(up_txnrx),
    //sync
    .tdd_sync_t(tdd_sync_t),
    .tdd_sync_i(tdd_sync_i),
    .tdd_sync_o(tdd_sync_o),

    //axi interface for the adc to the hp interface
    .adc_m_dest_axi_awaddr(adc_m_dest_axi_awaddr),
    .adc_m_dest_axi_awlen(adc_m_dest_axi_awlen),
    .adc_m_dest_axi_awsize(adc_m_dest_axi_awsize),
    .adc_m_dest_axi_awburst(adc_m_dest_axi_awburst),
    .adc_m_dest_axi_awprot(adc_m_dest_axi_awprot),
    .adc_m_dest_axi_awcache(adc_m_dest_axi_awcache),
    .adc_m_dest_axi_awvalid(adc_m_dest_axi_awvalid),
    .adc_m_dest_axi_awready(adc_m_dest_axi_awready),
    .adc_m_dest_axi_wdata(adc_m_dest_axi_wdata),
    .adc_m_dest_axi_wstrb(adc_m_dest_axi_wstrb),
    .adc_m_dest_axi_wready(adc_m_dest_axi_wready),
    .adc_m_dest_axi_wvalid(adc_m_dest_axi_wvalid),
    .adc_m_dest_axi_wlast(adc_m_dest_axi_wlast),
    .adc_m_dest_axi_bvalid(adc_m_dest_axi_bvalid),
    .adc_m_dest_axi_bresp(adc_m_dest_axi_bresp),
    .adc_m_dest_axi_bready(adc_m_dest_axi_bready),

    //axi interface for dac to the hp interface
    .dac_m_src_axi_arready(dac_m_src_axi_arready),
    .dac_m_src_axi_arvalid(dac_m_src_axi_arvalid),
    .dac_m_src_axi_araddr(dac_m_src_axi_araddr),
    .dac_m_src_axi_arlen(dac_m_src_axi_arlen),
    .dac_m_src_axi_arsize(dac_m_src_axi_arsize),
    .dac_m_src_axi_arburst(dac_m_src_axi_arburst),
    .dac_m_src_axi_arprot(dac_m_src_axi_arprot),
    .dac_m_src_axi_arcache(dac_m_src_axi_arcache),
    .dac_m_src_axi_rdata(dac_m_src_axi_rdata),
    .dac_m_src_axi_rready(dac_m_src_axi_rready),
    .dac_m_src_axi_rvalid(dac_m_src_axi_rvalid),
    .dac_m_src_axi_rresp(dac_m_src_axi_rresp),
    .dac_m_src_axi_rlast(dac_m_src_axi_rlast)
  );

endmodule
