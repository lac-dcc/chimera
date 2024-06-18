// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 12-5-2020 */

// Equivalent to NEC uPD4701A
// if A comes first, it increases the count
module jt4701(
    input               clk,
    input               rst,
    input      [1:0]    x_in, // MSB=A, LSB=B
    input      [1:0]    y_in, // MSB=A, LSB=B
    input               rightn,
    input               leftn,
    input               middlen,
    input               x_rst,
    input               y_rst,
    input               csn,        // chip select
    input               uln,        // byte selection
    input               xn_y,       // select x or y for reading
    output reg          cfn,        // counter flag
    output reg          sfn,        // switch flag
    output reg [7:0]    dout
);

wire [11:0] cntx, cnty;
wire        xflagn, yflagn;

wire [ 7:0] upper, lower;

assign      upper = { sfn, leftn, rightn, middlen, xn_y ? cnty[11:8] : cntx[11:8] };
assign      lower = xn_y ? cnty[7:0] : cntx[7:0];

jt4701_axis u_axisx(
    .clk        ( clk       ),
    .rst        ( x_rst     ),
    .sigin      ( x_in      ),
    .flag_clrn  ( csn       ),
    .flagn      ( xflagn    ),
    .axis       ( cntx      )
);

jt4701_axis u_axisy(
    .clk        ( clk       ),
    .rst        ( y_rst     ),
    .sigin      ( y_in      ),
    .flag_clrn  ( csn       ),
    .flagn      ( yflagn    ),
    .axis       ( cnty      )
);

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        cfn  <= 1;
        sfn  <= 1;
        dout <= 8'd0;
    end else begin
        sfn  <= leftn && middlen && rightn;
        cfn  <= xflagn && yflagn;
        dout <= uln ? upper : lower;
    end
end

endmodule

module jt4701_axis(
    input               clk,
    input               rst,   // synchronous
    input      [1:0]    sigin,
    input               flag_clrn,
    output reg          flagn,
    output reg [11:0]   axis
);

wire [1:0] xedge;
reg  [1:0] last_in, locked, last_xedge;
wire       posedge_a, posedge_b, negedge_a, negedge_b;
reg        ping, pong;

assign     xedge = sigin ^ last_in;
assign     posedge_a = ~last_in[1] &  sigin[1];
assign     posedge_b = ~last_in[0] &  sigin[0];
assign     negedge_a =  last_in[1] & ~sigin[1];
assign     negedge_b =  last_in[0] & ~sigin[0];

`ifdef SIMULATION
initial begin
    axis    = 12'd0;
    last_in = 2'b0;
    flagn   = 1;
    locked  = 2'b00;
end
`endif

always @(posedge clk) begin
    if( rst ) begin
        axis   <= 12'd0;
        last_in<= 2'b0;
        flagn  <= 1;
        locked <= 2'b00;
        ping   <= 0;
        pong   <= 0;
    end else begin
        flagn      <= !flag_clrn || !(xedge!=2'b00 && locked[0]!=locked[1]);
        last_in    <= sigin;

        if( posedge_b ) begin
            ping <= 0;
            pong <= 1;
        end

        if( posedge_a ) begin
            ping <= 1;
            pong <= 0;
        end

        if( (posedge_a && !sigin[0]) || (negedge_a && sigin[0]) ) begin
            if( pong ) axis <= axis + 12'd1;
        end else begin
            if( (posedge_b && !sigin[1]) || (negedge_b && sigin[1]) ) begin
                if(ping) axis <= axis - 12'd1;
            end
        end

    end
end

endmodule

module jt4701_dialemu(
    input            clk,
    input            rst,
    input            pulse,
    input            inc,
    input            dec,
    output reg [1:0] dial
);

reg s;
reg last_pulse;

always @(posedge clk) last_pulse <= pulse;

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        dial <= 2'b0;
        s    <= 0;
    end else if( pulse && !last_pulse ) begin
        s <= ~s;
        if( inc ) begin
            if( !s ) dial[0] <= ~dial[0];
            if(  s ) dial[1] <= dial[0];
        end else if( dec ) begin
            if( !s ) dial[1] <= ~dial[1];
            if(  s ) dial[0] <= dial[1];
        end else begin
            dial[0] <= 0;
            dial[1] <= 0;
        end
    end
end

endmodule

//////////////////////////////////////////////////////////
module jt4701_dialemu_2axis(
    input            rst,
    input            clk,
    input            LHBL,
    input      [1:0] inc,
    input      [1:0] dec,
    // 4701 direct connections
    input            x_rst,
    input            y_rst,
    input            uln,       // upper / ~lower
    input            cs,
    input            xn_y,      // ~x / y
    output           cfn,
    output           sfn,
    output     [7:0] dout
);

    wire [1:0] x_in, y_in;
    reg  [1:0] tick;
    reg        last_LHBL;

    // The dial update ryhtm is set to once every four lines
    always @(posedge clk) begin
        last_LHBL <= LHBL;
        if( LHBL && !last_LHBL ) tick <= tick+2'd1;
    end

    jt4701 u_dial(
        .clk        ( clk       ),
        .rst        ( rst       ),
        .x_in       ( x_in      ),
        .y_in       ( y_in      ),
        .rightn     ( 1'b1      ),
        .leftn      ( 1'b1      ),
        .middlen    ( 1'b1      ),
        .x_rst      ( x_rst     ),
        .y_rst      ( y_rst     ),
        .csn        ( ~cs       ),        // chip select
        .uln        ( uln       ),        // byte selection
        .xn_y       ( xn_y      ),        // select x or y for reading
        .cfn        ( cfn       ),        // counter flag
        .sfn        ( sfn       ),        // switch flag
        .dout       ( dout      )
    );

    jt4701_dialemu u_dial1p(
        .clk        ( clk       ),
        .rst        ( rst       ),
        .pulse      ( tick[1]   ),
        .inc        ( inc[0]    ),
        .dec        ( dec[0]    ),
        .dial       ( x_in      )
    );

    jt4701_dialemu u_dial2p(
        .clk        ( clk       ),
        .rst        ( rst       ),
        .pulse      ( tick[1]   ),
        .inc        ( inc[1]    ),
        .dec        ( dec[1]    ),
        .dial       ( y_in      )
    );

endmodule