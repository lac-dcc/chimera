// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>pulse_cross_clock
 * @file pulse_cross_clock_orst.v
 * @date 2015-04-27  
 * @author Andrey Filippov     
 *
 * @brief Propagate a single pulse through clock domain boundary
 * For same frequencies input pulses can have 1:3 duty cycle EXTRA_DLY=0
 * and 1:5 for EXTRA_DLY=1 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * pulse_cross_clock.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  pulse_cross_clock.v is distributed in the hope that it will be useful,
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

module  pulse_cross_clock_orst#(
    parameter EXTRA_DLY=0 // for 
)(
    input  rst,
    input  src_clk,
    input  orst,     // output reset
    input  dst_clk,
    input  in_pulse, // single-cycle positive pulse
    output out_pulse,
    output busy
);
    localparam EXTRA_DLY_SAFE=EXTRA_DLY ? 1 : 0;
`ifndef IGNORE_ATTR
    (* KEEP = "TRUE" *)
`endif    
    reg       in_reg = 0; // can not be  ASYNC_REG as it can not be put together with out_reg
//WARNING: [Constraints 18-1079] Register sensors393_i/sensor_channel_block[0].sensor_channel_i/sens_sync_i/pulse_cross_clock_trig_in_pclk_i/in_reg_reg
// and sensors393_i/sensor_channel_block[0].sensor_channel_i/sens_sync_i/pulse_cross_clock_trig_in_pclk_i/out_reg_reg[0] are
//from the same synchronizer and have the ASYNC_REG property set, but could not be placed into the same slice due to constraints
// or mismatched control signals on the registers.
    
`ifndef IGNORE_ATTR
    (* ASYNC_REG = "TRUE" *)
`endif    
    reg [2:0] out_reg = 0;
`ifndef IGNORE_ATTR
    (* ASYNC_REG = "TRUE" *)
`endif    
    reg       busy_r = 0;
    assign out_pulse=out_reg[2];
    assign busy=busy_r; // in_reg;
    always @(posedge src_clk or posedge rst) begin
        if   (rst) in_reg <= 0;
        else       in_reg <= in_pulse || (in_reg && !out_reg[EXTRA_DLY_SAFE]);
        if   (rst) busy_r <= 0;
        else       busy_r <= in_pulse || in_reg || (busy_r && (|out_reg[EXTRA_DLY_SAFE:0]));
    end
//    always @(posedge dst_clk or posedge rst) begin
    always @(posedge dst_clk) begin
        if (orst) out_reg <= 3'b0;  
        else      out_reg <= {out_reg[0] & ~out_reg[1],out_reg[0],in_reg};
    end
endmodule

