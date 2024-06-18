// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module GPIO_test();

    reg clk, rst;

    initial begin
        clk = 0;
        rst = 0;
        #7 rst = 1;
    end

    always begin
        #5 clk = ~clk;
    end

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

    reg inst_req, data_req;
    reg[31:0] inst_addr, data_addr, data_wdata;

    wire[31:0] inst_rdata_conn;
    wire inst_addr_ok_conn, inst_data_ok_conn;
    wire data_addr_ok_conn, data_data_ok_conn;

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

        .data_req(data_req),
        .data_wr(1),
        .data_size(2'b10),
        .data_addr(data_addr),
        .data_wdata(data_wdata),
        .data_rdata(),
        .data_addr_ok(data_addr_ok_conn),
        .data_data_ok(data_data_ok_conn),

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

    // GPIO
    wire[1:0] bicolor_led_0, bicolor_led_1;
    wire[7:0] switch;
    wire[15:0] keypad, led;
    wire[31:0] num;

    assign switch = 7'h01;
    assign keypad = 16'habcd;

    GPIO gpio(
        .clk_timer(clk),
        .clk(clk),
        .rst(rst),
        
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
        .bready(bready),

        .switch(switch),
        .keypad(keypad),
        .bicolor_led_0(bicolor_led_0),
        .bicolor_led_1(bicolor_led_1),
        .led(led),
        .num(num)
    );

    always @(posedge clk) begin
        if (!rst) begin
            inst_req <= 0;
            data_req <= 0;
            inst_addr <= 32'h1fd05004;
            // data_addr <= 32'h1fd05014;
            // data_wdata <= 32'h12345678;
        end
        else begin
            inst_req <= 1;
            // data_req <= 1;
        end
    end

endmodule // GPIO_test
