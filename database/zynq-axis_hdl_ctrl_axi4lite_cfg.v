`ifndef _axi4lite_cfg_
`define _axi4lite_cfg_

`timescale 1 ns / 1 ps

module axi4lite_cfg
  #(parameter
    CFG_DWIDTH  = 32,
    CFG_AWIDTH  = 5,
    AXI_AWIDTH  = (CFG_AWIDTH + $clog2(CFG_DWIDTH/8)))  // do not overwite
   (input                           clk,
    input                           rst,

    output reg  [CFG_DWIDTH-1:0]    cfg_wr_data,
    output reg  [CFG_AWIDTH-1:0]    cfg_wr_addr,
    output reg                      cfg_wr_en,

    input       [CFG_DWIDTH-1:0]    cfg_rd_data,
    output reg  [CFG_AWIDTH-1:0]    cfg_rd_addr,
    output reg                      cfg_rd_en,

    input       [AXI_AWIDTH-1:0]    axi_awaddr,     // Write Address
    input       [2:0]               axi_awprot,     // Write Address Protection
    input                           axi_awvalid,    // Write Address Valid
    output                          axi_awready,    // Write Address Ready

    input       [CFG_DWIDTH-1:0]    axi_wdata,      // Write Data
    input       [CFG_DWIDTH/8-1:0]  axi_wstrb,      // Write Data Strobe
    input                           axi_wvalid,     // Write Data Valid
    output                          axi_wready,     // Write Data Ready

    output      [1:0]               axi_bresp,      // Write Response
    output                          axi_bvalid,     // Write Response Valid
    input                           axi_bready,     // Write Response Ready

    input       [AXI_AWIDTH-1:0]    axi_araddr,     // Read Address
    input       [2:0]               axi_arprot,     // Read Address Protection
    input                           axi_arvalid,    // Read Address Valid
    output reg                      axi_arready,    // Read Address Ready

    output      [CFG_DWIDTH-1:0]    axi_rdata,      // Read Data
    output      [1:0]               axi_rresp,      // Read Data Response
    output reg                      axi_rvalid,     // Read Data Valid
    input                           axi_rready      // Read Data Ready
);


    /**
     * Internal signals
     */


    reg  [AXI_AWIDTH-1:0]   axi_wr_addr;
    wire                    axi_wr_valid;
    reg                     axi_wr_ready;


    /**
     * Implementation Write Path
     */

    // write response is always 'OKAY'
    assign axi_bresp    = 2'b0;

    assign axi_bvalid   = 1'b1;

    // simplify write ready by making axi_awready be in sync with axi_wready
    assign axi_awready  = axi_wr_ready;

    assign axi_wready   = axi_wr_ready;

    // write data and addresses are valid together
    assign axi_wr_valid = axi_wr_ready && axi_wvalid && axi_awvalid;


    // latch the address when both axi_awvalid and axi_wvalid are active
    always @(posedge clk)
        if (rst) begin
            axi_wr_addr <= 'b0;
        end
        else if ( ~axi_wr_ready && axi_awvalid && axi_wvalid) begin
            axi_wr_addr <= axi_awaddr;
        end


    // axi_wr_ready is only asserted for one clk clock cycle
    always @(posedge clk) begin
        if (rst) begin
            axi_wr_ready <= 1'b0;
        end
        else begin
            axi_wr_ready <= 1'b0;

            if ( ~axi_wr_ready && axi_wvalid && axi_awvalid) begin
                axi_wr_ready <= 1'b1;
            end
        end
    end


    // pass write data, address etc out of module
    always @(posedge clk)
        if (axi_wr_valid) cfg_wr_data <= axi_wdata;


    always @(posedge clk) begin
        cfg_wr_addr <= 'b0;

        if (axi_wr_valid) begin
            cfg_wr_addr <= axi_wr_addr[$clog2(CFG_DWIDTH/8) +: CFG_AWIDTH];
        end
    end


    always @(posedge clk)
        if (rst)    cfg_wr_en <= 1'b0;
        else        cfg_wr_en <= axi_wr_valid;


    /**
     * Implementation Read Path
     */

    // axi_rresp indicates the status of read transaction.
    assign axi_rresp = 2'b0; // 'OKAY' response


    // The external code give cfg_rd_data a cycle after the valid read address and
    // ready signals
    assign axi_rdata = cfg_rd_data;


    // Convert axi_araddr
    always @(posedge clk) begin
        cfg_rd_addr <= 'b0;

        if ( ~axi_arready & axi_arvalid) begin
            cfg_rd_addr <= axi_araddr[$clog2(CFG_DWIDTH/8) +: CFG_AWIDTH];
        end
    end


    always @(posedge clk)
        if (rst)    cfg_rd_en <= 1'b0;
        else        cfg_rd_en <= ~axi_arready & axi_arvalid;


    // axi_arready is only asserted for one clk clock cycle
    always @(posedge clk) begin
        if (rst) begin
            axi_arready <= 1'b0;
        end
        else begin
            axi_arready <= 1'b0;

            if ( ~axi_arready && axi_arvalid) begin
                axi_arready <= 1'b1;
            end
        end
    end


    // axi_rvalid is only asserted for one clk clock cycle
    always @(posedge clk) begin
        if (rst) begin
            axi_rvalid <= 1'b0;
        end
        else begin
            if (axi_arready && axi_arvalid && ~axi_rvalid) begin
                // Valid read data is available at the read data bus
                axi_rvalid <= 1'b1;
            end
            else if (axi_rvalid && axi_rready) begin
                // Read data is accepted by the master
                axi_rvalid <= 1'b0;
            end
        end
    end


endmodule

`endif //  `ifndef _axi4lite_cfg_
