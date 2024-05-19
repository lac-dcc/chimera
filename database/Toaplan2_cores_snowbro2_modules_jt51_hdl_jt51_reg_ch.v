// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT51.

    JT51 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT51 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT51.  If not, see <http://www.gnu.org/licenses/>.
    
    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 23-10-2019
    */

// Channel data is not stored in a CSR as operators
// Proof of that is the Splatter House arcade writes
// channel and operator data in two consequitive accesses
// without enough time in between to have the eight
// channels go through the CSR. So the channel data
// cannot be CSR, but regular registers.
module jt51_reg_ch(
    input         rst,
    input         clk,
    input         cen,
    input  [ 7:0] din,

    input  [ 2:0] up_ch,
    input         up_rl,
    input         up_kc,
    input         up_kf,
    input         up_pms,

    input      [2:0] ch, // next active channel
    output reg [1:0] rl,
    output reg [2:0] fb_II,
    output reg [2:0] con,
    output reg [6:0] kc,
    output reg [5:0] kf,
    output reg [1:0] ams_VII,
    output reg [2:0] pms
);

wire    [1:0]   rl_in   = din[7:6];
wire    [2:0]   fb_in   = din[5:3];
wire    [2:0]   con_in  = din[2:0];
wire    [6:0]   kc_in   = din[6:0];
wire    [5:0]   kf_in   = din[7:2];
wire    [1:0]   ams_in  = din[1:0];
wire    [2:0]   pms_in  = din[6:4];

reg [1:0] reg_rl[0:7];
reg [2:0] reg_fb[0:7];
reg [2:0] reg_con[0:7];
reg [6:0] reg_kc[0:7];
reg [5:0] reg_kf[0:7];
reg [1:0] reg_ams[0:7];
reg [2:0] reg_pms[0:7];

integer i;

always @(posedge clk) if(cen) begin
    rl      <= reg_rl[ch];
    fb_II   <= reg_fb[ch-3'd1];
    con     <= reg_con[ch];
    kc      <= reg_kc[ch];
    kf      <= reg_kf[ch];
    ams_VII <= reg_ams[ch-3'd6];
    pms     <= reg_pms[ch];
end

always @(posedge clk, posedge rst) begin
    if( rst ) for(i=0;i<8;i=i+1) begin
        reg_rl[i]  <= 0;
        reg_fb[i]  <= 0;
        reg_con[i] <= 0;
        reg_kc[i]  <= 0;
        reg_kf[i]  <= 0;
        reg_ams[i] <= 0;
        reg_pms[i] <= 0;
    end else begin
        i = 0; // prevents latch warning in Quartus
        if( up_rl  ) begin
            reg_rl[up_ch]  <= rl_in;
            reg_fb[up_ch]  <= fb_in;
            reg_con[up_ch] <= con_in;
        end
        if( up_kc  ) reg_kc[up_ch]  <= kc_in;
        if( up_kf  ) reg_kf[up_ch]  <= kf_in;
        if( up_pms ) begin
            reg_ams[up_ch] <= ams_in;
            reg_pms[up_ch] <= pms_in;
        end
    end
end

endmodule