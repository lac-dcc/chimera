// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>huff_fifo393
 * @file huff_fifo393.v
 * @author Andrey Filippov     
 *
 * @brief Part of Huffman encoder for JPEG compressor - FIFO for Huffman encoder
 * based on earlier design that used 2x clock. Superseded by huffman_stuffer_meta.
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * huff_fifo393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * huff_fifo393.v is distributed in the hope that it will be useful,
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

module huff_fifo393 (
    input             xclk,            // pixel clock, posedge
    input             xclk2x,          // twice frequency - uses negedge inside
    input             en,              // will reset if ==0 (sync to xclk)
    input      [15:0] di,              // data in (sync to xclk)
    input             ds,              // din valid (sync to xclk)
    input             want_read,       // will be and-ed with dav
    output            dav,             // FIFO output latch has data (fifo_or_full)
    output reg [15:0] q
    );        // output data

    reg     [9:0] wa;
    reg     [9:0] ra_r;
    wire   [15:0] fifo_o;
    reg           ds1;     // ds delayed by one xclk to give time to block ram to write data. Not needed likely.
    reg           synci;
    reg     [2:0] synco;
    reg           sync_we; // single xclk2x period pulse for each ds@xclk
    reg           en2x;    // en sync to xclk2x;

    reg     [9:0] diff_a;
    
    wire    [3:0] re;
    reg     [2:0] nempty_r; // output register and RAM registers not empty
    wire    [3:0] nempty;   // output register and RAM register and RAM internal are not empty
    wire          many;     

    assign dav =    nempty[0];
    assign nempty = {(|diff_a), nempty_r};
    assign many =   &(nempty); // memory and all the register chain are full
    assign re =    {4{many & want_read}} | {nempty[3] & ~nempty[2], // read memory location
                                            nempty[2] & ~nempty[1], // regen
                                            nempty[1] & ~nempty[0], // copy to q- register
                                            nempty[0] & want_read}; // external read when data is available
                                                      
    always @ (posedge xclk) begin // input stage, no overrun detection. TODO: propagate half-full?
        if (!en)      wa <= 0;
        else if (ds)  wa <= wa+1;
        
        ds1                   <= ds && en;
        if (!en)      synci   <= 1'b0;
        else if (ds1) synci   <= ~synci;
    end
    
    always @ (negedge xclk2x) begin
        en2x <= en;
        synco   <= {synco[1:0],synci};
        sync_we      <= en2x && (synco[1] != synco[2]);
    end
  
    always @ (negedge xclk2x) begin
        if      (!en2x)         nempty_r[0] <= 0;
        else if (re[1] ^ re[0]) nempty_r[0] <=re[1];
        
        if      (!en2x)         nempty_r[1] <= 0;
        else if (re[2] ^ re[1]) nempty_r[1] <=re[2];

        if      (!en2x)         nempty_r[2] <= 0;
        else if (re[3] ^ re[2]) nempty_r[2] <=re[3];

        if        (!en2x)       ra_r <= 0;
        else if   (re[3])       ra_r <= ra_r + 1;
        
        if (!en2x)                   diff_a <= 0;
        else if ( sync_we && !re[3]) diff_a <= diff_a + 1;
        else if (!sync_we &&  re[3]) diff_a <= diff_a - 1;
        
        if      (!en2x) q <= 0;                  
        else if (re[1]) q <= fifo_o;
        
    end

    ram18_var_w_var_r #(
        .REGISTERS    (1),
        .LOG2WIDTH_WR (4),
        .LOG2WIDTH_RD (4),
        .DUMMY        (0)
    ) i_fifo (
        .rclk         (xclk2x),        // input
        .raddr        (ra_r[9:0]),     // input[9:0] 
        .ren          (re[3]),         // input
        .regen        (re[2]),         // input
        .data_out     (fifo_o[15:0]),  // output[15:0] 
        .wclk         (xclk),          // input
        .waddr        (wa[9:0]),       // input[9:0] 
        .we           (ds),            // input
        .web          (4'hf),          // input[3:0] 
        .data_in      (di[15:0])       // input[15:0] 
    );
 
endmodule
