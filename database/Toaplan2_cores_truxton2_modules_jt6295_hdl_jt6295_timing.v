// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JT6295.
    JT6295 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT6295 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT6295.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 6-1-2020 */

// input cen should be 1,000 kHz
// SS low  = divides by 164 (25.6 and 6.5kHz)
// SS high = divides by 132 (32   and 8  kHz)

module jt6295_timing(
    input       clk,
    input       cen,
    input       ss,
    output reg  cen_sr,   // Sample rate
    output reg  cen_sr4,  // 4x sample rate
    output reg  cen_sr4b, // 4x sample rate, 180 shift
    output reg  cen_sr32,
    output reg  cen_48k   // 48 kHz low pass filter
);

localparam [7:0] N48=8'd6, D48=8'd125;

reg  [2:0] base=0;
reg  [5:0] cnt =6'd0;
wire [2:0] lim = ss ? 3'h3 : 3'h4;

reg  [7:0] cnt48=0;
wire       over48 = cnt48>=D48;

always @(posedge clk) begin
    if(cen) cnt48 <= over48 ? cnt48-(D48-N48) : cnt48+N48;
    cen_48k <= over48 && cen;
end

always @(posedge clk) begin
    cen_sr4 <= 1'd0;
    cen_sr4b<= 1'd0;
    cen_sr  <= 1'd0;
    cen_sr32<= 1'b0;
    if( cen ) begin
        base    <= (base==lim) ? 3'd0 : base+3'd1;
        if(base==3'd0) cnt <= (cnt==6'd32) ? 6'd0 : cnt+6'd1;

        cen_sr32<= !cnt[5] && base==3'd0;
        cen_sr4 <= !cnt[5] && cnt[2:0] == 3'b000 && base == 3'd0;
        cen_sr4b<= !cnt[5] && cnt[2:0] == 3'b100 && base == 3'd0;
        cen_sr  <= {cnt,base} == 9'd0;
    end
end

endmodule