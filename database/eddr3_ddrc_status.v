/*******************************************************************************
 * Module: ddrc_status
 * Date:2014-05-19  
 * Author: Andrey Filippov
 * Description: Read status/radback information from the DDR controller
 *
 * Copyright (c) 2014 Elphel, Inc.
 * ddrc_status.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ddrc_status.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps

module  ddrc_status
//#(
//    parameter AXI_RD_ADDR_BITS=   12
//    parameter SELECT_ADDR =      'h800, // address to select this module
//    parameter SELECT_ADDR_MASK = 'h800, // address mask to select this  module
//    parameter BUSY_ADDR =        'hc00, // address to generate busy
//    parameter BUSY_ADDR_MASK =   'hc00  // address mask to generate busy
//)
 (
//    input                         clk,
//    input                         mclk,
//    input                         rst,
//    input  [AXI_RD_ADDR_BITS-1:0] pre_raddr,     // AXI reade address, before actual reads (to generate busy), valid@start_burst
//    input                         start_rburst,  // burst start - should generate ~ready (should be AND-ed with !busy internally) 
//    input  [AXI_RD_ADDR_BITS-1:0] raddr,         // read address, valid with rd_en
//    input                         rd_en,         // read enable
    output                 [31:0] rdata,         // read data, should valid with raddr and rd_en
    output                        busy,          // interface busy (combinatorial delay from start_wburst and pre_addr
// status/readback signals
//    input                         run_done,      // sequencer done (add busy?)
    input                         run_busy,       // sequencer busy
    input                         locked,        // MMCM and PLL locked
    input                         locked_mmcm,
    input                         locked_pll,
    input                         dly_ready,
    input                         dci_ready,
    input                         ps_rdy,        // MMCM phase shift control ready
    input                  [ 7:0] ps_out         // MMCM phase shift value (in 1/56 of the Fvco period)
);
    assign busy=0;
    assign rdata={17'b0,dly_ready,dci_ready, locked_mmcm, locked_pll, run_busy,locked,ps_rdy,ps_out[7:0]};
    

endmodule

