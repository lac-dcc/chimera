// This program was cloned from: https://github.com/MiSTer-devel/MegaCD_MiSTer
// License: GNU General Public License v3.0

/* This file is part of JT12.

 
    JT12 program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT12 program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT12.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 10-12-2018
    
*/

module jt12_decim #(parameter calcw=18, inw=16,
    n=2,    // number of stages
    m=1,    // depth of comb filter
    rate=2  // it will stuff with as many as (rate-1) zeros    
)(
    input               rst,
    input               clk,
(* direct_enable *)    input               cen_in,
(* direct_enable *)    input               cen_out,
    input  signed [inw-1:0] snd_in,
    output reg signed [inw-1:0] snd_out
);

reg signed [calcw-1:0] inter6;
wire signed [calcw-1:0] integ_op, comb_op;
localparam wdiff = calcw - inw;

// integrator at clk x cen sampling rate
generate
    genvar k2;
    reg [calcw-1:0] integ_data[0:n];
    assign integ_op = integ_data[n];
    always @(*)
        integ_data[0] = { {wdiff{snd_in[inw-1]}}, snd_in };
    for(k2=1;k2<=n;k2=k2+1) begin : integ_gen
        always @(posedge clk) 
            if(rst) begin
                integ_data[k2] <= {calcw{1'b0}};
            end else if(cen_in) begin
                integ_data[k2] <= integ_data[k2] + integ_data[k2-1];
            end
    end
endgenerate

// interpolator 
always @(posedge clk) 
    if(rst) begin
        inter6 <= {calcw{1'b0}};
    end else if(cen_out) begin
        inter6 <= integ_op;
    end

generate
    genvar k;
    wire [calcw-1:0] comb_data[0:n];
    assign comb_data[0] = inter6;
    assign comb_op = comb_data[n];
    for(k=0;k<n;k=k+1) begin : com_gen
        jt12_comb #(.w(calcw),.m(m)) u_comb(
            .rst    ( rst            ),
            .clk    ( clk            ),
            .cen    ( cen_out        ),
            .snd_in ( comb_data[k]   ),
            .snd_out( comb_data[k+1] )
        );
    end
endgenerate

// Comb filter at synthesizer sampling rate
always @(posedge clk)
    if(rst) begin
        snd_out <= {inw{1'b0}};
    end else if(cen_out) begin
        snd_out<= comb_op[calcw-1:wdiff];
    end


endmodule