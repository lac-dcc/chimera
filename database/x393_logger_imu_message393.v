// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>imu_message393
 * @file imu_message393.v
 * @date 2015-07-06  
 * @author Andrey Filippov     
 *
 * @brief Logs events from the odometer (can be software triggered), or other external source.
 *
 * Module includes 56-byte buffer for the received message - it is stored with the timestamp.  
 * It is possible to assert trig input (will request timestamp), write message by software, then
 * de-assert the trig input - message with the timestamp will be logged.
 * Has a fixed-length de-noise circuitry with latency 256*T(xclk) (~3usec)
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * imu_message393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  imu_message393.v is distributed in the hope that it will be useful,
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

module  imu_message393 (
    input                         mclk,    // system clock, negedge TODO:COnvert to posedge!
    input                         xclk,    // half frequency (80 MHz nominal)
    input                         we,      // write enable for registers to log (@negedge mclk), with lower data half
    input                   [3:0] wa,      // write address for register (4 bits, @negedge mclk)
//    input                  [15:0] di,    // 16-bit data in  multiplexed 
    input                  [31:0] din,     // 32-bit data in, non-multiplexed 
    input                         en,      // enable module operation, if 0 - reset
    input                         trig,    // leading edge - sample time, trailing set rdy
    output                        ts,      // timestamop request
    output                        rdy,     // data ready
    input                         rd_stb,  // data read strobe (increment address)
    output                 [15:0] rdata);  // data out (16 bits)

    reg    [ 4:0] raddr;
    reg           rdy_r=1'b0;
    reg    [ 2:0] trig_d;
    reg    [ 7:0] denoise_count;
    reg    [ 1:0] trig_denoise;
    reg           ts_r;
  
    assign rdy = rdy_r;
    assign ts =  ts_r;
  
    always @ (posedge xclk) begin
        if  (!en) trig_d[2:0] <= 3'h0;
        else      trig_d[2:0] <= {trig_d[1:0], trig};
        
        if      (!en)                      trig_denoise[0] <= 1'b0;
        else if (denoise_count[7:0]==8'h0) trig_denoise[0] <= trig_d[2];
    
        if (trig_d[2]==trig_denoise[0]) denoise_count[7:0] <= 8'hff;
        else                            denoise_count[7:0] <= denoise_count[7:0] - 1;
    
        trig_denoise[1] <= trig_denoise[0];
    
        ts_r <= !trig_denoise[1] && trig_denoise[0];
    
        if (!en || ts_r)    raddr[4:0] <= 5'h0;
        else if (rd_stb)    raddr[4:0] <= raddr[4:0] + 1;
    
        if  (ts_r || (rd_stb && (raddr[4:0]==5'h1b)) || !en) rdy_r <= 1'b0;
        else if (trig_denoise[1] && !trig_denoise[0])        rdy_r <= 1'b1;
    end

    reg     [31:0] odbuf0_ram[0:15];
    wire    [31:0] odbuf0_ram_out;
    always @ (posedge mclk) if (we) begin
        odbuf0_ram[wa[3:0]] <= din[31:0];
    end
    assign odbuf0_ram_out = odbuf0_ram[raddr[4:1]];
    assign rdata[15:0] = raddr[0] ? odbuf0_ram_out[15:0] : odbuf0_ram_out[31:16];

endmodule

