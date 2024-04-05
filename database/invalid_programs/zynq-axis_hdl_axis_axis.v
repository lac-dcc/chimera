/*
 * Module:
 *  axis
 *
 * Description:
 *  The axis module instantiates the AXI read and write path modules.
 *
 * Created:
 *  Fri Nov  7 23:07:05 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _axis_
`define _axis_


`include "axis_write.v"
`include "axis_read.v"

module axis #(
    parameter
    BUF_CFG_AWIDTH  = 5,
    BUF_AWIDTH      = 9,

    CFG_ID_WR       = 1,
    CFG_ID_RD       = 2,
    CFG_ADDR        = 23,
    CFG_DATA        = 24,
    CFG_AWIDTH      = 5,
    CFG_DWIDTH      = 32,

    STREAM_WIDTH    = 32,

    AXI_ID_WIDTH    = 8,
    AXI_LEN_WIDTH   = 8,
    AXI_ADDR_WIDTH  = 32,
    AXI_DATA_WIDTH  = 256)
   (input                               clk,
    input                               rst,

    // configuation
    input       [CFG_AWIDTH-1:0]        cfg_addr,
    input       [CFG_DWIDTH-1:0]        cfg_data,
    input                               cfg_valid,

    // stream interface
    input                               wr_valid,
    input       [STREAM_WIDTH-1:0]      wr_data,
    output                              wr_ready,

    output                              rd_valid,
    output      [STREAM_WIDTH-1:0]      rd_data,
    input                               rd_ready,

    // AXI write address channel signals
    input                               axi_awready,
    output      [AXI_ID_WIDTH-1:0]      axi_awid,
    output      [AXI_ADDR_WIDTH-1:0]    axi_awaddr,
    output      [AXI_LEN_WIDTH-1:0]     axi_awlen,
    output      [2:0]                   axi_awsize,
    output      [1:0]                   axi_awburst,
    output                              axi_awlock,
    output      [3:0]                   axi_awcache,
    output      [2:0]                   axi_awprot,
    output      [3:0]                   axi_awqos,
    output                              axi_awvalid,

    // AXI write data channel signals
    input                               axi_wready,
    output      [AXI_ID_WIDTH-1:0]      axi_wid,
    output      [AXI_DATA_WIDTH-1:0]    axi_wdata,
    output      [AXI_DATA_WIDTH/8-1:0]  axi_wstrb,
    output                              axi_wlast,
    output                              axi_wvalid,

    // AXI write response channel signals
    input       [AXI_ID_WIDTH-1:0]      axi_bid,
    input       [1:0]                   axi_bresp,
    input                               axi_bvalid,
    output                              axi_bready,

    // AXI read address channel signals
    input                               axi_arready,
    output      [AXI_ID_WIDTH-1:0]      axi_arid,
    output      [AXI_ADDR_WIDTH-1:0]    axi_araddr,
    output      [AXI_LEN_WIDTH-1:0]     axi_arlen,
    output      [2:0]                   axi_arsize,
    output      [1:0]                   axi_arburst,
    output      [1:0]                   axi_arlock,
    output      [3:0]                   axi_arcache,
    output      [2:0]                   axi_arprot,
    output                              axi_arvalid,
    output      [3:0]                   axi_arqos,

    // AXI read data channel signals
    input       [AXI_ID_WIDTH-1:0]      axi_rid,
    input       [1:0]                   axi_rresp,
    input                               axi_rvalid,
    input       [AXI_DATA_WIDTH-1:0]    axi_rdata,
    input                               axi_rlast,
    output                              axi_rready
);


    /**
     * Local parameters
     */

    localparam BURST_SIZE =
        ( 1 == (AXI_DATA_WIDTH/8)) ? 3'h0 :
        ( 2 == (AXI_DATA_WIDTH/8)) ? 3'h1 :
        ( 4 == (AXI_DATA_WIDTH/8)) ? 3'h2 :
        ( 8 == (AXI_DATA_WIDTH/8)) ? 3'h3 :
        (16 == (AXI_DATA_WIDTH/8)) ? 3'h4 :
        (32 == (AXI_DATA_WIDTH/8)) ? 3'h5 :
        (64 == (AXI_DATA_WIDTH/8)) ? 3'h6 : 3'h7;


    /**
     * Implementation
     */

    reg  [CFG_AWIDTH-1:0]   cfg_addr_r;
    reg  [CFG_DWIDTH-1:0]   cfg_data_r;
    reg                     cfg_valid_r;


    // register for improved timing
    always @(posedge clk)
        if (rst)    cfg_valid_r <= 1'b0;
        else        cfg_valid_r <= cfg_valid;


    // register for improved timing
    always @(posedge clk) begin
        cfg_addr_r <= cfg_addr;
        cfg_data_r <= cfg_data;
    end


    // write path static values
    assign axi_awlock   = 1'h0; // NORMAL_ACCESS
    assign axi_awcache  = 4'h0; // NON_CACHE_NON_BUFFER
    assign axi_awprot   = 3'h0; // DATA_SECURE_NORMAL
    assign axi_awburst  = 2'h1; // INCREMENTING
    assign axi_awqos    = 4'h0; // NOT_QOS_PARTICIPANT
    assign axi_awsize   = BURST_SIZE;
    assign axi_wstrb    = {(AXI_DATA_WIDTH/8){1'b1}};

    // read path static values
    assign axi_arlock   = 2'h0; // NORMAL_ACCESS
    assign axi_arcache  = 4'h0; // NON_CACHE_NON_BUFFER
    assign axi_arprot   = 3'h0; // DATA_SECURE_NORMAL
    assign axi_arburst  = 2'h1; // INCREMENTING
    assign axi_arqos    = 4'h0; // NOT_QOS_PARTICIPANT
    assign axi_arsize   = BURST_SIZE;


    //  assume that all writes are successful and therefore do not need to
    //  check the write response
    assign axi_bready = 1'b1;


    axis_write #(
        .BUF_CFG_AWIDTH (BUF_CFG_AWIDTH),
        .BUF_AWIDTH     (BUF_AWIDTH),

        .CFG_ID         (CFG_ID_WR),
        .CFG_ADDR       (CFG_ADDR),
        .CFG_DATA       (CFG_DATA),
        .CFG_AWIDTH     (CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),

        .AXI_ID_WIDTH   (AXI_ID_WIDTH),
        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (STREAM_WIDTH))
    axis_write_ (
        .clk            (clk),
        .rst            (rst),

        .cfg_addr       (cfg_addr_r),
        .cfg_data       (cfg_data_r),
        .cfg_valid      (cfg_valid_r),
        .cfg_ready      (),

        .axi_awid       (axi_awid),
        .axi_awaddr     (axi_awaddr),
        .axi_awlen      (axi_awlen),
        .axi_awvalid    (axi_awvalid),
        .axi_awready    (axi_awready),

        .axi_wid        (axi_wid),
        .axi_wdata      (axi_wdata),
        .axi_wlast      (axi_wlast),
        .axi_wvalid     (axi_wvalid),
        .axi_wready     (axi_wready),

        .data           (wr_data),
        .valid          (wr_valid),
        .ready          (wr_ready)
    );


    axis_read #(
        .BUF_CFG_AWIDTH (BUF_CFG_AWIDTH),
        .BUF_AWIDTH     (BUF_AWIDTH),

        .CFG_ID         (CFG_ID_RD),
        .CFG_ADDR       (CFG_ADDR),
        .CFG_DATA       (CFG_DATA),
        .CFG_AWIDTH     (CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),

        .AXI_ID_WIDTH   (AXI_ID_WIDTH),
        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (STREAM_WIDTH))
    axis_read_ (
        .clk            (clk),
        .rst            (rst),

        .cfg_addr       (cfg_addr_r),
        .cfg_data       (cfg_data_r),
        .cfg_valid      (cfg_valid_r),
        .cfg_ready      (),

        .axi_arid       (axi_arid),
        .axi_araddr     (axi_araddr),
        .axi_arlen      (axi_arlen),
        .axi_arvalid    (axi_arvalid),
        .axi_arready    (axi_arready),

        .axi_rdata      (axi_rdata),
        .axi_rlast      (axi_rlast),
        .axi_rvalid     (axi_rvalid),
        .axi_rready     (axi_rready),

        .data           (rd_data),
        .valid          (rd_valid),
        .ready          (rd_ready)
    );


endmodule

`endif //  `ifndef _axis_
