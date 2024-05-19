// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dcc_sync393
 * @file dcc_sync393.v
 * @date 2015-06-17  
 * @author Andrey Filippov     
 *
 * @brief Synchronises output of DC components
 * Syncronizes dcc data with dma1 output, adds 16..31 16-bit zero words for Axis DMA
 * Was not used in late NC353 camera (DMA channel used fro IMU logger)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * dcc_sync393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dcc_sync393.v is distributed in the hope that it will be useful,
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

module  dcc_sync393(
    input             sclk,         // system clock:  twe, ta,tdi - valid @negedge (ra, tdi - 2 cycles ahead)
    input             dcc_en, // clk rising, sync with start of the frame
    input             finish_dcc, // sclk rising
    input             dcc_vld,    // clk rising
    input      [15:0] dcc_data, //[15:0] clk risimg
    output reg        statistics_dv, //sclk
    output reg [15:0] statistics_do); //[15:0] sclk

    reg           statistics_we;
    reg           dcc_run;
    reg           dcc_finishing;
    reg           skip16; // output just 16 zero words (data was multiple of 16 words)
    reg    [ 4:0] dcc_cntr;
    
    always @ (posedge sclk) begin
        dcc_run <= dcc_en;
        statistics_we <= dcc_run && dcc_vld && !statistics_we;
        statistics_do[15:0] <= statistics_we?dcc_data[15:0]:16'h0;
        statistics_dv <= statistics_we || dcc_finishing;
        skip16 <= finish_dcc && (statistics_dv?(dcc_cntr[3:0]==4'hf):(dcc_cntr[3:0]==4'h0) ); 
        if (!dcc_run)           dcc_cntr[3:0] <= 4'h0;
        else if (statistics_dv) dcc_cntr[3:0] <= dcc_cntr[3:0]+1; 
        dcc_cntr[4]   <= dcc_run && ((dcc_finishing && ((dcc_cntr[3:0]==4'hf)^dcc_cntr[4]) || skip16));
        dcc_finishing <= dcc_run && (finish_dcc   || (dcc_finishing && (dcc_cntr[4:1]!=4'hf)));
    end

endmodule

