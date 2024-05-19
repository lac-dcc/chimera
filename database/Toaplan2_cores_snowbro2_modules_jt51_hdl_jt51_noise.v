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
    Date: 6-2-2021
    */


/*

    NFRQ formula in the App:
    Output rate is 55kHz but for NFRQ=1 the formula states that
    the noise is 111kHz, twice the output rate per channel. The
    reason must be the inversion of the LFSR data

    That would suggest that the noise for LEFT and RIGHT are
    different but the rest of the system suggest that LEFT and
    RIGHT outputs are calculated at the same time, based on the
    same OP output.

    I have not been able to measure noise in actual chip because
    operator 31 does not produce any output on my two chips. This
    module is based on NukeYKT's work

*/

module jt51_noise(
    input             rst,
    input             clk,
    input             cen,    // phi 1
    input      [ 4:0] cycles,

    // Noise Frequency
    input      [ 4:0] nfrq,

    // Noise envelope
    input      [ 9:0] eg,     // serial signal in the original design
    input             op31_no,

    output            out,
    output reg [11:0] mix
);

reg         update, nfrq_met;
reg  [ 4:0] cnt;
reg  [15:0] lfsr;
reg         last_lfsr0;
wire        all1, fb;
wire        mix_sgn;

assign out = lfsr[0];

// period counter

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        cnt  <= 5'b0;
    end else if(cen) begin
        if( &cycles[3:0] ) begin
            cnt <= update ? 5'd0 : (cnt+5'd1);
        end
        update   <= nfrq_met;
        nfrq_met <= ~nfrq == cnt;
    end
end

// LFSR

assign fb   = update ? ~((all1 & ~last_lfsr0) | (lfsr[2]^last_lfsr0))
                     : ~lfsr[0];
assign all1 = &lfsr;

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        lfsr       <= 16'hffff;
        last_lfsr0 <= 1'b0;
    end else if(cen) begin
        lfsr       <= { fb, lfsr[15:1] };
        if(update) last_lfsr0 <= ~lfsr[0];
    end
end


// Noise mix

assign mix_sgn = /*eg!=10'd0 ^*/ ~out;

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        mix <= 12'd0;
    end else if( op31_no && cen ) begin
        mix     <= { mix_sgn, eg[9:2] ^ {8{out}}, {3{mix_sgn}} };
    end
end

endmodule
