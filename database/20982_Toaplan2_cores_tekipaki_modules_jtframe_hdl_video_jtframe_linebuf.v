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
    Date: 27-10-2017 */

module jtframe_linebuf #(parameter
    DW=8,
    AW=9
)(
    input            clk,
    input            pxl_cen,
    input            LHBL,  // the line buffer is swapped when this signal goes low
                            // you can use ~HS instead of LHBL too
    // New data writes
    input   [AW-1:0] wr_addr,
    input   [DW-1:0] wr_data,
    input            we,
    // Old data reads (and erases)
    input   [AW-1:0] rd_addr,
    output  [DW-1:0] rd_data,
    output  [DW-1:0] rd_gated
);

reg     line, last_LHBL;

wire [DW-1:0]       dump_data;
reg  [8:0] last_h;
reg        erase;

`ifdef SIMULATION
initial begin
    line = 0;
end
`endif

always @(posedge clk) begin
    last_LHBL <= LHBL;
    if( !LHBL && last_LHBL )
        line <= ~line;

    if(pxl_cen) begin
        last_h <= rd_addr;
        erase<=1'b1;
    end else begin
        erase<=1'b0;
    end
end

assign rd_gated = LHBL ? rd_data : {DW{1'b0}};

jtframe_dual_ram #(.aw(AW+1),.dw(DW)) u_line(
    .clk0   ( clk           ),
    .clk1   ( clk           ),
    // Port 0: write
    .data0  ( wr_data       ),
    .addr0  ( {line,wr_addr}),
    .we0    ( we            ),
    .q0     (               ),
    // Port 1: read
    .data1  ({DW{1'b0}}     ),
    .addr1  (erase ? {~line, last_h} : {~line,rd_addr}),
    .we1    ( erase          ),
    .q1     ( rd_data       )
);

endmodule