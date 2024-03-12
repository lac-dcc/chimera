/**
 * Module:
 *  axis_write
 *
 * Description:
 *  The axis_write takes a system stream and translates it to the axi data
 *  channel protocol.
 *
 * Test bench:
 *  axis_write_tb.v
 *
 * Created:
 *  Tue Nov  4 22:18:14 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _axis_write_
`define _axis_write_


`include "axis_addr.v"
`include "axis_write_data.v"

module axis_write
  #(parameter
    BUF_CFG_AWIDTH  = 5,
    BUF_AWIDTH      = 9,

    CFG_ID          = 1,
    CFG_ADDR        = 23,
    CFG_DATA        = 24,
    CFG_AWIDTH      = 5,
    CFG_DWIDTH      = 32,

    AXI_ID_WIDTH    = 8,
    AXI_LEN_WIDTH   = 8,
    AXI_ADDR_WIDTH  = 32,
    AXI_DATA_WIDTH  = 32,
    DATA_WIDTH      = 32)
   (input                               clk,
    input                               rst,

    input       [CFG_AWIDTH-1:0]        cfg_addr,
    input       [CFG_DWIDTH-1:0]        cfg_data,
    input                               cfg_valid,
    output                              cfg_ready,

    output reg  [AXI_ID_WIDTH-1:0]      axi_awid,
    output      [AXI_ADDR_WIDTH-1:0]    axi_awaddr,
    output      [AXI_LEN_WIDTH-1:0]     axi_awlen,
    output                              axi_awvalid,
    input                               axi_awready,

    output reg  [AXI_ID_WIDTH-1:0]      axi_wid,
    output      [AXI_DATA_WIDTH-1:0]    axi_wdata,
    output                              axi_wlast,
    output                              axi_wvalid,
    input                               axi_wready,

    input       [DATA_WIDTH-1:0]        data,
    input                               valid,
    output                              ready
);

    /**
     * Local parameters
     */

    localparam WIDTH_RATIO  = AXI_DATA_WIDTH/DATA_WIDTH;
    localparam CFG_NB       = 2;
    localparam STORE_WIDTH  = CFG_DWIDTH*CFG_NB;

    localparam
        C_IDLE      = 0,
        C_CONFIG    = 1,
        C_STALL     = 2;


