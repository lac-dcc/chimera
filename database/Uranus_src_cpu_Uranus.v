// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "debug.v"

module Uranus(
    input         aclk,
    input         aresetn,

    input         int_0,
    input         int_1,
    input         int_2,
    input         int_3,
    input         int_4,

    output [3:0]  arid,
    output [31:0] araddr,
    output [7:0]  arlen,
    output [2:0]  arsize,
    output [1:0]  arburst,
    output [1:0]  arlock,
    output [3:0]  arcache,
    output [2:0]  arprot,
    output        arvalid,
    input         arready,

    input  [3:0]  rid,
    input  [31:0] rdata,
    input  [1:0]  rresp,
    input         rlast,
    input         rvalid,
    output        rready,

    output [3:0]  awid,
    output [31:0] awaddr,
    output [7:0]  awlen,
    output [2:0]  awsize,
    output [1:0]  awburst,
    output [1:0]  awlock,
    output [3:0]  awcache,
    output [2:0]  awprot,
    output        awvalid,
    input         awready,

    output [3:0]  wid,
    output [31:0] wdata,
    output [3:0]  wstrb,
    output        wlast,
    output        wvalid,
    input         wready,

    input  [3:0]  bid,
    input  [1:0]  bresp,
    input         bvalid,
    output        bready,

    `DEBUG output [31:0] debug_pc_addr,
    `DEBUG output [3:0]  debug_reg_write_en,
    `DEBUG output [4:0]  debug_reg_write_addr,
    `DEBUG output [31:0] debug_reg_write_data
);

    wire       exception_flag_conn;
    `DEBUG wire halt_conn;

    wire       ram_en_conn;
    wire[3:0]  ram_write_en_conn;
    wire[31:0] ram_write_data_conn;
    wire[31:0] ram_addr_conn;
    wire[31:0] ram_read_data_conn;

    wire       rom_en_conn;
    wire[3:0]  rom_write_en_conn;
    wire[31:0] rom_write_data_conn;
    wire[31:0] rom_addr_conn;
    wire[31:0] rom_read_data_conn;

    wire[3:0]  debug_reg_write_en_conn;

    wire       inst_req_conn;
    wire       inst_wr_conn;
    wire[1:0]  inst_size_conn;
    wire[31:0] inst_addr_conn;
    wire[31:0] inst_wdata_conn;
    wire[31:0] inst_rdata_conn;
    wire       inst_addr_ok_conn;
    wire       inst_data_ok_conn;

    wire       data_req_conn;
    wire       data_wr_conn;
    wire[1:0]  data_size_conn;
    wire[31:0] data_addr_conn;
    wire[31:0] data_wdata_conn;
    wire[31:0] data_rdata_conn;
    wire       data_addr_ok_conn;
    wire       data_data_ok_conn;

    wire[31:0] read_addr_conn;
    wire[31:0] write_addr_conn;

    assign debug_reg_write_en = halt_conn ? 0 : debug_reg_write_en_conn;

    MMU mmu(
        .rst(aresetn),
        .read_addr_in(read_addr_conn),
        .write_addr_in(write_addr_conn),
        .read_addr_out(araddr),
        .write_addr_out(awaddr)
    );

    cpu_axi_interface axi_interface(
        .clk(aclk),
        .resetn(aresetn),

        .inst_req(inst_req_conn),
        .inst_wr(inst_wr_conn),
        .inst_size(inst_size_conn),
        .inst_addr(inst_addr_conn),
        .inst_wdata(inst_wdata_conn),
        .inst_rdata(inst_rdata_conn),
        .inst_addr_ok(inst_addr_ok_conn),
        .inst_data_ok(inst_data_ok_conn),

        .data_req(data_req_conn),
        .data_wr(data_wr_conn),
        .data_size(data_size_conn),
        .data_addr(data_addr_conn),
        .data_wdata(data_wdata_conn),
        .data_rdata(data_rdata_conn),
        .data_addr_ok(data_addr_ok_conn),
        .data_data_ok(data_data_ok_conn),

        .arid(arid),
        .araddr(read_addr_conn),
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
        .awaddr(write_addr_conn),
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

    SRAMArbiter sram_arbiter(
        .clk(aclk),
        .rst(aresetn),

        .rom_en(rom_en_conn),
        .rom_write_en(rom_write_en_conn),
        .rom_write_data(rom_write_data_conn),
        .rom_addr(rom_addr_conn),
        .rom_read_data(rom_read_data_conn),
        .ram_en(ram_en_conn),
        .ram_write_en(ram_write_en_conn),
        .ram_write_data(ram_write_data_conn),
        .ram_addr(ram_addr_conn),
        .ram_read_data(ram_read_data_conn),

        .inst_rdata(inst_rdata_conn),
        .inst_addr_ok(inst_addr_ok_conn),
        .inst_data_ok(inst_data_ok_conn),
        .inst_req(inst_req_conn),
        .inst_wr(inst_wr_conn),
        .inst_size(inst_size_conn),
        .inst_addr(inst_addr_conn),
        .inst_wdata(inst_wdata_conn),

        .data_rdata(data_rdata_conn),
        .data_addr_ok(data_addr_ok_conn),
        .data_data_ok(data_data_ok_conn),
        .data_req(data_req_conn),
        .data_wr(data_wr_conn),
        .data_size(data_size_conn),
        .data_addr(data_addr_conn),
        .data_wdata(data_wdata_conn),

        .exception_flag(exception_flag_conn),
        .halt(halt_conn)
    );

    Core cpu(
        .clk(aclk),
        .rst(aresetn),

        .halt(halt_conn),
        .interrupt({int_4, int_3, int_2, int_1, int_0}),

        .ram_en(ram_en_conn),
        .ram_write_en(ram_write_en_conn),
        .ram_addr(ram_addr_conn),
        .ram_write_data(ram_write_data_conn),
        .ram_read_data(ram_read_data_conn),

        .rom_en(rom_en_conn),
        .rom_write_en(rom_write_en_conn),
        .rom_addr(rom_addr_conn),
        .rom_write_data(rom_write_data_conn),
        .rom_read_data(rom_read_data_conn),

        .debug_pc_addr(debug_pc_addr),
        .debug_reg_write_en(debug_reg_write_en_conn),
        .debug_reg_write_addr(debug_reg_write_addr),
        .debug_reg_write_data(debug_reg_write_data),
        .debug_exception_flag(exception_flag_conn)
    );

endmodule // Uranus
