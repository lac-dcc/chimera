
`include "axi4lite_cfg.v"
`include "axis.v"

module axis_loopback #(
    // Parameters of Axi Slave Bus Interface S00_AXI
    parameter integer C_S00_AXI_DATA_WIDTH      = 32,
    parameter integer C_S00_AXI_ADDR_WIDTH      = 7,

    // Parameters of Axi Master Bus Interface M00_AXI
    parameter integer C_M00_AXI_ID_WIDTH        = 5,
    parameter integer C_M00_AXI_BURST_LEN       = 4,
    parameter integer C_M00_AXI_ADDR_WIDTH      = 32,
    parameter integer C_M00_AXI_DATA_WIDTH      = 64)
   (// Ports of Axi Slave Bus Interface S00_AXI
    input  wire                                     clk,
    input  wire                                     rst_n,

    input  wire [C_S00_AXI_ADDR_WIDTH-1 : 0]        s00_axi_awaddr,
    input  wire [2 : 0]                             s00_axi_awprot,
    input  wire                                     s00_axi_awvalid,
    output wire                                     s00_axi_awready,
    input  wire [C_S00_AXI_DATA_WIDTH-1 : 0]        s00_axi_wdata,
    input  wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0]    s00_axi_wstrb,
    input  wire                                     s00_axi_wvalid,
    output wire                                     s00_axi_wready,
    output wire [1 : 0]                             s00_axi_bresp,
    output wire                                     s00_axi_bvalid,
    input  wire                                     s00_axi_bready,
    input  wire [C_S00_AXI_ADDR_WIDTH-1 : 0]        s00_axi_araddr,
    input  wire [2 : 0]                             s00_axi_arprot,
    input  wire                                     s00_axi_arvalid,
    output wire                                     s00_axi_arready,
    output wire [C_S00_AXI_DATA_WIDTH-1 : 0]        s00_axi_rdata,
    output wire [1 : 0]                             s00_axi_rresp,
    output wire                                     s00_axi_rvalid,
    input  wire                                     s00_axi_rready,

    // Ports of Axi Master Bus Interface M00_AXI
    output wire [C_M00_AXI_ID_WIDTH-1 : 0]          m00_axi_awid,
    output wire [C_M00_AXI_ADDR_WIDTH-1 : 0]        m00_axi_awaddr,
    output wire [C_M00_AXI_BURST_LEN-1 : 0]         m00_axi_awlen,
    output wire [2 : 0]                             m00_axi_awsize,
    output wire [1 : 0]                             m00_axi_awburst,
    output wire                                     m00_axi_awlock,
    output wire [3 : 0]                             m00_axi_awcache,
    output wire [2 : 0]                             m00_axi_awprot,
    output wire [3 : 0]                             m00_axi_awqos,
    output wire                                     m00_axi_awvalid,
    input  wire                                     m00_axi_awready,
    output wire [C_M00_AXI_DATA_WIDTH-1 : 0]        m00_axi_wdata,
    output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0]      m00_axi_wstrb,
    output wire                                     m00_axi_wlast,
    output wire                                     m00_axi_wvalid,
    input  wire                                     m00_axi_wready,
    input  wire [C_M00_AXI_ID_WIDTH-1 : 0]          m00_axi_bid,
    input  wire [1 : 0]                             m00_axi_bresp,
    input  wire                                     m00_axi_bvalid,
    output wire                                     m00_axi_bready,
    output wire [C_M00_AXI_ID_WIDTH-1 : 0]          m00_axi_arid,
    output wire [C_M00_AXI_ADDR_WIDTH-1 : 0]        m00_axi_araddr,
    output wire [C_M00_AXI_BURST_LEN-1 : 0]         m00_axi_arlen,
    output wire [2 : 0]                             m00_axi_arsize,
    output wire [1 : 0]                             m00_axi_arburst,
    output wire                                     m00_axi_arlock,
    output wire [3 : 0]                             m00_axi_arcache,
    output wire [2 : 0]                             m00_axi_arprot,
    output wire [3 : 0]                             m00_axi_arqos,
    output wire                                     m00_axi_arvalid,
    input  wire                                     m00_axi_arready,
    input  wire [C_M00_AXI_ID_WIDTH-1 : 0]          m00_axi_rid,
    input  wire [C_M00_AXI_DATA_WIDTH-1 : 0]        m00_axi_rdata,
    input  wire [1 : 0]                             m00_axi_rresp,
    input  wire                                     m00_axi_rlast,
    input  wire                                     m00_axi_rvalid,
    output wire                                     m00_axi_rready
);


    //localparam CFG_AWIDTH   = (C_S00_AXI_ADDR_WIDTH - $clog2(C_S00_AXI_DATA_WIDTH/8)));
    localparam CFG_AWIDTH =
        ( 1 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 0 :
        ( 2 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 1 :
        ( 4 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 2 :
        ( 8 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 3 :
        (16 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 4 :
        (32 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 5 :
        (64 == (C_S00_AXI_DATA_WIDTH/8)) ? C_S00_AXI_ADDR_WIDTH - 6 : 1;


    localparam CFG_DEPTH    = 1<<CFG_AWIDTH;
    localparam CFG_DWIDTH   = C_S00_AXI_DATA_WIDTH;

    localparam SYS_DWIDTH   = 32;

    localparam
        CFG_AXIS_ADDR       = 0,
        CFG_AXIS_DATA       = 1,
        CFG_HP0_DST_CNT     = 2,
        CFG_HP0_SRC_CNT     = 3,
        CFG_HP0_DST_DATA    = 4,
        CFG_HP0_SRC_DATA    = 5,
        CFG_EMPTY           = 6;


    wire [CFG_DWIDTH-1:0]   cfg_wr_data;
    wire [CFG_AWIDTH-1:0]   cfg_wr_addr;
    wire                    cfg_wr_en;

    reg  [CFG_DWIDTH-1:0]   cfg_rd_data;
    wire [CFG_AWIDTH-1:0]   cfg_rd_addr;
    wire                    cfg_rd_en;

    reg  [CFG_DWIDTH-1:0]   cfg_hold [0:CFG_DEPTH-1];
    reg  [0:CFG_DEPTH-1]    cfg_hold_en;

    wire [SYS_DWIDTH-1:0]   sys_m00_dst_data;
    wire                    sys_m00_dst_valid;
    wire                    sys_m00_dst_ready;

    wire [SYS_DWIDTH-1:0]   sys_m00_src_data;
    wire                    sys_m00_src_valid;
    wire                    sys_m00_src_ready;

    reg  [CFG_DWIDTH-1:0]   axis_m00_dst_cnt;
    reg  [CFG_DWIDTH-1:0]   axis_m00_src_cnt;


    axi4lite_cfg #(
        .CFG_DWIDTH (CFG_DWIDTH),
        .CFG_AWIDTH (CFG_AWIDTH))
    axi4lite_cfg_ (
        .clk            (clk),
        .rst            ( ~rst_n),

        .cfg_wr_data    (cfg_wr_data),
        .cfg_wr_addr    (cfg_wr_addr),
        .cfg_wr_en      (cfg_wr_en),

        .cfg_rd_data    (cfg_rd_data),
        .cfg_rd_addr    (cfg_rd_addr),
        .cfg_rd_en      (cfg_rd_en),

        .axi_awaddr     (s00_axi_awaddr),
        .axi_awprot     (s00_axi_awprot),
        .axi_awvalid    (s00_axi_awvalid),
        .axi_awready    (s00_axi_awready),

        .axi_wdata      (s00_axi_wdata),
        .axi_wstrb      (s00_axi_wstrb),
        .axi_wvalid     (s00_axi_wvalid),
        .axi_wready     (s00_axi_wready),

        .axi_bresp      (s00_axi_bresp),
        .axi_bvalid     (s00_axi_bvalid),
        .axi_bready     (s00_axi_bready),

        .axi_araddr     (s00_axi_araddr),
        .axi_arprot     (s00_axi_arprot),
        .axi_arvalid    (s00_axi_arvalid),
        .axi_arready    (s00_axi_arready),

        .axi_rdata      (s00_axi_rdata),
        .axi_rresp      (s00_axi_rresp),
        .axi_rvalid     (s00_axi_rvalid),
        .axi_rready     (s00_axi_rready)
    );


    genvar i;
    generate
        for (i=0; i<CFG_DEPTH; i=i+1) begin : WRITE_CONFIG_

            always @(posedge clk) begin
                cfg_hold_en[i] <= 1'b0;

                if (cfg_wr_en & (i == cfg_wr_addr)) begin
                    cfg_hold_en[i] <= 1'b1;
                end
            end


            always @(posedge clk) begin
                if ( ~rst_n) begin
                    cfg_hold[i] <= 'b0;
                end
                else if (cfg_wr_en & (i == cfg_wr_addr)) begin
                    cfg_hold[i] <= cfg_wr_data;
                end
            end

        end
    endgenerate


    always @(posedge clk) begin
        cfg_rd_data <= 'b0;

        if (cfg_rd_en) begin
            case (cfg_rd_addr)
                CFG_HP0_DST_CNT     : cfg_rd_data <= axis_m00_dst_cnt;
                CFG_HP0_SRC_CNT     : cfg_rd_data <= axis_m00_src_cnt;
                CFG_HP0_SRC_DATA    : cfg_rd_data <= sys_m00_src_data;

                default : cfg_rd_data <= cfg_hold[cfg_rd_addr];
            endcase
        end
    end


    axis #(
        .BUF_AWIDTH     (9),
        .CFG_ID_RD      (1),
        .CFG_ID_WR      (2),
        .CFG_ADDR       (CFG_AXIS_ADDR),
        .CFG_DATA       (CFG_AXIS_DATA),
        .CFG_AWIDTH     (CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),
        .STREAM_WIDTH   (SYS_DWIDTH),
        .AXI_ID_WIDTH   (C_M00_AXI_ID_WIDTH),
        .AXI_LEN_WIDTH  (C_M00_AXI_BURST_LEN),
        .AXI_ADDR_WIDTH (C_M00_AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (C_M00_AXI_DATA_WIDTH))
    axis_m00_ (
        .clk            (clk),
        .rst            ( ~rst_n),

        .cfg_addr       (cfg_wr_addr),
        .cfg_data       (cfg_wr_data),
        .cfg_valid      (cfg_wr_en),

        .wr_data        (sys_m00_dst_data),
        .wr_valid       (sys_m00_dst_valid),
        .wr_ready       (sys_m00_dst_ready),

        .rd_data        (sys_m00_src_data),
        .rd_valid       (sys_m00_src_valid),
        .rd_ready       (sys_m00_src_ready),

        .axi_awready    (m00_axi_awready),
        .axi_awid       (m00_axi_awid),
        .axi_awaddr     (m00_axi_awaddr),
        .axi_awlen      (m00_axi_awlen),
        .axi_awsize     (m00_axi_awsize),
        .axi_awburst    (m00_axi_awburst),
        .axi_awlock     (m00_axi_awlock),
        .axi_awcache    (m00_axi_awcache),
        .axi_awprot     (m00_axi_awprot),
        .axi_awqos      (m00_axi_awqos),
        .axi_awvalid    (m00_axi_awvalid),

        .axi_wready     (m00_axi_wready),
        .axi_wid        (),
        .axi_wdata      (m00_axi_wdata),
        .axi_wstrb      (m00_axi_wstrb),
        .axi_wlast      (m00_axi_wlast),
        .axi_wvalid     (m00_axi_wvalid),

        .axi_bid        (m00_axi_bid),
        .axi_bresp      (m00_axi_bresp),
        .axi_bvalid     (m00_axi_bvalid),
        .axi_bready     (m00_axi_bready),

        .axi_arready    (m00_axi_arready),
        .axi_arid       (m00_axi_arid),
        .axi_araddr     (m00_axi_araddr),
        .axi_arlen      (m00_axi_arlen),
        .axi_arsize     (m00_axi_arsize),
        .axi_arburst    (m00_axi_arburst),
        .axi_arlock     (m00_axi_arlock),
        .axi_arcache    (m00_axi_arcache),
        .axi_arprot     (m00_axi_arprot),
        .axi_arvalid    (m00_axi_arvalid),
        .axi_arqos      (m00_axi_arqos),

        .axi_rid        (m00_axi_rid),
        .axi_rresp      (m00_axi_rresp),
        .axi_rvalid     (m00_axi_rvalid),
        .axi_rdata      (m00_axi_rdata),
        .axi_rlast      (m00_axi_rlast),
        .axi_rready     (m00_axi_rready)
    );


    assign sys_m00_dst_data     = cfg_hold[CFG_HP0_DST_DATA];
    assign sys_m00_dst_valid    = cfg_hold_en[CFG_HP0_DST_DATA];
    assign sys_m00_src_ready    = cfg_rd_en & (CFG_HP0_SRC_DATA == cfg_rd_addr);


    // counts number of system data sent from AXIS port
    always @(posedge clk)
        if ( ~rst_n) axis_m00_dst_cnt <= 'b0;
        else if (sys_m00_dst_valid) begin
            axis_m00_dst_cnt <= axis_m00_dst_cnt + 1;
        end

    always @(posedge clk)
        if ( ~rst_n) axis_m00_src_cnt <= 'b0;
        else if (sys_m00_src_valid) begin
            axis_m00_src_cnt <= axis_m00_src_cnt + 1;
        end


endmodule
