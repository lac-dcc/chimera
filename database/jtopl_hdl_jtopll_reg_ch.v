// This program was cloned from: https://github.com/jotego/jtopl
// License: GNU General Public License v3.0

/* This file is part of JTOPL

    JTOPL program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTOPL program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTOPL.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 28-5-2022

*/

module jtopll_reg_ch(
    input             rst,
    input             clk,
    input             cen,
    input             zero,
    input             rhy_en,
    input       [4:0] rhy_kon,
    input      [17:0] slot,

    input       [3:0] up_ch,
    input             up_fnumhi,
    input             up_fnumlo,
    input             up_inst,
    input       [7:0] din,

    input       [1:0] group,
    input       [2:0] sub,
    output reg        keyon,
    output reg  [2:0] block,
    output reg  [8:0] fnum,
    output reg  [3:0] inst,
    output reg  [3:0] vol,
    output reg        sus,
    output reg        rhy_oen,    // high for rhythm operators if rhy_en is set
    output            rhyon_csr
);

// Rhythm key-on CSR
localparam BD=4, SD=3, TOM=2, TC=1, HH=0;

reg  [5:0] rhy_csr;

reg  [8:0] reg_keyon, reg_sus;
reg  [2:0] reg_block[8:0];
reg  [3:0] reg_vol  [8:0];
reg  [3:0] reg_inst [8:0];
reg  [8:0] reg_fnum [8:0];
reg  [3:0] cur, i;

assign rhyon_csr = rhy_csr[5];

always @* casez( {group,sub} )
    5'o00 : cur = 1;
    5'o01 : cur = 2;
    5'o02 : cur = 0;
    5'o03 : cur = 1;
    5'o04 : cur = 2;
    5'o05 : cur = 3;
    5'o10 : cur = 4;
    5'o11 : cur = 5;
    5'o12 : cur = 3;
    5'o13 : cur = 4;
    5'o14 : cur = 5;
    5'o15 : cur = 6;
    5'o20 : cur = 7;
    5'o21 : cur = 8;
    5'o22 : cur = 6;
    5'o23 : cur = 7;
    5'o24 : cur = 8;
    5'o25 : cur = 0;
    default: cur = 4'hx;
endcase

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        keyon <= 0;
        block <= 0;
        fnum  <= 0;
        vol   <= 0;
        inst  <= 0;
        sus   <= 0;
    end else if(cen) begin
        keyon <= reg_keyon[cur];
        block <= reg_block[cur];
        fnum  <= reg_fnum [cur];
        vol   <= reg_vol  [cur];
        inst  <= reg_inst [cur];
        sus   <= reg_sus  [cur];
    end
end

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        reg_keyon <= 0;
        reg_sus   <= 0;
        for( i=0; i<9; i=i+1 ) begin
            reg_block[i] <= 0;
            reg_fnum [i] <= 0;
            reg_inst [i] <= 0;
            reg_vol  [i] <= 0;
        end
    end else if(cen) begin
        i <= 0;
        if( up_fnumlo ) reg_fnum[up_ch][7:0] <= din;
        if( up_fnumhi ) { reg_sus[up_ch], reg_keyon[up_ch], reg_block[up_ch], reg_fnum[up_ch][8] } <= din[5:0];
        if( up_inst   ) { reg_inst[up_ch], reg_vol[up_ch] } <= din;
    end
end

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        rhy_csr <= 6'd0;
        rhy_oen <= 0;
    end else if(cen) begin
        if(slot[11]) rhy_oen <= rhy_en;
        if(slot[17]) begin
            rhy_csr <= { rhy_kon[BD], rhy_kon[HH], rhy_kon[TOM],
                         rhy_kon[BD], rhy_kon[SD], rhy_kon[TC] };
            rhy_oen <= 0;
        end else
            rhy_csr <= { rhy_csr[4:0], rhy_csr[5] };
    end
end


endmodule