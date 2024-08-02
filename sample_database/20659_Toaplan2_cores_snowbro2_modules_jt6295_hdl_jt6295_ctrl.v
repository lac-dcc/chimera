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

module jt6295_ctrl(
    input                  rst,
    input                  clk,
    input                  cen4,
    input                  cen1,
    // CPU
    input                  wrn,
    input      [ 7:0]      din,
    // Channel address
    output reg [17:0]      start_addr,
    output reg [17:0]      stop_addr,
    // Attenuation
    output reg [ 3:0]      att,
    // ROM interface
    output     [ 9:0]      rom_addr,
    input      [ 7:0]      rom_data,
    input                  rom_ok,
    // flow control
    output reg [ 3:0]      start,
    output reg [ 3:0]      stop,
    input      [ 3:0]      busy,
    input      [ 3:0]      ack,
    input                  zero
);

reg  last_wrn;
wire negedge_wrn  = !wrn && last_wrn;

// new request
reg [6:0] phrase;
reg       push, pull;
reg [3:0] ch, new_att;
reg       cmd;

always @(posedge clk) begin
    last_wrn <= wrn;
end

reg stop_clr;

`ifdef JT6295_DUMP
integer fdump;
integer ticks=0;
initial begin
    fdump=$fopen("jt6295.log");
end
always @(posedge zero) ticks<=ticks+1;
always @(posedge clk ) begin
    if( negedge_wrn ) begin
        if( !cmd && !din[7] ) begin
            $fwrite(fdump,"@%0d - Mute %1X\n", ticks, din[6:3]);
        end
        if( cmd ) begin
            $fwrite(fdump,"@%0d - Start %1X, phrase %X, Att %X\n",
                ticks, din[7:4], phrase, din[3:0] );
        end
    end
end
`endif


// Bus interface
always @(posedge clk) begin
    if( rst ) begin
        cmd      <= 1'b0;
        stop     <= 4'd0;
        ch       <= 4'd0;
        pull     <= 1'b1;
        phrase   <= 7'd0;
        new_att  <= 0;
    end else begin
        if( cen4 ) begin
            stop <= stop & busy;
        end
        if( push ) pull <= 1'b0;
        if( negedge_wrn  ) begin // new write
            if( cmd ) begin // 2nd byte
                ch      <= din[7:4];
                new_att <= din[3:0];
                cmd     <= 1'b0;
                pull    <= 1'b1;
            end
            else if( din[7] ) begin // channel start
                phrase <= din[6:0];
                cmd    <= 1'b1; // wait for second byte
                stop   <= 4'd0;
            end else begin // stop data
                stop   <= din[6:3];
            end
        end
    end
end

reg [17:0] new_start;
reg [17:8] new_stop;
reg [ 2:0] st, addr_lsb;
reg        wrom;

assign rom_addr = { phrase, addr_lsb };

// Request phrase address
always @(posedge clk) begin
    if( rst ) begin
        st         <= 7;
        att        <= 0;
        start_addr <= 0;
        stop_addr  <= 0;
        start      <= 0;
        push       <= 0;
        addr_lsb   <= 0;
    end else begin
        if( st!=7 ) begin
            wrom <= 0;
            if( !wrom && rom_ok ) begin
                st       <= st+3'd1;
                addr_lsb <= st;
                wrom     <= 1;
            end
        end
        case( st )
            7: begin
                start    <= start & ~ack;
                addr_lsb <= 0;
                if(pull) begin
                    st       <= 0;
                    wrom     <= 1;
                    push     <= 1;
                end
            end
            0:;
            1: new_start[17:16] <= rom_data[1:0];
            2: new_start[15: 8] <= rom_data;
            3: new_start[ 7: 0] <= rom_data;
            4: new_stop [17:16] <= rom_data[1:0];
            5: new_stop [15: 8] <= rom_data;
            6: begin
                start       <= ch;
                start_addr  <= new_start;
                stop_addr   <= {new_stop[17:8], rom_data} ;
                att         <= new_att;
                push        <= 0;
            end
        endcase
    end
end

endmodule