`ifdef VERBOSE
    initial $display("\using 'axis_write'\n");
`endif


    /**
     * Internal signals
     */


    reg  [2:0]                          c_state;
    reg  [2:0]                          c_state_nx;

    wire                                cfg_addr_ready;
    wire                                cfg_data_ready;

    wire [STORE_WIDTH+CFG_DWIDTH-1:0]   cfg_store_i;
    reg  [STORE_WIDTH-1:0]              cfg_store;
    reg  [7:0]                          cfg_cnt;
    wire                                cfg_done;

    wire [CFG_DWIDTH-1:0]               cfg_address;
    wire [CFG_DWIDTH-1:0]               cfg_length;
    reg                                 cfg_enable;
    wire                                id_valid;
    wire                                addressed;
    wire                                axis_data;


    /**
     * Implementation
     */

    assign cfg_store_i  = {cfg_store, cfg_data};

    assign cfg_address  = cfg_store[CFG_DWIDTH +: CFG_DWIDTH];

    assign cfg_length   = cfg_store[0 +: CFG_DWIDTH];

    assign id_valid     = (CFG_ID == cfg_data);

    assign addressed    = (CFG_ADDR == cfg_addr) & cfg_valid;

    assign axis_data    = (CFG_DATA == cfg_addr) & cfg_valid;

    assign cfg_ready    = ~c_state[C_STALL];

    assign cfg_done     = ((CFG_NB-1) == cfg_cnt);


    always @(posedge clk)
        if (c_state[C_CONFIG] & axis_data) begin
            cfg_store <= cfg_store_i[0 +: STORE_WIDTH];
        end


    always @(posedge clk) begin
        cfg_cnt <= 'b0;

        if (c_state[C_CONFIG]) begin
            cfg_cnt <= cfg_cnt + {7'b0, axis_data};
        end
    end


    always @(posedge clk)
        if (rst) cfg_enable <= 1'b0;
        else if ( ~c_state[C_STALL]) begin
            cfg_enable <= c_state[C_CONFIG] & axis_data & cfg_done;
        end


    always @(posedge clk)
        if (rst) begin
            axi_awid <= {AXI_ID_WIDTH{1'b0}};
        end
        else if (axi_awvalid && axi_awready) begin
            axi_awid <= axi_awid + {{(AXI_ID_WIDTH-1){1'b0}}, 1'b1};
        end


    always @(posedge clk)
        if (rst) begin
            axi_wid <= {AXI_ID_WIDTH{1'b0}};
        end
        else if (axi_wvalid & axi_wready & axi_wlast) begin
            axi_wid <= axi_wid + {{(AXI_ID_WIDTH-1){1'b0}}, 1'b1};
        end


    always @(posedge clk)
        if (rst) begin
            c_state         <= 'b0;
            c_state[C_IDLE] <= 1'b1;
        end
        else c_state <= c_state_nx;


    always @* begin : CONFIG_
        c_state_nx = 'b0;

        case (1'b1)
            c_state[C_IDLE] : begin
                if (addressed & id_valid) begin
                    c_state_nx[C_CONFIG] = 1'b1;
                end
                else c_state_nx[C_IDLE] = 1'b1;
            end
            c_state[C_CONFIG] : begin
                if  (axis_data & cfg_done & cfg_addr_ready & cfg_data_ready) begin
                    c_state_nx[C_IDLE] = 1'b1;
                end
                else if (axis_data & cfg_done) begin
                    c_state_nx[C_STALL] = 1'b1;
                end
                else c_state_nx[C_CONFIG] = 1'b1;
            end
            c_state[C_STALL] : begin
                if (cfg_addr_ready & cfg_data_ready) begin
                    c_state_nx[C_IDLE] = 1'b1;
                end
                else c_state_nx[C_STALL] = 1'b1;
            end
            default : begin
                c_state_nx[C_IDLE] = 1'b1;
            end
        endcase
    end


    axis_addr #(
        .BUF_CFG_AWIDTH (BUF_CFG_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),
        .WIDTH_RATIO    (WIDTH_RATIO),
        .CONVERT_SHIFT  ($clog2(WIDTH_RATIO)),

        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH))
    axis_addr_ (
        .clk            (clk),
        .rst            (rst),

        .cfg_address    (cfg_address),
        .cfg_length     (cfg_length),
        .cfg_val        (cfg_enable & ~c_state[C_STALL]),
        .cfg_rdy        (cfg_addr_ready),

        .axi_aready     (axi_awready),
        .axi_aaddr      (axi_awaddr),
        .axi_alen       (axi_awlen),
        .axi_avalid     (axi_awvalid)
    );


    axis_write_data #(
        .BUF_CFG_AWIDTH (BUF_CFG_AWIDTH),
        .BUF_AWIDTH     (BUF_AWIDTH),
        .CFG_DWIDTH     (CFG_DWIDTH),
        .CONVERT_SHIFT  ($clog2(WIDTH_RATIO)),

        .AXI_LEN_WIDTH  (AXI_LEN_WIDTH),
        .AXI_DATA_WIDTH (AXI_DATA_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH))
    axis_write_data_ (
        .clk            (clk),
        .rst            (rst),

        .cfg_length     (cfg_length),
        .cfg_val        (cfg_enable & ~c_state[C_STALL]),
        .cfg_rdy        (cfg_data_ready),

        .axi_wlast      (axi_wlast),
        .axi_wdata      (axi_wdata),
        .axi_wvalid     (axi_wvalid),
        .axi_wready     (axi_wready),

        .data           (data),
        .valid          (valid),
        .ready          (ready)
    );



endmodule

`endif //  `ifndef _axis_write_
