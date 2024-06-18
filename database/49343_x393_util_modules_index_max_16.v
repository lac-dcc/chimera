// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>index_max_16
 * @file index_max_16.v
 * @date 2015-01-09  
 * @author Andrey Filippov     
 *
 * @brief Find index of the maximal of 16 values (masked), 4 cycle latency
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * index_max_16.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  index_max_16.v is distributed in the hope that it will be useful,
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

module  index_max_16 #(
    parameter width=16
    ) (
    input                clk,
    input [16*width-1:0] values,
    input         [15:0] mask,
    input                need_in, // at least one of the channels needs access 
    output        [ 3:0] index,
    output               valid,
    output               need_out // need_in with matching delay
);
    wire [width-1:0] max0001,max0203,max0405,max0607,max0809,max1011,max1213,max1415,max00010203,max04050607,max08091011, max12131415; 
    wire [width-1:0] max0001020304050607,max0809101112131415; 
    wire sel0001,sel0203,sel0405,sel0607,sel0809,sel1011,sel1213,sel1415,sel00010203,sel04050607;
    wire sel08091011, sel12131415, sel0001020304050607,sel0809101112131415, sel; 

    wire msk0001,msk0203,msk0405,msk0607,msk0809,msk1011,msk1213,msk1415,msk00010203,msk04050607;
    wire msk08091011, msk12131415, msk0001020304050607,msk0809101112131415; //, msk; 

    reg  sel0001_r,sel0203_r,sel0405_r,sel0607_r,sel0809_r,sel1011_r,sel1213_r,sel1415_r;
    reg  [1:0] sel00010203_r,sel04050607_r,sel08091011_r, sel12131415_r;
    reg  [2:0] sel0001020304050607_r,sel0809101112131415_r;
    reg  [3:0] valid_dly;
    reg  [3:0] need_dly;
    reg [15:0] mask_prev; // previous value of mask (invalidate if mask changes)
    wire       mask_changed;
//    assign     mask_changed= mask!=mask_prev;
    assign     mask_changed= |(~mask &mask_prev); // only invalidate if any bit goes off (granted)

// 1-st layer
    masked_max_reg #(width) i_masked_max_reg0001(
        .clk(clk),
        .a(values[width*0 +: width]),
        .mask_a(mask[0]),
        .b(values[width*1 +: width]),
        .mask_b(mask[1]),
        .max(max0001),
        .s(sel0001),
        .valid(msk0001));
    masked_max_reg #(width) i_masked_max_reg0203(
        .clk(clk),
        .a(values[width*2 +: width]),
        .mask_a(mask[2]),
        .b(values[width*3 +: width]),
        .mask_b(mask[3]),
        .max(max0203),
        .s(sel0203),
        .valid(msk0203));
    masked_max_reg #(width) i_masked_max_reg0405(
        .clk(clk),
        .a(values[width*4 +: width]),
        .mask_a(mask[4]),
        .b(values[width*5 +: width]),
        .mask_b(mask[5]),
        .max(max0405),
        .s(sel0405),
        .valid(msk0405));
    masked_max_reg #(width) i_masked_max_reg0607(
        .clk(clk),
        .a(values[width*6 +: width]),
        .mask_a(mask[6]),
        .b(values[width*7 +: width]),
        .mask_b(mask[7]),
        .max(max0607),
        .s(sel0607),
        .valid(msk0607));
    masked_max_reg #(width) i_masked_max_reg0809(
        .clk(clk),
        .a(values[width*8 +: width]),
        .mask_a(mask[8]),
        .b(values[width*9 +: width]),
        .mask_b(mask[9]),
        .max(max0809),
        .s(sel0809),
        .valid(msk0809));
    masked_max_reg #(width) i_masked_max_reg1011(
        .clk(clk),
        .a(values[width*10 +: width]),
        .mask_a(mask[10]),
        .b(values[width*11 +: width]),
        .mask_b(mask[11]),
        .max(max1011),
        .s(sel1011),
        .valid(msk1011));
    masked_max_reg #(width) i_masked_max_reg1213(
        .clk(clk),
        .a(values[width*12 +: width]),
        .mask_a(mask[12]),
        .b(values[width*13 +: width]),
        .mask_b(mask[13]),
        .max(max1213),
        .s(sel1213),
        .valid(msk1213));
    masked_max_reg #(width) i_masked_max_reg1415(
        .clk(clk),
        .a(values[width*14 +: width]),
        .mask_a(mask[14]),
        .b(values[width*15 +: width]),
        .mask_b(mask[15]),
        .max(max1415),
        .s(sel1415),
        .valid(msk1415));
        
