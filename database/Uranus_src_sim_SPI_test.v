// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module SPI_test(
    input clk,   // cpu clock
    input rst,
    // SPI
    output spi_clk,
    output spi_cs,
    inout spi_mosi,
    inout spi_miso,
    // SegDisp
    output [7:0] seg_sel,
    output [7:0] seg_bit
);

    // AXI
    wire [3:0]  arid;
    wire [31:0] araddr;
    wire [7:0]  arlen;
    wire [2:0]  arsize;
    wire [1:0]  arburst;
    wire [1:0]  arlock;
    wire [3:0]  arcache;
    wire [2:0]  arprot;
    wire        arvalid;
    wire        arready;
    wire [3:0]  rid;
    wire [31:0] rdata;
    wire [1:0]  rresp;
    wire        rlast;
    wire        rvalid;
    wire        rready;
    wire [3:0]  awid;
    wire [31:0] awaddr;
    wire [7:0]  awlen;
    wire [2:0]  awsize;
    wire [1:0]  awburst;
    wire [1:0]  awlock;
    wire [3:0]  awcache;
    wire [2:0]  awprot;
    wire        awvalid;
    wire        awready;
    wire [3:0]  wid;
    wire [31:0] wdata;
    wire [3:0]  wstrb;
    wire        wlast;
    wire        wvalid;
    wire        wready;
    wire [3:0]  bid;
    wire [1:0]  bresp;
    wire        bvalid;
    wire        bready;

    // SPI
    wire[3:0] spi_csn_o;
    wire[3:0] spi_csn_en;
    wire spi_sck_o;
    wire spi_sdo_i;
    wire spi_sdo_o;
    wire spi_sdo_en;
    wire spi_sdi_i;
    wire spi_sdi_o;
    wire spi_sdi_en;
    wire spi_inta_o;

    assign spi_clk = spi_sck_o;
    assign spi_cs  = ~spi_csn_en[0] & spi_csn_o[0];
    assign spi_mosi = spi_sdo_en ? 1'bz : spi_sdo_o;
    assign spi_miso = spi_sdi_en ? 1'bz : spi_sdi_o;
    assign spi_sdo_i = spi_mosi;
    assign spi_sdi_i = spi_miso;

    spi_flash_ctrl spi(
        .aclk           (clk               ),
        .aresetn        (rst               ),
        .spi_addr       (16'h1fe8          ),
        .fast_startup   (1'b0              ),
        .s_awid         (awid              ),
        .s_awaddr       (awaddr            ),
        .s_awlen        (awlen             ),
        .s_awsize       (awsize            ),
        .s_awburst      (awburst           ),
        .s_awlock       (awlock            ),
        .s_awcache      (awcache           ),
        .s_awprot       (awprot            ),
        .s_awvalid      (awvalid           ),
        .s_awready      (awready           ),
        .s_wready       (wready            ),
        .s_wid          (wid               ),
        .s_wdata        (wdata             ),
        .s_wstrb        (wstrb             ),
        .s_wlast        (wlast             ),
        .s_wvalid       (wvalid            ),
        .s_bid          (bid               ),
        .s_bresp        (bresp             ),
        .s_bvalid       (bvalid            ),
        .s_bready       (bready            ),
        .s_arid         (arid              ),
        .s_araddr       (araddr            ),
        .s_arlen        (arlen             ),
        .s_arsize       (arsize            ),
        .s_arburst      (arburst           ),
        .s_arlock       (arlock            ),
        .s_arcache      (arcache           ),
        .s_arprot       (arprot            ),
        .s_arvalid      (arvalid           ),
        .s_arready      (arready           ),
        .s_rready       (rready            ),
        .s_rid          (rid               ),
        .s_rdata        (rdata             ),
        .s_rresp        (rresp             ),
        .s_rlast        (rlast             ),
        .s_rvalid       (rvalid            ),

        .power_down_req (1'b0              ),
        .power_down_ack (                  ),
        .csn_o          (spi_csn_o         ),
        .csn_en         (spi_csn_en        ),
        .sck_o          (spi_sck_o         ),
        .sdo_i          (spi_sdo_i         ),
        .sdo_o          (spi_sdo_o         ),
        .sdo_en         (spi_sdo_en        ),
        .sdi_i          (spi_sdi_i         ),
        .sdi_o          (spi_sdi_o         ),
        .sdi_en         (spi_sdi_en        ),
        .inta_o         (spi_inta_o        )
    );

    reg inst_req;
    reg[31:0] inst_addr;

    wire[31:0] inst_rdata_conn;
    wire inst_addr_ok_conn, inst_data_ok_conn;

    cpu_axi_interface axi_interface(
        .clk(clk),
        .resetn(rst),

        .inst_req(inst_req),
        .inst_wr(0),
        .inst_size(2'b10),
        .inst_addr(inst_addr),
        .inst_wdata(0),
        .inst_rdata(inst_rdata_conn),
        .inst_addr_ok(inst_addr_ok_conn),
        .inst_data_ok(inst_data_ok_conn),

        .data_req(0),
        .data_wr(0),
        .data_size(0),
        .data_addr(0),
        .data_wdata(0),
        .data_rdata(),
        .data_addr_ok(),
        .data_data_ok(),

        .arid(arid),
        .araddr(araddr),
        .arlen(arlen),
        .arsize(arsize),
        .arburst(arburst),
        .arlock(arlock),
        .arcache(arcache),
        .arprot(arprot),
        .arvalid(arvalid),
        .arready(arready),

        .rid(rid),
        .rdata(rdata),
        .rresp(rresp),
        .rlast(rlast),
        .rvalid(rvalid),
        .rready(rready),

        .awid(awid),
        .awaddr(awaddr),
        .awlen(awlen),
        .awsize(awsize),
        .awburst(awburst),
        .awlock(awlock),
        .awcache(awcache),
        .awprot(awprot),
        .awvalid(awvalid),
        .awready(awready),

        .wid(wid),
        .wdata(wdata),
        .wstrb(wstrb),
        .wlast(wlast),
        .wvalid(wvalid),
        .wready(wready),

        .bid(bid),
        .bresp(bresp),
        .bvalid(bvalid),
        .bready(bready)
    );

    SegDisplay seg_disp(
        clk, rst, inst_rdata_conn,
        seg_sel, seg_bit
    );

    always @(posedge clk) begin
        if (!rst) begin
            inst_req <= 0;
            inst_addr <= 32'h1fc00000;
        end
        else begin
            inst_req <= 1;
        end
    end

endmodule // SPI_test
