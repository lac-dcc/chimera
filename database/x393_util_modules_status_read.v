// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>status_read
 * @file status_read.v
 * @date 2015-01-14  
 * @author Andrey Filippov     
 *
 * @brief Receives status read data (low bandwidth) from multiple
 * subsystems byte-serial, stores in axi-addressable memory
 * 8-bita ddress is received from the source module,
 * as well as another (optional) byte of sequence number (set in write command)
 * Sequence number (received first afther the address) is stored as a high byte,
 * lower bytes are the actual payload, starting from lower byte (not all 3 are
 * required. Single-bit responsen can be combined in the same byte with the
 * sequence number to use just 2-byte packets? 
 * TODO: add interrupt capabilities
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * status_read.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  status_read.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  status_read#(
    parameter STATUS_ADDR =           'h0800, // AXI read address of status read registers
    parameter STATUS_ADDR_MASK =      'h3c00, // AXI write address of status registers
    parameter AXI_RD_ADDR_BITS =      14,
    parameter integer STATUS_DEPTH=   8, // 256 cells, maybe just 16..64 are enough?
    parameter FPGA_VERSION =          32'h03930001
    )(
    input                        mrst, // @posedge mclk - sync reset
    input                        arst, // @posedge axi_clk - sync reset
    input                        clk,
    input                        axi_clk,   // common for read and write channels
    input [AXI_RD_ADDR_BITS-1:0] axird_pre_araddr,     // status read address, 1 cycle ahead of read data
    input                        axird_start_burst, // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
    input     [STATUS_DEPTH-1:0] axird_raddr, //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
    input                        axird_ren,   //      .ren(bram_reg_re_w) ,      // read port enable
    input                        axird_regen, //==axird_ren?? - remove?   .regen(bram_reg_re_w),        // output register enable
    output              [31:0]   axird_rdata,  // combinatorial multiplexed (add external register layer, modify axibram_read?)     .data_out(rdata[31:0]),       // data out
    output                       axird_selected, // axird_rdata contains cvalid data from this module, vcalid next after axird_start_burst
                                                 // so with ren/regen it may be delayed 1 more cycle
    input                  [7:0] ad,               // byte-serial status data from the sources
    input                        rq,               // request from sources to transfer status data
    output                       start             // acknowledge receiving of first byte (address), currently always ready
);
    localparam integer DATA_2DEPTH=(1<<STATUS_DEPTH)-1;
    reg  [31:0] ram [0:DATA_2DEPTH];
    reg         [STATUS_DEPTH-1:0] waddr;
    reg                          we;
    reg                  [31: 0] wdata;
    reg                          rq_r;
    reg                   [3:0]  dstb;
    
    wire                         select_w;
    reg                          select_r;
    reg                          select_d;
    
    wire                         rd;
    wire                         regen;
    reg                 [31:0]   axi_status_rdata; 
    reg                 [31:0]   axi_status_rdata_r;
    
    assign select_w = ((axird_pre_araddr ^ STATUS_ADDR) & STATUS_ADDR_MASK)==0;
    assign rd =        axird_ren   && select_r;
    assign regen =     axird_regen && select_d;
    
    
    
    
//    assign re= pre_stb && (((axi_pre_addr ^ STATUS_ADDR) & STATUS_ADDR_MASK) == 0);
//    assign raddr=axi_pre_addr[STATUS_DEPTH-1:0];
    assign start=rq && !rq_r;
    assign axird_rdata=axi_status_rdata_r;
    assign axird_selected = select_r; 
    initial begin
        ram [DATA_2DEPTH]   = FPGA_VERSION;
`ifdef HISPI
        ram [DATA_2DEPTH-1] = 1; //0 - parallel sensor, 1 - HiSPi sensor 
`endif         
    end
    always @ (posedge axi_clk) begin
        if      (arst)              select_r <= 0;
        else if (axird_start_burst) select_r <= select_w;
    end
    always @ (posedge axi_clk) begin
        if (rd)       axi_status_rdata <= ram[axird_raddr];
        if (regen)    axi_status_rdata_r <= axi_status_rdata;
        
        select_d <=   select_r;
    end
    
    always @ (posedge clk) begin
        
        if (mrst) rq_r <= 0;
        else      rq_r <= rq;
        
        if (mrst)       dstb <= 0;
        else if (!rq)   dstb <= 0;
        else            dstb <= {dstb[2:0],~rq_r};
        // byte 0 - address
        if (mrst)       waddr <= 0;
        else if (start) waddr <= ad[STATUS_DEPTH-1:0];
        
        // byte 1 - 2 payload bits and sequence number
        // 6 bits of the sequence number will go to bits 26.. 31
        // 2 bits (24,25) are payload status
        if (mrst)         wdata[31:24] <= 0;
        else if (start)   wdata[31:24] <= 0;
        else if (dstb[0]) wdata[31:24] <= ad;

        // byte 2 - payload bits 0..7 
        if (mrst)         wdata[ 7: 0] <= 0;
        else if (start)   wdata[ 7: 0] <= 0;
        else if (dstb[1]) wdata[ 7: 0] <= ad;
        
        // byte 3 - payload bits 8..15 
        if (mrst)         wdata[15: 8] <= 0;
        else if (start)   wdata[15: 8] <= 0;
        else if (dstb[2]) wdata[15: 8] <= ad;

        // byte 4 - payload bits 16..23 
        if (mrst)         wdata[23:16] <= 0;
        else if (start)   wdata[23:16] <= 0;
        else if (dstb[3]) wdata[23:16] <= ad;
        
        if (mrst)         we <= 0;
        else              we <= !rq && rq_r; 
    end
    
    always @ (posedge clk) begin
        if (we)     ram[waddr]  <= wdata; // shifted data here
    end
                             


endmodule