// 2-nd layer
    masked_max_reg #(width) i_masked_max_reg00010203(
        .clk(clk),
        .a(max0001),
        .mask_a(msk0001),
        .b(max0203),
        .mask_b(msk0203),
        .max(max00010203),
        .s(sel00010203),
        .valid(msk00010203));
    masked_max_reg #(width) i_masked_max_reg04050607(
        .clk(clk),
        .a(max0405),
        .mask_a(msk0405),
        .b(max0607),
        .mask_b(msk0607),
        .max(max04050607),
        .s(sel04050607),
        .valid(msk04050607));
    masked_max_reg #(width) i_masked_max_reg08091011(
        .clk(clk),
        .a(max0809),
        .mask_a(msk0809),
        .b(max1011),
        .mask_b(msk1011),
        .max(max08091011),
        .s(sel08091011),
        .valid(msk08091011));
    masked_max_reg #(width) i_masked_max_reg12131415(
        .clk(clk),
        .a(max1213),
        .mask_a(msk1213),
        .b(max1415),
        .mask_b(msk1415),
        .max(max12131415),
        .s(sel12131415),
        .valid(msk12131415));
// 3-nd layer
    masked_max_reg #(width) i_masked_max_reg0001020304050607(
        .clk(clk),
        .a(max00010203),
        .mask_a(msk00010203),
        .b(max04050607),
        .mask_b(msk04050607),
        .max(max0001020304050607),
        .s(sel0001020304050607),
        .valid(msk0001020304050607));
    masked_max_reg #(width) i_masked_max_reg0809101112131415(
        .clk(clk),
        .a(max08091011),
        .mask_a(msk08091011),
        .b(max12131415),
        .mask_b(msk12131415),
        .max(max0809101112131415),
        .s(sel0809101112131415),
        .valid(msk0809101112131415));
// 4-th layer
    masked_max_reg #(width) i_masked_max_reg(
        .clk(clk),
        .a(max0001020304050607),
        .mask_a(msk0001020304050607),
        .b(max0809101112131415),
        .mask_b(msk0809101112131415),
        .max(),
        .s(sel),
        .valid()); //msk));
    always @ (posedge clk) begin
        sel0001_r<=sel0001;
        sel0203_r<=sel0203;
        sel0405_r<=sel0405;
        sel0607_r<=sel0607;
        sel0809_r<=sel0809;
        sel1011_r<=sel1011;
        sel1213_r<=sel1213;
        sel1415_r<=sel1415;
        sel00010203_r[1:0]<={sel00010203,sel00010203?sel0203_r:sel0001_r};
        sel04050607_r[1:0]<={sel04050607,sel04050607?sel0607_r:sel0405_r};
        sel08091011_r[1:0]<={sel08091011,sel08091011?sel1011_r:sel0809_r};
        sel12131415_r[1:0]<={sel12131415,sel12131415?sel1415_r:sel1213_r};
        sel0001020304050607_r[2:0]<={sel0001020304050607,sel0001020304050607?sel04050607_r[1:0]:sel00010203_r[1:0]};
        sel0809101112131415_r[2:0]<={sel0809101112131415,sel0809101112131415?sel12131415_r[1:0]:sel08091011_r[1:0]};
        valid_dly[3:0] <= {valid_dly[2:0],|mask[15:0] & ~mask_changed}; // invalidate when mask changed (or only if new is zero?
        need_dly[3:0]  <= {need_dly[2:0],need_in};
        mask_prev <= mask;
    end
assign index[3:0]={
                sel,
                sel?sel0809101112131415_r[2:0]:sel0001020304050607_r[2:0]};
                
//assign valid=valid_dly[3];
assign valid=&valid_dly; // need && |mask ?
assign need_out=need_dly[3];
endmodule

