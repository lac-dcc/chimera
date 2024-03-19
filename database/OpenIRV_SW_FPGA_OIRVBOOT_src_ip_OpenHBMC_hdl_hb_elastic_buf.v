/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hb_elastic_buf.v
 *  Purpose:  Elastic buffer module. Used to synchronize data transfer between
 *            two similar, but unsynchronized clock domains.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module hb_elastic_buf
(
    input   wire            clk_din,
    input   wire    [15:0]  din,
    input   wire            din_vld,
    
    input   wire            srst,
    input   wire            clk_dout,
    output  wire    [15:0]  dout,
    output  wire            dout_vld
);
    
    reg     [2:0]   ram_wr_addra = 3'b000;
    reg     [2:0]   ram_rd_addrb = 3'b000;
    reg             start = 1'b0;
    reg             start_latch = 1'b0;
    wire            start_sync;
    
    
    /*
     * The principle of operation:
     *
     * It is assumed that phase relation between RDWS strobe 
     * and memory clock, forwarded by FPGA, is not constant, 
     * it varies over PVT (process-voltage-temperature) i.e. 
     * it is completely uncertain.
     * 
     * One of the most reliable ways to transfer incoming
     * data from RWDS domain to internal system clock domain 
     * is using an elastic buffer, based on a dual-port RAM.
     * This is working like circular queue buffer.
     *
     * Incoming data is going to the port A of RAM that is 
     * clocked by RWDS strobe. Synchronized data is coming
     * out of the port B, that is clocked by destination
     * domain clock. There are two RAM pointers, the writing
     * and the reading one. Both pointers are reseted to zero,
     * during reset state. 
     
     * As soon as RWDS starts toggling, incoming data will
     * be written to the RAM and writing pointer will be 
     * incremented. At the same time a special start signal
     * is asserted in the RWDS domain to signal the reading
     * circuit to start reading RAM from the zero pointer.
     * As start signal is asynchronous to reading port clock
     * domain, it is passed though a single bit synchronizer.
     * This synchronizer also acts as a delay for the start
     * signal and provides some time margin between writing
     * and reading circuits. This time margin allows to
     * neutralize the uncertainty of this two clock domains.
     * As frequencies of both clock domains are similar, the 
     * writing and reading pointer will never simultaneously 
     * point to the same RAM address. The reading circuit
     * also erases data valid flag after reading, this feature
     * allows not to read previously received data again, when 
     * writing pointer stops along with RWDS.
     */
    
    
    always @(posedge clk_din or posedge srst) begin
        if (srst) begin
            start <= 1'b0;
            ram_wr_addra <= 3'b000;
        end else begin
            start <= 1'b1;
            ram_wr_addra <= ram_wr_addra + 1'b1;
        end
    end
    
    
    sync_cdc_bit #(.C_SYNC_STAGES(3)) sync_cdc_bit_0
    (
        .clk    ( clk_dout   ),
        .d      ( start      ),
        .q      ( start_sync )
    );
    
    
    dp_ram8x17 dp_ram8x17_inst 
    (
        .clka   ( clk_din          ),   // input clka
        .rsta   ( 1'b0             ),   // input rsta
        .ena    ( 1'b1             ),   // input ena
        .wea    ( 1'b1             ),   // input [0 : 0] wea
        .addra  ( ram_wr_addra     ),   // input [2 : 0] addra
        .dina   ( {din_vld, din}   ),   // input [16 : 0] dina
        .douta  ( /*-----NC-----*/ ),   // output [16 : 0] douta
        
        .clkb   ( clk_dout         ),   // input clkb
        .rstb   ( srst             ),   // input rstb
        .enb    ( 1'b1             ),   // input enb
        .web    ( 1'b1             ),   // input [0 : 0] web
        .addrb  ( ram_rd_addrb     ),   // input [2 : 0] addrb
        .dinb   ( {17{1'b0}}       ),   // input [16 : 0] dinb
        .doutb  ( {dout_vld, dout} )    // output [16 : 0] doutb
    );
    
    
    always @(posedge clk_dout) begin
        if (srst) begin
            start_latch  <= 1'b0;
            ram_rd_addrb <= 3'b000;
        end else begin
            start_latch <= (start_latch)? 1'b1 : start_sync;
            
            if (start_sync | start_latch) begin
                ram_rd_addrb <= ram_rd_addrb + 1'b1;
            end
        end
    end
    
endmodule

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
