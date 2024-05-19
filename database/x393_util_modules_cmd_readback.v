// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_readback
 * @file cmd_readback.v
 * @date 2015-05-05  
 * @author Andrey Filippov     
 *
 * @brief Store control register data and readback
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_readback.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_readback.v is distributed in the hope that it will be useful,
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

module  cmd_readback#(
    parameter AXI_WR_ADDR_BITS=              14,
    parameter AXI_RD_ADDR_BITS =             14,
    parameter CONTROL_RBACK_DEPTH=           11, // 10 - 1xbram, 11 - 2xbram
    
    parameter CONTROL_ADDR =             'h0000,  // AXI write address of control write registers
    parameter CONTROL_ADDR_MASK =        'h3800,  // AXI write address of control registers
    parameter CONTROL_RBACK_ADDR =       'h0000,  // AXI write address of control write registers
    parameter CONTROL_RBACK_ADDR_MASK =  'h3800   // AXI write address of control registers
)(
    input                            mrst, // @posedge mclk - sync reset
    input                            arst, // @posedge axi_clk - sync reset
    input                            mclk,
    input                            axi_clk,
    input     [AXI_WR_ADDR_BITS-1:0] par_waddr,     // parallel address
    input                     [31:0] par_data,      // parallel 32-bit data
    input                            ad_stb,        // low address output strobe (and parallel A/D)
    
    input    [AXI_RD_ADDR_BITS-1:0] axird_pre_araddr,  // status read address, 1 cycle ahead of read data
    input                           axird_start_burst, // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
    input [CONTROL_RBACK_DEPTH-1:0] axird_raddr,       //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
    input                           axird_ren,         //      .ren(bram_reg_re_w) ,      // read port enable
//    input                        axird_regen,       //==axird_ren?? - remove?   .regen(bram_reg_re_w),        // output register enable
    output                 [31:0]   axird_rdata,       // combinatorial multiplexed (add external register layer, modify axibram_read?)     .data_out(rdata[31:0]),       // data out
    output                          axird_selected    // axird_rdata contains cvalid data from this module, vcalid next after axird_start_burst

);
    localparam integer DATA_2DEPTH = (1<<CONTROL_RBACK_DEPTH)-1;
    reg  [31:0] ram [0:DATA_2DEPTH];
    reg  [CONTROL_RBACK_DEPTH-1:0] waddr;
    reg                            we;
    reg                    [31: 0] wdata;
    
    wire                           select_w;
    reg                            select_r;
    reg                            select_d;
    
    wire                           rd;
    wire                           regen;
    reg                   [31:0]   axi_rback_rdata; 
    reg                   [31:0]   axi_rback_rdata_r;
    reg                            axird_regen;
    wire                           we_w;
    
    assign we_w = ad_stb && (((par_waddr ^ CONTROL_ADDR) & CONTROL_ADDR_MASK)==0);
    assign select_w = ((axird_pre_araddr ^ CONTROL_RBACK_ADDR) & CONTROL_RBACK_ADDR_MASK)==0;
    assign rd =        axird_ren   && select_r;
    assign regen =     axird_regen && select_d;
    assign axird_rdata=axi_rback_rdata_r;
    assign axird_selected = select_r; 
    
    
    always @ (posedge axi_clk) begin
        if (arst) axird_regen <= 0;
        else      axird_regen <= axird_ren;
        
        if      (arst)              select_r <= 0;
        else if (axird_start_burst) select_r <= select_w;
    
    end
    always @ (posedge axi_clk) begin
        if (rd)       axi_rback_rdata <= ram[axird_raddr];
        if (regen)    axi_rback_rdata_r <= axi_rback_rdata;
        select_d <=   select_r;
    end
    
    always @ (posedge mclk) begin
        if (mrst) we <= 0;
        else      we <= we_w;
    end
    always @ (posedge mclk) begin
        if (we_w) wdata <= par_data;
        if (we_w) waddr <= par_waddr[CONTROL_RBACK_DEPTH-1:0];
        
    end

    always @ (posedge mclk) begin
        if (we)     ram[waddr]  <= wdata; // shifted data here
    end
    

endmodule

