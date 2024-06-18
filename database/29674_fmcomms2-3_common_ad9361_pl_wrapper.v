// This program was cloned from: https://github.com/johnathan-convertino-afrl/fmcomms2-3
// License: MIT License

//******************************************************************************
/// @FILE    ad9361_pl_wrapper.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2023.11.02
/// @BRIEF   AD9361 core and support core wrapper.
///
/// @LICENSE MIT
///  Copyright 2023 Jay Convertino
///
///  Permission is hereby granted, free of charge, to any person obtaining a copy
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

module ad9361_pl_wrapper #(
    parameter FPGA_TECHNOLOGY = 0,
    parameter FPGA_FAMILY = 0,
    parameter SPEED_GRADE = 0,
    parameter DEV_PACKAGE = 0,
    parameter ADC_INIT_DELAY = 23,
    parameter DAC_INIT_DELAY = 0,
    parameter DELAY_REFCLK_FREQUENCY = 200,
    parameter DMA_AXI_PROTOCOL_TO_PS = 1, //1 = AXI3, 0 = AXI4
    parameter AXI_DMAC_ADC_ADDR = 32'h7C400000,
    parameter AXI_DMAC_DAC_ADDR = 32'h7C420000,
    parameter AXI_AD9361_ADDR = 32'h79020000
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

  //AD9361 AXI4LITE bus signals
  wire           ad9361_axi_awvalid;
  wire   [31:0]  ad9361_axi_awaddr;
  wire   [ 2:0]  ad9361_axi_awprot;
  wire           ad9361_axi_awready;
  wire           ad9361_axi_wvalid;
  wire   [31:0]  ad9361_axi_wdata;
  wire   [ 3:0]  ad9361_axi_wstrb;
  wire           ad9361_axi_wready;
  wire           ad9361_axi_bvalid;
  wire   [ 1:0]  ad9361_axi_bresp;
  wire           ad9361_axi_bready;
  wire           ad9361_axi_arvalid;
  wire   [31:0]  ad9361_axi_araddr;
  wire   [ 2:0]  ad9361_axi_arprot;
  wire           ad9361_axi_arready;
  wire           ad9361_axi_rvalid;
  wire   [31:0]  ad9361_axi_rdata;
  wire   [ 1:0]  ad9361_axi_rresp;
  wire           ad9361_axi_rready;

  //AD9361 general signals
  wire dac_r1_mode;
  wire adc_r1_mode;
  wire l_clk;

  //DAC DMA AXI4LITE bus signals
  wire           dac_dma_axi_awvalid;
  wire   [31:0]  dac_dma_axi_awaddr;
  wire   [ 2:0]  dac_dma_axi_awprot;
  wire           dac_dma_axi_awready;
  wire           dac_dma_axi_wvalid;
  wire   [31:0]  dac_dma_axi_wdata;
  wire   [ 3:0]  dac_dma_axi_wstrb;
  wire           dac_dma_axi_wready;
  wire           dac_dma_axi_bvalid;
  wire   [ 1:0]  dac_dma_axi_bresp;
  wire           dac_dma_axi_bready;
  wire           dac_dma_axi_arvalid;
  wire   [31:0]  dac_dma_axi_araddr;
  wire   [ 2:0]  dac_dma_axi_arprot;
  wire           dac_dma_axi_arready;
  wire           dac_dma_axi_rvalid;
  wire   [31:0]  dac_dma_axi_rdata;
  wire   [ 1:0]  dac_dma_axi_rresp;
  wire           dac_dma_axi_rready;

  //ADC DMA AXI4LITE bus signals
  wire           adc_dma_axi_awvalid;
  wire   [31:0]  adc_dma_axi_awaddr;
  wire   [ 2:0]  adc_dma_axi_awprot;
  wire           adc_dma_axi_awready;
  wire           adc_dma_axi_wvalid;
  wire   [31:0]  adc_dma_axi_wdata;
  wire   [ 3:0]  adc_dma_axi_wstrb;
  wire           adc_dma_axi_wready;
  wire           adc_dma_axi_bvalid;
  wire   [ 1:0]  adc_dma_axi_bresp;
  wire           adc_dma_axi_bready;
  wire           adc_dma_axi_arvalid;
  wire   [31:0]  adc_dma_axi_araddr;
  wire   [ 2:0]  adc_dma_axi_arprot;
  wire           adc_dma_axi_arready;
  wire           adc_dma_axi_rvalid;
  wire   [31:0]  adc_dma_axi_rdata;
  wire   [ 1:0]  adc_dma_axi_rresp;
  wire           adc_dma_axi_rready;

  //ADC FIFO signals to AD9361
  wire           adc_enable_i0;
  wire           adc_valid_i0;
  wire  [15:0]   adc_data_i0;
  wire           adc_enable_q0;
  wire           adc_valid_q0;
  wire  [15:0]   adc_data_q0;
  wire           adc_enable_i1;
  wire           adc_valid_i1;
  wire  [15:0]   adc_data_i1;
  wire           adc_enable_q1;
  wire           adc_valid_q1;
  wire  [15:0]   adc_data_q1;
  wire           din_ovf;

  //ADC FIFO signals to adc pack
  wire           fifo_adc_enable_i0;
  wire           fifo_adc_valid_i0;
  wire  [15:0]   fifo_adc_data_i0;
  wire           fifo_adc_enable_q0;
  wire           fifo_adc_valid_q0;
  wire  [15:0]   fifo_adc_data_q0;
  wire           fifo_adc_enable_i1;
  wire           fifo_adc_valid_i1;
  wire  [15:0]   fifo_adc_data_i1;
  wire           fifo_adc_enable_q1;
  wire           fifo_adc_valid_q1;
  wire  [15:0]   fifo_adc_data_q1;
  wire           fifo_dout_ovf;

  wire           fifo_wr_en;

  //ADC PACK signals to ADC DMA
  wire           fifo_m_axis_tvalid;
  wire [63:0]    fifo_m_axis_tdata;
  wire           fifo_m_axis_tready;
  wire           fifo_m_axis_tuser;

  //DAC FIFO signals to AD9361
  wire           dac_enable_i0;
  wire           dac_valid_i0;
  wire  [15:0]   dac_data_i0;
  wire           dac_enable_q0;
  wire           dac_valid_q0;
  wire  [15:0]   dac_data_q0;
  wire           dac_enable_i1;
  wire           dac_valid_i1;
  wire  [15:0]   dac_data_i1;
  wire           dac_enable_q1;
  wire           dac_valid_q1;
  wire  [15:0]   dac_data_q1;
  wire           dac_dunf;

  //DAC FIFO signals to upack
  wire           fifo_dac_enable_i0;
  wire           fifo_dac_valid_i0;
  wire  [15:0]   fifo_dac_data_i0;
  wire           fifo_dac_enable_q0;
  wire           fifo_dac_valid_q0;
  wire  [15:0]   fifo_dac_data_q0;
  wire           fifo_dac_enable_i1;
  wire           fifo_dac_valid_i1;
  wire  [15:0]   fifo_dac_data_i1;
  wire           fifo_dac_enable_q1;
  wire           fifo_dac_valid_q1;
  wire  [15:0]   fifo_dac_data_q1;
  wire           fifo_din_unf;
  wire           fifo_rd_valid;
  wire           fifo_din_enable_i0;
  wire           fifo_din_enable_q0;
  wire           fifo_din_enable_i1;
  wire           fifo_din_enable_q1;
  //DMA to upack signals
  wire           fifo_s_axis_valid;
  wire           fifo_s_axis_ready;
  wire  [63:0]   fifo_s_axis_data;

  //inst_clkdiv
  wire d_clk;

  //reset signals
  wire p_reset;
  wire p_aresetn;
  wire tdd_sync_cntr;
  wire ad_reset_o;

  //sync signals
  wire sync_out;

  //wiring
  assign tdd_sync_t = tdd_sync_cntr;
  assign tdd_sync_o = sync_out;

  assign fifo_wr_en = fifo_adc_valid_i0 | fifo_adc_valid_i1 | fifo_adc_valid_q0 | fifo_adc_valid_q1;

  axi_ad9361 #(
    // parameters
    .ID(0),
    .MODE_1R1T(0),
    .FPGA_TECHNOLOGY(FPGA_TECHNOLOGY),
    .FPGA_FAMILY(FPGA_FAMILY),
    .SPEED_GRADE(SPEED_GRADE),
    .DEV_PACKAGE(DEV_PACKAGE),
    .TDD_DISABLE(1),
    .PPS_RECEIVER_ENABLE(0),
    .CMOS_OR_LVDS_N(0),
    .ADC_INIT_DELAY(ADC_INIT_DELAY),
    .ADC_DATAPATH_DISABLE(0),
    .ADC_USERPORTS_DISABLE(0),
    .ADC_DATAFORMAT_DISABLE(0),
    .ADC_DCFILTER_DISABLE(0),
    .ADC_IQCORRECTION_DISABLE(0),
    .DAC_INIT_DELAY(DAC_INIT_DELAY),
    .DAC_CLK_EDGE_SEL(0),
    .DAC_IODELAY_ENABLE(0),
    .DAC_DATAPATH_DISABLE(0),
    .DAC_DDS_DISABLE(0),
    .DAC_DDS_TYPE(1),
    .DAC_DDS_CORDIC_DW(14),
    .DAC_DDS_CORDIC_PHASE_DW(13),
    .DAC_USERPORTS_DISABLE(0),
    .DAC_IQCORRECTION_DISABLE(0),
    .IO_DELAY_GROUP("dev_if_delay_group"),
    // .IODELAY_CTRL(1),
    .MIMO_ENABLE(0),
    .USE_SSI_CLK(1),
    .DELAY_REFCLK_FREQUENCY(DELAY_REFCLK_FREQUENCY),
    .RX_NODPA(0)
  ) inst_axi_ad9361 (

    // physical interface (receive-lvds)
    .rx_clk_in_p(rx_clk_in_p),
    .rx_clk_in_n(rx_clk_in_n),
    .rx_frame_in_p(rx_frame_in_p),
    .rx_frame_in_n(rx_frame_in_n),
    .rx_data_in_p(rx_data_in_p),
    .rx_data_in_n(rx_data_in_n),

    // physical interface (receive-cmos) NOT USED
    .rx_clk_in(1'b0),
    .rx_frame_in(1'b0),
    .rx_data_in(0),

    // physical interface (transmit-lvds)
    .tx_clk_out_p(tx_clk_out_p),
    .tx_clk_out_n(tx_clk_out_n),
    .tx_frame_out_p(tx_frame_out_p),
    .tx_frame_out_n(tx_frame_out_n),
    .tx_data_out_p(tx_data_out_p),
    .tx_data_out_n(tx_data_out_n),

    // physical interface (transmit-cmos) NOT USED
    .tx_clk_out(),
    .tx_frame_out(),
    .tx_data_out(),

    // ensm control
    .enable(enable),
    .txnrx(txnrx),

    // transmit master/slave NOT USED
    .dac_sync_in(1'b0),
    .dac_sync_out(),

    // tdd sync
    .tdd_sync(sync_out),
    .tdd_sync_cntr(tdd_sync_cntr),

    //gps NOT USED
    .gps_pps(1'b0),
    .gps_pps_irq(),

    // delay clock
    .delay_clk(delay_clk),

    // master interface
    .l_clk(l_clk),
    .clk(l_clk),
    .rst(ad_reset_o),

    // dma interface
    .adc_enable_i0(adc_enable_i0),
    .adc_valid_i0(adc_valid_i0),
    .adc_data_i0(adc_data_i0),
    .adc_enable_q0(adc_enable_q0),
    .adc_valid_q0(adc_valid_q0),
    .adc_data_q0(adc_data_q0),
    .adc_enable_i1(adc_enable_i1),
    .adc_valid_i1(adc_valid_i1),
    .adc_data_i1(adc_data_i1),
    .adc_enable_q1(adc_enable_q1),
    .adc_valid_q1(adc_valid_q1),
    .adc_data_q1(adc_data_q1),
    .adc_dovf(din_ovf),
    .adc_r1_mode(adc_r1_mode),

    .dac_enable_i0(dac_enable_i0),
    .dac_valid_i0(dac_valid_i0),
    .dac_data_i0(dac_data_i0),
    .dac_enable_q0(dac_enable_q0),
    .dac_valid_q0(dac_valid_q0),
    .dac_data_q0(dac_data_q0),
    .dac_enable_i1(dac_enable_i1),
    .dac_valid_i1(dac_valid_i1),
    .dac_data_i1(dac_data_i1),
    .dac_enable_q1(dac_enable_q1),
    .dac_valid_q1(dac_valid_q1),
    .dac_data_q1(dac_data_q1),
    .dac_dunf(dac_dunf),
    .dac_r1_mode(dac_r1_mode),

    // axi interface
    .s_axi_aclk(axi_aclk),
    .s_axi_aresetn(axi_aresetn),
    .s_axi_awvalid(ad9361_axi_awvalid),
    .s_axi_awaddr(ad9361_axi_awaddr[15:0]),
    .s_axi_awprot(ad9361_axi_awprot),
    .s_axi_awready(ad9361_axi_awready),
    .s_axi_wvalid(ad9361_axi_wvalid),
    .s_axi_wdata(ad9361_axi_wdata),
    .s_axi_wstrb(ad9361_axi_wstrb),
    .s_axi_wready(ad9361_axi_wready),
    .s_axi_bvalid(ad9361_axi_bvalid),
    .s_axi_bresp(ad9361_axi_bresp),
    .s_axi_bready(ad9361_axi_bready),
    .s_axi_arvalid(ad9361_axi_arvalid),
    .s_axi_araddr(ad9361_axi_araddr[15:0]),
    .s_axi_arprot(ad9361_axi_arprot),
    .s_axi_arready(ad9361_axi_arready),
    .s_axi_rvalid(ad9361_axi_rvalid),
    .s_axi_rdata(ad9361_axi_rdata),
    .s_axi_rresp(ad9361_axi_rresp),
    .s_axi_rready(ad9361_axi_rready),

    // gpio
    .up_enable(up_enable),
    .up_txnrx(up_txnrx),
    .up_dac_gpio_in(0),
    .up_dac_gpio_out(),
    .up_adc_gpio_in(0),
    .up_adc_gpio_out()
  );


  axi_dmac #(
    .ID(0),
    .DMA_DATA_WIDTH_SRC(64),
    .DMA_DATA_WIDTH_DEST(64),
    .DMA_LENGTH_WIDTH(24),
    .DMA_2D_TRANSFER(0),
    .ASYNC_CLK_REQ_SRC(1),
    .ASYNC_CLK_SRC_DEST(1),
    .ASYNC_CLK_DEST_REQ(0),
    .AXI_SLICE_DEST(0),
    .AXI_SLICE_SRC(0),
    .SYNC_TRANSFER_START(1),
    .CYCLIC(0),
    .DMA_AXI_PROTOCOL_DEST(DMA_AXI_PROTOCOL_TO_PS), //1 = AXI3, 0 = AXI4
    .DMA_AXI_PROTOCOL_SRC(1),
    .DMA_TYPE_DEST(0),
    .DMA_TYPE_SRC(1),
    .DMA_AXI_ADDR_WIDTH(32),
    .MAX_BYTES_PER_BURST(128),
    .FIFO_SIZE(8), // In bursts
    .AXI_ID_WIDTH_SRC(6),
    .AXI_ID_WIDTH_DEST(6),
    .DMA_AXIS_ID_W(8),
    .DMA_AXIS_DEST_W(4),
    .DISABLE_DEBUG_REGISTERS(0),
    .ENABLE_DIAGNOSTICS_IF(0),
    .ALLOW_ASYM_MEM(1)
    // .CACHE_COHERENT_DEST(0)
  ) inst_adc_axi_dmac (

    // Slave AXI interface
    .s_axi_aclk(axi_aclk),
    .s_axi_aresetn(axi_aresetn),

    .s_axi_awvalid(adc_dma_axi_awvalid),
    .s_axi_awaddr(adc_dma_axi_awaddr[10:0]),
    .s_axi_awready(adc_dma_axi_awready),
    .s_axi_awprot(adc_dma_axi_awprot),
    .s_axi_wvalid(adc_dma_axi_wvalid),
    .s_axi_wdata(adc_dma_axi_wdata),
    .s_axi_wstrb(adc_dma_axi_wstrb),
    .s_axi_wready(adc_dma_axi_wready),
    .s_axi_bvalid(adc_dma_axi_bvalid),
    .s_axi_bresp(adc_dma_axi_bresp),
    .s_axi_bready(adc_dma_axi_bready),
    .s_axi_arvalid(adc_dma_axi_arvalid),
    .s_axi_araddr(adc_dma_axi_araddr[10:0]),
    .s_axi_arready(adc_dma_axi_arready),
    .s_axi_arprot(adc_dma_axi_arprot),
    .s_axi_rvalid(adc_dma_axi_rvalid),
    .s_axi_rready(adc_dma_axi_rready),
    .s_axi_rresp(adc_dma_axi_rresp),
    .s_axi_rdata(adc_dma_axi_rdata),

    // Interrupt
    .irq(adc_dma_irq),

    // Master AXI interface
    .m_dest_axi_aclk(axi_aclk),
    .m_dest_axi_aresetn(axi_aresetn),

    // Write address
    .m_dest_axi_awaddr(adc_m_dest_axi_awaddr),
    .m_dest_axi_awlen(adc_m_dest_axi_awlen),
    .m_dest_axi_awsize(adc_m_dest_axi_awsize),
    .m_dest_axi_awburst(adc_m_dest_axi_awburst),
    .m_dest_axi_awprot(adc_m_dest_axi_awprot),
    .m_dest_axi_awcache(adc_m_dest_axi_awcache),
    .m_dest_axi_awvalid(adc_m_dest_axi_awvalid),
    .m_dest_axi_awready(adc_m_dest_axi_awready),
    .m_dest_axi_awid(),
    .m_dest_axi_awlock(),

    // Write data
    .m_dest_axi_wdata(adc_m_dest_axi_wdata),
    .m_dest_axi_wstrb(adc_m_dest_axi_wstrb),
    .m_dest_axi_wready(adc_m_dest_axi_wready),
    .m_dest_axi_wvalid(adc_m_dest_axi_wvalid),
    .m_dest_axi_wlast(adc_m_dest_axi_wlast),
    .m_dest_axi_wid(),

    // Write response
    .m_dest_axi_bvalid(adc_m_dest_axi_bvalid),
    .m_dest_axi_bresp(adc_m_dest_axi_bresp),
    .m_dest_axi_bready(adc_m_dest_axi_bready),
    .m_dest_axi_bid(1'b0),

    // Unused read interface
    .m_dest_axi_arvalid(),
    .m_dest_axi_araddr(),
    .m_dest_axi_arlen(),
    .m_dest_axi_arsize(),
    .m_dest_axi_arburst(),
    .m_dest_axi_arcache(),
    .m_dest_axi_arprot(),
    .m_dest_axi_arready(1'b0),
    .m_dest_axi_rvalid(1'b0),
    .m_dest_axi_rresp(0),
    .m_dest_axi_rdata(0),
    .m_dest_axi_rready(),
    .m_dest_axi_arid(),
    .m_dest_axi_arlock(),
    .m_dest_axi_rid(1'b0),
    .m_dest_axi_rlast(1'b0),

    // Master AXI interface
    .m_src_axi_aclk(1'b0),
    .m_src_axi_aresetn(1'b0),

    // Read address
    .m_src_axi_arready(1'b0),
    .m_src_axi_arvalid(),
    .m_src_axi_araddr(),
    .m_src_axi_arlen(),
    .m_src_axi_arsize(),
    .m_src_axi_arburst(),
    .m_src_axi_arprot(),
    .m_src_axi_arcache(),
    .m_src_axi_arid(),
    .m_src_axi_arlock(),

    // Read data and response
    .m_src_axi_rdata(0),
    .m_src_axi_rready(),
    .m_src_axi_rvalid(1'b0),
    .m_src_axi_rresp(0),
    .m_src_axi_rid(0),
    .m_src_axi_rlast(1'b0),

    // Unused write interface
    .m_src_axi_awvalid(),
    .m_src_axi_awaddr(),
    .m_src_axi_awlen(),
    .m_src_axi_awsize(),
    .m_src_axi_awburst(),
    .m_src_axi_awcache(),
    .m_src_axi_awprot(),
    .m_src_axi_awready(1'b0),
    .m_src_axi_wvalid(),
    .m_src_axi_wdata(),
    .m_src_axi_wstrb(),
    .m_src_axi_wlast(),
    .m_src_axi_wready(1'b0),
    .m_src_axi_bvalid(1'b0),
    .m_src_axi_bresp(0),
    .m_src_axi_bready(),
    .m_src_axi_awid(),
    .m_src_axi_awlock(),
    .m_src_axi_wid(),
    .m_src_axi_bid(1'b0),

    // Slave streaming AXI interface
    .s_axis_aclk(d_clk),
    .s_axis_ready(fifo_m_axis_tready),
    .s_axis_valid(fifo_m_axis_tvalid),
    .s_axis_data(fifo_m_axis_tdata),
    .s_axis_strb(0),
    .s_axis_keep(~0),
    .s_axis_user(fifo_m_axis_tuser),
    .s_axis_id(0),
    .s_axis_dest(0),
    .s_axis_last(1'b0),
    .s_axis_xfer_req(),

    // Master streaming AXI interface
    .m_axis_aclk(1'b0),
    .m_axis_ready(1'b0),
    .m_axis_valid(),
    .m_axis_data(),
    .m_axis_strb(),
    .m_axis_keep(),
    .m_axis_user(),
    .m_axis_id(),
    .m_axis_dest(),
    .m_axis_last(),
    .m_axis_xfer_req(),

    // Input FIFO interface
    .fifo_wr_clk(1'b0),
    .fifo_wr_en(1'b0),
    .fifo_wr_din(0),
    .fifo_wr_overflow(),
    .fifo_wr_sync(1'b0),
    .fifo_wr_xfer_req(),

    // Input FIFO interface
    .fifo_rd_clk(1'b0),
    .fifo_rd_en(1'b0),
    .fifo_rd_valid(),
    .fifo_rd_dout(),
    .fifo_rd_underflow(),
    .fifo_rd_xfer_req(),

    // Diagnostics interface
    .dest_diag_level_bursts()
  );

  axi_dmac #(
    .ID(0),
    .DMA_DATA_WIDTH_SRC(64),
    .DMA_DATA_WIDTH_DEST(64),
    .DMA_LENGTH_WIDTH(24),
    .DMA_2D_TRANSFER(0),
    .ASYNC_CLK_REQ_SRC(0),
    .ASYNC_CLK_SRC_DEST(1),
    .ASYNC_CLK_DEST_REQ(1),
    .AXI_SLICE_DEST(0),
    .AXI_SLICE_SRC(0),
    .SYNC_TRANSFER_START(0),
    .CYCLIC(1),
    .DMA_AXI_PROTOCOL_DEST(1),
    .DMA_AXI_PROTOCOL_SRC(DMA_AXI_PROTOCOL_TO_PS), //1 = AXI3, 0 = AXI4
    .DMA_TYPE_DEST(1),
    .DMA_TYPE_SRC(0),
    .DMA_AXI_ADDR_WIDTH(32),
    .MAX_BYTES_PER_BURST(128),
    .FIFO_SIZE(8), // In bursts
    .AXI_ID_WIDTH_SRC(6),
    .AXI_ID_WIDTH_DEST(6),
    .DMA_AXIS_ID_W(8),
    .DMA_AXIS_DEST_W(4),
    .DISABLE_DEBUG_REGISTERS(0),
    .ENABLE_DIAGNOSTICS_IF(0),
    .ALLOW_ASYM_MEM(1)
    // .CACHE_COHERENT_DEST(0)
  ) inst_dac_axi_dmac (
    // Slave AXI interface
    .s_axi_aclk(axi_aclk),
    .s_axi_aresetn(axi_aresetn),

    .s_axi_awvalid(dac_dma_axi_awvalid),
    .s_axi_awaddr(dac_dma_axi_awaddr[10:0]),
    .s_axi_awready(dac_dma_axi_awready),
    .s_axi_awprot(dac_dma_axi_awprot),
    .s_axi_wvalid(dac_dma_axi_wvalid),
    .s_axi_wdata(dac_dma_axi_wdata),
    .s_axi_wstrb(dac_dma_axi_wstrb),
    .s_axi_wready(dac_dma_axi_wready),
    .s_axi_bvalid(dac_dma_axi_bvalid),
    .s_axi_bresp(dac_dma_axi_bresp),
    .s_axi_bready(dac_dma_axi_bready),
    .s_axi_arvalid(dac_dma_axi_arvalid),
    .s_axi_araddr(dac_dma_axi_araddr[10:0]),
    .s_axi_arready(dac_dma_axi_arready),
    .s_axi_arprot(dac_dma_axi_arprot),
    .s_axi_rvalid(dac_dma_axi_rvalid),
    .s_axi_rready(dac_dma_axi_rready),
    .s_axi_rresp(dac_dma_axi_rresp),
    .s_axi_rdata(dac_dma_axi_rdata),

    // Interrupt
    .irq(dac_dma_irq),

    // Master AXI interface
    .m_dest_axi_aclk(1'b0),
    .m_dest_axi_aresetn(1'b0),

    // Write address
    .m_dest_axi_awaddr(),
    .m_dest_axi_awlen(),
    .m_dest_axi_awsize(),
    .m_dest_axi_awburst(),
    .m_dest_axi_awprot(),
    .m_dest_axi_awcache(),
    .m_dest_axi_awvalid(),
    .m_dest_axi_awready(1'b0),
    .m_dest_axi_awid(),
    .m_dest_axi_awlock(),

    // Write data
    .m_dest_axi_wdata(),
    .m_dest_axi_wstrb(),
    .m_dest_axi_wready(1'b0),
    .m_dest_axi_wvalid(),
    .m_dest_axi_wlast(),
    .m_dest_axi_wid(),

    // Write response
    .m_dest_axi_bvalid(1'b0),
    .m_dest_axi_bresp(0),
    .m_dest_axi_bready(),
    .m_dest_axi_bid(0),

    // Unused read interface
    .m_dest_axi_arvalid(),
    .m_dest_axi_araddr(),
    .m_dest_axi_arlen(),
    .m_dest_axi_arsize(),
    .m_dest_axi_arburst(),
    .m_dest_axi_arcache(),
    .m_dest_axi_arprot(),
    .m_dest_axi_arready(1'b0),
    .m_dest_axi_rvalid(1'b0),
    .m_dest_axi_rresp(0),
    .m_dest_axi_rdata(0),
    .m_dest_axi_rready(),
    .m_dest_axi_arid(),
    .m_dest_axi_arlock(),
    .m_dest_axi_rid(0),
    .m_dest_axi_rlast(1'b0),

    // Master AXI interface
    .m_src_axi_aclk(axi_aclk),
    .m_src_axi_aresetn(axi_aresetn),

    // Read address
    .m_src_axi_arready(dac_m_src_axi_araddr),
    .m_src_axi_arvalid(dac_m_src_axi_arvalid),
    .m_src_axi_araddr(dac_m_src_axi_araddr),
    .m_src_axi_arlen(dac_m_src_axi_arlen),
    .m_src_axi_arsize(dac_m_src_axi_arsize),
    .m_src_axi_arburst(dac_m_src_axi_arburst),
    .m_src_axi_arprot(dac_m_src_axi_arprot),
    .m_src_axi_arcache(dac_m_src_axi_arcache),
    .m_src_axi_arid(),        //not connected in gen
    .m_src_axi_arlock(),    //not connected in gen

    // Read data and response
    .m_src_axi_rdata(dac_m_src_axi_rdata),
    .m_src_axi_rready(dac_m_src_axi_rready),
    .m_src_axi_rvalid(dac_m_src_axi_rvalid),
    .m_src_axi_rresp(dac_m_src_axi_rresp),
    .m_src_axi_rid(1'b0),        //1'b0?
    .m_src_axi_rlast(dac_m_src_axi_rlast),

    // Unused write interface
    .m_src_axi_awvalid(),
    .m_src_axi_awaddr(),
    .m_src_axi_awlen(),
    .m_src_axi_awsize(),
    .m_src_axi_awburst(),
    .m_src_axi_awcache(),
    .m_src_axi_awprot(),
    .m_src_axi_awready(1'b0),
    .m_src_axi_wvalid(),
    .m_src_axi_wdata(),
    .m_src_axi_wstrb(),
    .m_src_axi_wlast(),
    .m_src_axi_wready(1'b0),
    .m_src_axi_bvalid(1'b0),
    .m_src_axi_bresp(0),
    .m_src_axi_bready(),
    .m_src_axi_awid(),
    .m_src_axi_awlock(),
    .m_src_axi_wid(),
    .m_src_axi_bid(1'b0),

    // Slave streaming AXI interface
    .s_axis_aclk(1'b0),
    .s_axis_ready(),
    .s_axis_valid(1'b0),
    .s_axis_data(0),
    .s_axis_strb(0),
    .s_axis_keep(0),
    .s_axis_user(1'b1),
    .s_axis_id(0),
    .s_axis_dest(0),
    .s_axis_last(1'b0),
    .s_axis_xfer_req(),

    // Master streaming AXI interface
    .m_axis_aclk(d_clk),
    .m_axis_ready(fifo_s_axis_ready),
    .m_axis_valid(fifo_s_axis_valid),
    .m_axis_data(fifo_s_axis_data),
    .m_axis_strb(), //signals?
    .m_axis_keep(), //signals?
    .m_axis_user(), //signals?
    .m_axis_id(),   //signals?
    .m_axis_dest(), //signals?
    .m_axis_last(), //signals?
    .m_axis_xfer_req(), //signals?

    // Input FIFO interface
    .fifo_wr_clk(1'b0),
    .fifo_wr_en(1'b0),
    .fifo_wr_din(0),
    .fifo_wr_overflow(),
    .fifo_wr_sync(1'b1),
    .fifo_wr_xfer_req(),

    // Input FIFO interface
    .fifo_rd_clk(1'b0),
    .fifo_rd_en(1'b0),
    .fifo_rd_valid(),
    .fifo_rd_dout(),
    .fifo_rd_underflow(),
    .fifo_rd_xfer_req(),

    // Diagnostics interface
    .dest_diag_level_bursts()
  );

  util_cpack2_axis #(
    .NUM_OF_CHANNELS(4),
    .SAMPLES_PER_CHANNEL(1),
    .SAMPLE_DATA_WIDTH(16)
  ) inst_adc_cpack (

    .clk(d_clk),
    .reset(p_reset),

    .enable_0(fifo_adc_enable_i0),
    .enable_1(fifo_adc_enable_q0),
    .enable_2(fifo_adc_enable_i1),
    .enable_3(fifo_adc_enable_q1),
    .enable_4(1'b0),
    .enable_5(1'b0),
    .enable_6(1'b0),
    .enable_7(1'b0),
    .enable_8(1'b0),
    .enable_9(1'b0),
    .enable_10(1'b0),
    .enable_11(1'b0),
    .enable_12(1'b0),
    .enable_13(1'b0),
    .enable_14(1'b0),
    .enable_15(1'b0),
    .enable_16(1'b0),
    .enable_17(1'b0),
    .enable_18(1'b0),
    .enable_19(1'b0),
    .enable_20(1'b0),
    .enable_21(1'b0),
    .enable_22(1'b0),
    .enable_23(1'b0),
    .enable_24(1'b0),
    .enable_25(1'b0),
    .enable_26(1'b0),
    .enable_27(1'b0),
    .enable_28(1'b0),
    .enable_29(1'b0),
    .enable_30(1'b0),
    .enable_31(1'b0),
    .enable_32(1'b0),
    .enable_33(1'b0),
    .enable_34(1'b0),
    .enable_35(1'b0),
    .enable_36(1'b0),
    .enable_37(1'b0),
    .enable_38(1'b0),
    .enable_39(1'b0),
    .enable_40(1'b0),
    .enable_41(1'b0),
    .enable_42(1'b0),
    .enable_43(1'b0),
    .enable_44(1'b0),
    .enable_45(1'b0),
    .enable_46(1'b0),
    .enable_47(1'b0),
    .enable_48(1'b0),
    .enable_49(1'b0),
    .enable_50(1'b0),
    .enable_51(1'b0),
    .enable_52(1'b0),
    .enable_53(1'b0),
    .enable_54(1'b0),
    .enable_55(1'b0),
    .enable_56(1'b0),
    .enable_57(1'b0),
    .enable_58(1'b0),
    .enable_59(1'b0),
    .enable_60(1'b0),
    .enable_61(1'b0),
    .enable_62(1'b0),
    .enable_63(1'b0),

    .fifo_wr_en(fifo_wr_en),
    .fifo_wr_overflow(fifo_dout_ovf),

    .fifo_wr_data_0(fifo_adc_data_i0),
    .fifo_wr_data_1(fifo_adc_data_q0),
    .fifo_wr_data_2(fifo_adc_data_i1),
    .fifo_wr_data_3(fifo_adc_data_q1),
    .fifo_wr_data_4(0),
    .fifo_wr_data_5(0),
    .fifo_wr_data_6(0),
    .fifo_wr_data_7(0),
    .fifo_wr_data_8(0),
    .fifo_wr_data_9(0),
    .fifo_wr_data_10(0),
    .fifo_wr_data_11(0),
    .fifo_wr_data_12(0),
    .fifo_wr_data_13(0),
    .fifo_wr_data_14(0),
    .fifo_wr_data_15(0),
    .fifo_wr_data_16(0),
    .fifo_wr_data_17(0),
    .fifo_wr_data_18(0),
    .fifo_wr_data_19(0),
    .fifo_wr_data_20(0),
    .fifo_wr_data_21(0),
    .fifo_wr_data_22(0),
    .fifo_wr_data_23(0),
    .fifo_wr_data_24(0),
    .fifo_wr_data_25(0),
    .fifo_wr_data_26(0),
    .fifo_wr_data_27(0),
    .fifo_wr_data_28(0),
    .fifo_wr_data_29(0),
    .fifo_wr_data_30(0),
    .fifo_wr_data_31(0),
    .fifo_wr_data_32(0),
    .fifo_wr_data_33(0),
    .fifo_wr_data_34(0),
    .fifo_wr_data_35(0),
    .fifo_wr_data_36(0),
    .fifo_wr_data_37(0),
    .fifo_wr_data_38(0),
    .fifo_wr_data_39(0),
    .fifo_wr_data_40(0),
    .fifo_wr_data_41(0),
    .fifo_wr_data_42(0),
    .fifo_wr_data_43(0),
    .fifo_wr_data_44(0),
    .fifo_wr_data_45(0),
    .fifo_wr_data_46(0),
    .fifo_wr_data_47(0),
    .fifo_wr_data_48(0),
    .fifo_wr_data_49(0),
    .fifo_wr_data_50(0),
    .fifo_wr_data_51(0),
    .fifo_wr_data_52(0),
    .fifo_wr_data_53(0),
    .fifo_wr_data_54(0),
    .fifo_wr_data_55(0),
    .fifo_wr_data_56(0),
    .fifo_wr_data_57(0),
    .fifo_wr_data_58(0),
    .fifo_wr_data_59(0),
    .fifo_wr_data_60(0),
    .fifo_wr_data_61(0),
    .fifo_wr_data_62(0),
    .fifo_wr_data_63(0),

    .m_axis_tdata(fifo_m_axis_tdata),
    .m_axis_tvalid(fifo_m_axis_tvalid),
    .m_axis_tready(fifo_m_axis_tready),
    .m_axis_tuser(fifo_m_axis_tuser)
  );

  util_upack2 #(
    .NUM_OF_CHANNELS(4),
    .SAMPLES_PER_CHANNEL(1),
    .SAMPLE_DATA_WIDTH(16)
  ) inst_dac_upack (

    .clk(d_clk),
    .reset(p_reset),

    .enable_0(fifo_din_enable_i0),
    .enable_1(fifo_din_enable_q0),
    .enable_2(fifo_din_enable_i1),
    .enable_3(fifo_din_enable_q1),
    .enable_4(1'b0),
    .enable_5(1'b0),
    .enable_6(1'b0),
    .enable_7(1'b0),
    .enable_8(1'b0),
    .enable_9(1'b0),
    .enable_10(1'b0),
    .enable_11(1'b0),
    .enable_12(1'b0),
    .enable_13(1'b0),
    .enable_14(1'b0),
    .enable_15(1'b0),
    .enable_16(1'b0),
    .enable_17(1'b0),
    .enable_18(1'b0),
    .enable_19(1'b0),
    .enable_20(1'b0),
    .enable_21(1'b0),
    .enable_22(1'b0),
    .enable_23(1'b0),
    .enable_24(1'b0),
    .enable_25(1'b0),
    .enable_26(1'b0),
    .enable_27(1'b0),
    .enable_28(1'b0),
    .enable_29(1'b0),
    .enable_30(1'b0),
    .enable_31(1'b0),
    .enable_32(1'b0),
    .enable_33(1'b0),
    .enable_34(1'b0),
    .enable_35(1'b0),
    .enable_36(1'b0),
    .enable_37(1'b0),
    .enable_38(1'b0),
    .enable_39(1'b0),
    .enable_40(1'b0),
    .enable_41(1'b0),
    .enable_42(1'b0),
    .enable_43(1'b0),
    .enable_44(1'b0),
    .enable_45(1'b0),
    .enable_46(1'b0),
    .enable_47(1'b0),
    .enable_48(1'b0),
    .enable_49(1'b0),
    .enable_50(1'b0),
    .enable_51(1'b0),
    .enable_52(1'b0),
    .enable_53(1'b0),
    .enable_54(1'b0),
    .enable_55(1'b0),
    .enable_56(1'b0),
    .enable_57(1'b0),
    .enable_58(1'b0),
    .enable_59(1'b0),
    .enable_60(1'b0),
    .enable_61(1'b0),
    .enable_62(1'b0),
    .enable_63(1'b0),

    .fifo_rd_en(fifo_dac_valid_i0 | fifo_dac_valid_q0 | fifo_dac_valid_i1 | fifo_dac_valid_q1),
    .fifo_rd_valid(fifo_rd_valid),
    .fifo_rd_underflow(fifo_din_unf),

    .fifo_rd_data_0(fifo_dac_data_i0),
    .fifo_rd_data_1(fifo_dac_data_q0),
    .fifo_rd_data_2(fifo_dac_data_i1),
    .fifo_rd_data_3(fifo_dac_data_q1),
    .fifo_rd_data_4(),
    .fifo_rd_data_5(),
    .fifo_rd_data_6(),
    .fifo_rd_data_7(),
    .fifo_rd_data_8(),
    .fifo_rd_data_9(),
    .fifo_rd_data_10(),
    .fifo_rd_data_11(),
    .fifo_rd_data_12(),
    .fifo_rd_data_13(),
    .fifo_rd_data_14(),
    .fifo_rd_data_15(),
    .fifo_rd_data_16(),
    .fifo_rd_data_17(),
    .fifo_rd_data_18(),
    .fifo_rd_data_19(),
    .fifo_rd_data_20(),
    .fifo_rd_data_21(),
    .fifo_rd_data_22(),
    .fifo_rd_data_23(),
    .fifo_rd_data_24(),
    .fifo_rd_data_25(),
    .fifo_rd_data_26(),
    .fifo_rd_data_27(),
    .fifo_rd_data_28(),
    .fifo_rd_data_29(),
    .fifo_rd_data_30(),
    .fifo_rd_data_31(),
    .fifo_rd_data_32(),
    .fifo_rd_data_33(),
    .fifo_rd_data_34(),
    .fifo_rd_data_35(),
    .fifo_rd_data_36(),
    .fifo_rd_data_37(),
    .fifo_rd_data_38(),
    .fifo_rd_data_39(),
    .fifo_rd_data_40(),
    .fifo_rd_data_41(),
    .fifo_rd_data_42(),
    .fifo_rd_data_43(),
    .fifo_rd_data_44(),
    .fifo_rd_data_45(),
    .fifo_rd_data_46(),
    .fifo_rd_data_47(),
    .fifo_rd_data_48(),
    .fifo_rd_data_49(),
    .fifo_rd_data_50(),
    .fifo_rd_data_51(),
    .fifo_rd_data_52(),
    .fifo_rd_data_53(),
    .fifo_rd_data_54(),
    .fifo_rd_data_55(),
    .fifo_rd_data_56(),
    .fifo_rd_data_57(),
    .fifo_rd_data_58(),
    .fifo_rd_data_59(),
    .fifo_rd_data_60(),
    .fifo_rd_data_61(),
    .fifo_rd_data_62(),
    .fifo_rd_data_63(),

    .s_axis_valid(fifo_s_axis_valid),
    .s_axis_ready(fifo_s_axis_ready),
    .s_axis_data(fifo_s_axis_data)
  );

  util_rfifo #(
    .NUM_OF_CHANNELS(4),
    .DIN_DATA_WIDTH(16),
    .DOUT_DATA_WIDTH(16),
    .DIN_ADDRESS_WIDTH(4)
  ) inst_dac_fifo (

    // d-in interface

    .din_rstn(p_aresetn),
    .din_clk(d_clk),
    .din_enable_0(fifo_din_enable_i0),
    .din_valid_0(fifo_dac_valid_i0),
    .din_valid_in_0(fifo_rd_valid),
    .din_data_0(fifo_dac_data_i0),
    .din_enable_1(fifo_din_enable_q0),
    .din_valid_1(fifo_dac_valid_q0),
    .din_valid_in_1(fifo_rd_valid),
    .din_data_1(fifo_dac_data_q0),
    .din_enable_2(fifo_din_enable_i1),
    .din_valid_2(fifo_dac_valid_i1),
    .din_valid_in_2(fifo_rd_valid),
    .din_data_2(fifo_dac_data_i1),
    .din_enable_3(fifo_din_enable_q1),
    .din_valid_3(fifo_dac_valid_q1),
    .din_valid_in_3(fifo_rd_valid),
    .din_data_3(fifo_dac_data_q1),
    .din_enable_4(),
    .din_valid_4(),
    .din_valid_in_4(1'b0),
    .din_data_4(0),
    .din_enable_5(),
    .din_valid_5(),
    .din_valid_in_5(1'b0),
    .din_data_5(0),
    .din_enable_6(),
    .din_valid_6(),
    .din_valid_in_6(1'b0),
    .din_data_6(0),
    .din_enable_7(),
    .din_valid_7(),
    .din_valid_in_7(1'b0),
    .din_data_7(0),
    .din_unf(fifo_din_unf),

    // d-out interface

    .dout_rst(ad_reset_o),
    .dout_clk(l_clk),
    .dout_enable_0(dac_enable_i0),
    .dout_valid_0(dac_valid_i0),
    .dout_valid_out_0(),
    .dout_data_0(dac_data_i0),
    .dout_enable_1(dac_enable_q0),
    .dout_valid_1(dac_valid_q0),
    .dout_valid_out_1(),
    .dout_data_1(dac_data_q0),
    .dout_enable_2(dac_enable_i1),
    .dout_valid_2(dac_valid_i1),
    .dout_valid_out_2(),
    .dout_data_2(dac_data_i1),
    .dout_enable_3(dac_enable_q1),
    .dout_valid_3(dac_valid_q1),
    .dout_valid_out_3(),
    .dout_data_3(dac_data_q1),
    .dout_enable_4(1'b0),
    .dout_valid_4(1'b0),
    .dout_valid_out_4(),
    .dout_data_4(),
    .dout_enable_5(1'b0),
    .dout_valid_5(1'b0),
    .dout_valid_out_5(),
    .dout_data_5(),
    .dout_enable_6(1'b0),
    .dout_valid_6(1'b0),
    .dout_valid_out_6(),
    .dout_data_6(),
    .dout_enable_7(1'b0),
    .dout_valid_7(1'b0),
    .dout_valid_out_7(),
    .dout_data_7(),
    .dout_unf(dac_dunf)
  );

  util_wfifo #(
    .NUM_OF_CHANNELS(4),
    .DIN_DATA_WIDTH(16),
    .DOUT_DATA_WIDTH(16),
    .DIN_ADDRESS_WIDTH(4)
    ) inst_adc_fifo (

    // d-in interface

    .din_rst(ad_reset_o),
    .din_clk(l_clk),
    .din_enable_0(adc_enable_i0),
    .din_valid_0(adc_valid_i0),
    .din_data_0(adc_data_i0),
    .din_enable_1(adc_enable_q0),
    .din_valid_1(adc_valid_q0),
    .din_data_1(adc_data_q0),
    .din_enable_2(adc_enable_i1),
    .din_valid_2(adc_valid_i1),
    .din_data_2(adc_data_i1),
    .din_enable_3(adc_enable_q1),
    .din_valid_3(adc_valid_q1),
    .din_data_3(adc_data_q1),
    .din_enable_4(1'b0),
    .din_valid_4(1'b0),
    .din_data_4(0),
    .din_enable_5(1'b0),
    .din_valid_5(1'b0),
    .din_data_5(0),
    .din_enable_6(1'b0),
    .din_valid_6(1'b0),
    .din_data_6(0),
    .din_enable_7(1'b0),
    .din_valid_7(1'b0),
    .din_data_7(0),
    .din_ovf(din_ovf),

    // d-out interface

    .dout_rstn(p_aresetn),
    .dout_clk(d_clk),
    .dout_enable_0(fifo_adc_enable_i0),
    .dout_valid_0(fifo_adc_valid_i0),
    .dout_data_0(fifo_adc_data_i0),
    .dout_enable_1(fifo_adc_enable_q0),
    .dout_valid_1(fifo_adc_valid_q0),
    .dout_data_1(fifo_adc_data_q0),
    .dout_enable_2(fifo_adc_enable_i1),
    .dout_valid_2(fifo_adc_valid_i1),
    .dout_data_2(fifo_adc_data_i1),
    .dout_enable_3(fifo_adc_enable_q1),
    .dout_valid_3(fifo_adc_valid_q1),
    .dout_data_3(fifo_adc_data_q1),
    .dout_enable_4(),
    .dout_valid_4(),
    .dout_data_4(),
    .dout_enable_5(),
    .dout_valid_5(),
    .dout_data_5(),
    .dout_enable_6(),
    .dout_valid_6(),
    .dout_data_6(),
    .dout_enable_7(),
    .dout_valid_7(),
    .dout_data_7(),
    .dout_ovf(fifo_dout_ovf)
  );

  util_clkdiv inst_clkdiv (
    .clk(l_clk),
    .clk_sel(adc_r1_mode & dac_r1_mode),
    .clk_out(d_clk)
  );

  util_tdd_sync #(
    .TDD_SYNC_PERIOD(100000000)
    ) isnt_util_tdd_sync (
    .clk(axi_aclk),
    .rstn(axi_aresetn),
    .sync_mode(tdd_sync_cntr),
    .sync_in(tdd_sync_i),
    .sync_out(sync_out)
  );

  ad_rst inst_ad_reset (
    .rst_async(~axi_aresetn),
    .clk(d_clk),
    .rstn(p_aresetn),
    .rst(p_reset)
  );

  axilxbar #(
    .C_AXI_DATA_WIDTH(32),
    .C_AXI_ADDR_WIDTH(32),
    .NM(1),
    .NS(3),
    .SLAVE_ADDR({{AXI_DMAC_ADC_ADDR},{AXI_DMAC_DAC_ADDR},{AXI_AD9361_ADDR}}),
    .SLAVE_MASK({{32'hFFFFF000},{32'hFFFFF000},{32'hFFFF0000}})
  ) inst_axilxbar (
    .S_AXI_ACLK(axi_aclk),
    .S_AXI_ARESETN(axi_aresetn),
    .S_AXI_AWADDR(s_axi_awaddr),
    .S_AXI_AWPROT(s_axi_awprot),
    .S_AXI_AWVALID(s_axi_awvalid),
    .S_AXI_AWREADY(s_axi_awready),
    .S_AXI_WDATA(s_axi_wdata),
    .S_AXI_WSTRB(s_axi_wstrb),
    .S_AXI_WVALID(s_axi_wvalid),
    .S_AXI_WREADY(s_axi_wready),
    .S_AXI_BRESP(s_axi_bresp),
    .S_AXI_BVALID(s_axi_bvalid),
    .S_AXI_BREADY(s_axi_bready),
    .S_AXI_ARADDR(s_axi_araddr),
    .S_AXI_ARPROT(s_axi_arprot),
    .S_AXI_ARVALID(s_axi_arvalid),
    .S_AXI_ARREADY(s_axi_arready),
    .S_AXI_RDATA(s_axi_rdata),
    .S_AXI_RRESP(s_axi_rresp),
    .S_AXI_RVALID(s_axi_rvalid),
    .S_AXI_RREADY(s_axi_rready),
    .M_AXI_AWADDR({adc_dma_axi_awaddr, dac_dma_axi_awaddr, ad9361_axi_awaddr}),
    .M_AXI_AWPROT({adc_dma_axi_awprot, dac_dma_axi_awprot, ad9361_axi_awprot}),
    .M_AXI_AWVALID({adc_dma_axi_awvalid, dac_dma_axi_awvalid, ad9361_axi_awvalid}),
    .M_AXI_AWREADY({adc_dma_axi_awready, dac_dma_axi_awready, ad9361_axi_awready}),
    .M_AXI_WDATA({adc_dma_axi_wdata, dac_dma_axi_wdata, ad9361_axi_wdata}),
    .M_AXI_WSTRB({adc_dma_axi_wstrb, dac_dma_axi_wstrb, ad9361_axi_wstrb}),
    .M_AXI_WVALID({adc_dma_axi_wvalid, dac_dma_axi_wvalid, ad9361_axi_wvalid}),
    .M_AXI_WREADY({adc_dma_axi_wready, dac_dma_axi_wready, ad9361_axi_wready}),
    .M_AXI_BRESP({adc_dma_axi_bresp, dac_dma_axi_bresp, ad9361_axi_bresp}),
    .M_AXI_BVALID({adc_dma_axi_bvalid, dac_dma_axi_bvalid, ad9361_axi_bvalid}),
    .M_AXI_BREADY({adc_dma_axi_bready, dac_dma_axi_bready, ad9361_axi_bready}),
    .M_AXI_ARADDR({adc_dma_axi_araddr, dac_dma_axi_araddr, ad9361_axi_araddr}),
    .M_AXI_ARPROT({adc_dma_axi_arprot, dac_dma_axi_arprot, ad9361_axi_arprot}),
    .M_AXI_ARVALID({adc_dma_axi_arvalid, dac_dma_axi_arvalid, ad9361_axi_arvalid}),
    .M_AXI_ARREADY({adc_dma_axi_arready, dac_dma_axi_arready, ad9361_axi_arready}),
    .M_AXI_RDATA({adc_dma_axi_rdata, dac_dma_axi_rdata, ad9361_axi_rdata}),
    .M_AXI_RRESP({adc_dma_axi_rresp, dac_dma_axi_rresp, ad9361_axi_rresp}),
    .M_AXI_RVALID({adc_dma_axi_rvalid, dac_dma_axi_rvalid, ad9361_axi_rvalid}),
    .M_AXI_RREADY({adc_dma_axi_rready, dac_dma_axi_rready, ad9361_axi_rready})
  );

endmodule
