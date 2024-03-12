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

`timescale 1ns / 1ps

`include "airi5c_hasti_constants.vh"
`include "airi5c_dmi_constants.vh"

`define DUAL_PORT
//`undef  DUAL_PORT

module FPGA_Top
(
    input           nRESET,
    input           CLK,

    input           EXT_INT,

    input           tdi,
    input           tck,
    input           tms,
    output          tdo,

    output  [7:0]   gpio0_out,
    input   [7:0]   gpio0_in,

    output          uart0_tx,
    input           uart0_rx,

    inout           spi0_mosi,
    inout           spi0_miso,
    inout           spi0_sclk,
    inout   [3:0]   spi0_ss
);

    reg             reset_sync;
    reg             interrupt_sync;

    wire            clkgen_locked;
    wire            clk32;
    wire            clktree_root;

    wire    [7:0]   debug_out;

`ifdef SIM
    BUF     b1(.I(CLK), .O(clk32));
    BUF     b2(.I(1'b1), .O(clkgen_locked));
`else

    clk_wiz_0 clkgen
    (
        .reset(!nRESET),
        .clk_in1(CLK),
        .clk_out1(clk32),
        .locked(clkgen_locked)
    );
`endif

    always @(posedge clk32, negedge nRESET) begin
        if (!nRESET) begin
            reset_sync      <= 1'b1;
            interrupt_sync  <= 1'b0;
        end

        else begin
            if (clkgen_locked)
                reset_sync  <= !nRESET;

            interrupt_sync  <= EXT_INT;
        end
    end

    BUFG    buf_clk(.I(clk32), .O(clktree_root));

    wire    [`HASTI_ADDR_WIDTH-1:0]     imem_haddr;
    wire                                imem_hwrite;
    wire    [`HASTI_SIZE_WIDTH-1:0]     imem_hsize;
    wire    [`HASTI_BURST_WIDTH-1:0]    imem_hburst;
    wire                                imem_hmastlock;
    wire    [`HASTI_PROT_WIDTH-1:0]     imem_hprot;
    wire    [`HASTI_TRANS_WIDTH-1:0]    imem_htrans;
    wire    [`HASTI_BUS_WIDTH-1:0]      imem_hwdata;
    wire    [`HASTI_BUS_WIDTH-1:0]      imem_hrdata;
    wire                                imem_hready;
    wire    [`HASTI_RESP_WIDTH-1:0]     imem_hresp;

    wire    [`HASTI_ADDR_WIDTH-1:0]     dmem_haddr;
    wire                                dmem_hwrite;
    wire    [`HASTI_SIZE_WIDTH-1:0]     dmem_hsize;
    wire    [`HASTI_BURST_WIDTH-1:0]    dmem_hburst;
    wire                                dmem_hmastlock;
    wire    [`HASTI_PROT_WIDTH-1:0]     dmem_hprot;
    wire    [`HASTI_TRANS_WIDTH-1:0]    dmem_htrans;
    wire    [`HASTI_BUS_WIDTH-1:0]      dmem_hwdata;
    wire    [`HASTI_BUS_WIDTH-1:0]      dmem_hrdata;
    wire                                dmem_hready;
    wire    [`HASTI_RESP_WIDTH-1:0]     dmem_hresp;

    wire    [`DMI_ADDR_WIDTH-1:0]       dmi_addr;
    wire    [`DMI_WIDTH-1:0]            dmi_rdata;
    wire    [`DMI_WIDTH-1:0]            dmi_wdata;
    wire                                dmi_en;
    wire                                dmi_wen;
    wire                                dmi_error;
    wire                                dmi_dm_busy;

  // SPI 0
    wire                                spi0_mosi_out;
    wire                                spi0_mosi_oe;

    wire                                spi0_miso_out;
    wire                                spi0_miso_oe;

    wire                                spi0_sclk_out;
    wire                                spi0_sclk_oe;

    wire    [3:0]                       spi0_ss_out;
    wire                                spi0_ss_oe;

    assign                              spi0_mosi = spi0_mosi_oe ? spi0_mosi_out : 1'bz;
    assign                              spi0_miso = spi0_miso_oe ? spi0_miso_out : 1'bz;
    assign                              spi0_sclk = spi0_sclk_oe ? spi0_sclk_out : 1'bz;
    assign                              spi0_ss   = spi0_ss_oe   ? spi0_ss_out   : 4'b111z;

    airi5c_top_asic DUT
    (
        .clk(clktree_root),
        .nreset(!reset_sync),
        .ext_interrupt(interrupt_sync),

        .tck(tck),
        .tms(tms),
        .tdi(tdi),
        .tdo(tdo),

        .testmode(1'b0),
        .sdi(),
        .sdo(),
        .sen(),

        .imem_haddr(imem_haddr),
        .imem_hwrite(imem_hwrite),
        .imem_hsize(imem_hsize),
        .imem_hburst(imem_hburst),
        .imem_hmastlock(imem_hmastlock),
        .imem_hprot(imem_hprot),
        .imem_htrans(imem_htrans),
        .imem_hwdata(imem_hwdata),
        .imem_hrdata(imem_hrdata),
        .imem_hready(imem_hready),
        .imem_hresp(imem_hresp),

        .dmem_haddr(dmem_haddr),
        .dmem_hwrite(dmem_hwrite),
        .dmem_hsize(dmem_hsize),
        .dmem_hburst(dmem_hburst),
        .dmem_hmastlock(dmem_hmastlock),
        .dmem_hprot(dmem_hprot),
        .dmem_htrans(dmem_htrans),
        .dmem_hwdata(dmem_hwdata),
        .dmem_hrdata(dmem_hrdata),
        .dmem_hready(dmem_hready),
        .dmem_hresp(dmem_hresp),

      // GPIO 0
        .gpio0_out(gpio0_out),
        .gpio0_in(gpio0_in),
        .gpio0_oe(),

      // UART 0
        .uart0_tx(uart0_tx),
        .uart0_rx(uart0_rx),

      // SPI 0
        .spi0_mosi_out(spi0_mosi_out),
        .spi0_mosi_in(spi0_mosi),
        .spi0_mosi_oe(spi0_mosi_oe),

        .spi0_miso_out(spi0_miso_out),
        .spi0_miso_in(spi0_miso),
        .spi0_miso_oe(spi0_miso_oe),

        .spi0_sclk_out(spi0_sclk_out),
        .spi0_sclk_in(spi0_sclk),
        .spi0_sclk_oe(spi0_sclk_oe),

        .spi0_ss_out(spi0_ss_out),
        .spi0_ss_in(spi0_ss[0]),
        .spi0_ss_oe(spi0_ss_oe),

        .debug_out(debug_out)
    );

`ifdef DUAL_PORT
    reg     [3:0]                       dmem_we;
    reg     [31:0]                      dmem_haddr_r;
    assign                              dmem_hready = ~|dmem_we;
    assign                              dmem_hresp  = `HASTI_RESP_OKAY;
    assign                              imem_hready = 1'b1;
    assign                              imem_hresp  = `HASTI_RESP_OKAY;

    always @(posedge clktree_root) begin
        if (reset_sync) begin
            dmem_we         <= 0;
            dmem_haddr_r    <= 0;
        end

        else begin
            if ((dmem_haddr[31:30] == 2'b10) && dmem_hwrite && ~|dmem_we) begin
                dmem_haddr_r    <= dmem_haddr;
                dmem_we         <= (dmem_hsize == 2)   ?  4'b1111 :
                                   (dmem_hsize == 1)   ? (4'b0011 << dmem_haddr[1:0]) :
                                   (dmem_hsize == 0)   ? (4'b0001 << dmem_haddr[1:0]) :
                                   4'b0000;
            end
            
            else
                dmem_we         <= 4'h0;
        end
    end

    blk_mem_gen_0 SRAM
    (
        .addra(imem_haddr[17:2]),
        .clka(clktree_root),
        .dina(imem_hwdata),
        .douta(imem_hrdata),
        .wea(4'h0),

        .addrb(|dmem_we ? dmem_haddr_r[17:2] : dmem_haddr[17:2]),
        .clkb(clktree_root),
        .dinb(dmem_hwdata),
        .doutb(dmem_hrdata),
        .web(dmem_we)
    );

`else
    wire    [`HASTI_ADDR_WIDTH-1:0]     mem_haddr;
    wire                                mem_hwrite;
    wire    [`HASTI_SIZE_WIDTH-1:0]     mem_hsize;
    wire    [`HASTI_BURST_WIDTH-1:0]    mem_hburst;
    wire                                mem_hmastlock;
    wire    [`HASTI_PROT_WIDTH-1:0]     mem_hprot;
    wire    [`HASTI_TRANS_WIDTH-1:0]    mem_htrans;
    wire    [`HASTI_BUS_WIDTH-1:0]      mem_hwdata;
    wire    [`HASTI_BUS_WIDTH-1:0]      mem_hrdata;
    wire                                mem_hready;
    wire    [`HASTI_RESP_WIDTH-1:0]     mem_hresp;
    
    reg     [3:0]                       mem_we;
    assign                              mem_hready = 1'b1;
    assign                              mem_hresp  = `HASTI_RESP_OKAY;
    
    always @(*) begin
        mem_we  = 4'b0000;
        
        if (mem_hwrite) begin
            case (mem_hsize)
            0:  mem_we  = 4'b0001 << mem_haddr[1:0];
            1:  mem_we  = 4'b0011 << mem_haddr[1:0];
            2:  mem_we  = 4'b1111 << mem_haddr[1:0];
            endcase
        end
    end
    
    airi5c_mem_arbiter arbiter
    (
        .setup_complete(1'b1),
        .nreset(!reset_sync),
        .clk(clktree_root),

        .mem_haddr(mem_haddr),
        .mem_hwrite(mem_hwrite),
        .mem_hsize(mem_hsize),
        .mem_hburst(mem_hburst),
        .mem_hmastlock(mem_hmastlock),
        .mem_hprot(mem_hprot),
        .mem_htrans(mem_htrans),
        .mem_hwdata(mem_hwdata),
        .mem_hrdata(mem_hrdata),
        .mem_hready(mem_hready),
        .mem_hresp(mem_hresp),

        .imem_haddr(imem_haddr),
        .imem_hwrite(imem_hwrite),
        .imem_hsize(imem_hsize),
        .imem_hburst(imem_hburst),
        .imem_hmastlock(imem_hmastlock),
        .imem_hprot(imem_hprot),
        .imem_htrans(imem_htrans),
        .imem_hwdata(imem_hwdata),
        .imem_hrdata(imem_hrdata),
        .imem_hready(imem_hready),
        .imem_hresp(imem_hresp),

        .dmem_haddr(dmem_haddr),
        .dmem_hwrite(dmem_hwrite),
        .dmem_hsize(dmem_hsize),
        .dmem_hburst(dmem_hburst),
        .dmem_hmastlock(dmem_hmastlock),
        .dmem_hprot(dmem_hprot),
        .dmem_htrans(dmem_htrans),
        .dmem_hwdata(dmem_hwdata),
        .dmem_hrdata(dmem_hrdata),
        .dmem_hready(dmem_hready),
        .dmem_hresp(dmem_hresp)
    );
    
    blk_mem_gen_0 SRAM
    (
        .addra(mem_haddr[17:2]),
        .clka(clktree_root),
        .dina(mem_hwdata),
        .douta(mem_hrdata),
        .wea(mem_we),

        .addrb(16'h0000),
        .clkb(clktree_root),
        .dinb(32'h00000000),
        .doutb(),
        .web(4'h0)
    );
`endif

endmodule
