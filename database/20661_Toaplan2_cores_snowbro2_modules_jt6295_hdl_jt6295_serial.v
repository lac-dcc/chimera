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

module jt6295_serial(
    input               rst,
    input               clk,
    input               cen,
    input               cen4,
    // Flow
    input      [17:0]   start_addr,
    input      [17:0]   stop_addr,
    input      [ 3:0]   att,
    input      [ 3:0]   start,
    input      [ 3:0]   stop,
    output reg [ 3:0]   busy,
    output reg [ 3:0]   ack,
    output              zero,
    // ADPCM data feed    
    output     [17:0]   rom_addr,
    input      [ 7:0]   rom_data,
    // serialized data
    output reg          pipe_en,
    output reg [ 3:0]   pipe_att,
    output reg [ 3:0]   pipe_data
);

localparam CSRW = 18+19+4+1;

reg  [ 3:0] ch;
wire [ 3:0] att_in, att_out;
wire [18:0] cnt, cnt_next, cnt_in;
wire [17:0] ch_end, stop_in, stop_out;
wire        update;
wire        over, busy_in, busy_out, cont;
reg         up_start, up_stop;

// current channel
always @(posedge clk, posedge rst) begin
    if(rst)
        ch <= 4'b1;
    else begin
        // if(cen4) ch <= { ch[0], ch[3:1]  };
        if(cen4) ch <= { ch[2:0], ch[3]  };
    end
end

always @(*) begin
    case( ch )
        4'b0001: { up_start, up_stop } = { start[0], stop[0] };
        4'b0010: { up_start, up_stop } = { start[1], stop[1] };
        4'b0100: { up_start, up_stop } = { start[2], stop[2] };
        4'b1000: { up_start, up_stop } = { start[3], stop[3] };
        default: { up_start, up_stop } = 2'b00;
    endcase
end

reg [17:0] cnt0, cnt1, cnt2, cnt3;

always @(posedge clk, posedge rst ) begin
    if( rst ) begin
        busy <= 4'd0;
    end else begin
        case( ch )
            4'b0001: busy[0] <= busy_in;
            4'b0010: busy[1] <= busy_in;
            4'b0100: busy[2] <= busy_in;
            4'b1000: busy[3] <= busy_in;
            default: busy    <= 4'd0;
        endcase
        if( cen4 ) begin
            case( ch )
                4'b0001: ack <= up_start ? ch : 4'b0;
                4'b0010: ack <= up_start ? ch : 4'b0;
                4'b0100: ack <= up_start ? ch : 4'b0;
                4'b1000: ack <= up_start ? ch : 4'b0;
                default: ack <= 4'd0;
            endcase
        end
        `ifdef SIMULATION
        case( ch )
            4'b0001: cnt0 <= cnt[18:1];
            4'b0010: cnt1 <= cnt[18:1];
            4'b0100: cnt2 <= cnt[18:1];
            4'b1000: cnt3 <= cnt[18:1];
            default:;
        endcase        
        `endif
    end
end

assign zero     = ch[0];
assign update   = up_start | up_stop;
assign cont     = busy_out & ~over;
assign cnt_next = cont      ? cnt+19'd1 : cnt;
assign stop_in  = up_start  ? stop_addr : stop_out;
assign cnt_in   = up_start  ? {start_addr, 1'b0} : cnt_next;
assign att_in   = up_start  ? att : att_out;
assign busy_in  = update    ? (up_start & ~up_stop) : cont;

wire [CSRW-1:0] csr_in, csr_out;
assign csr_in = { stop_in, cnt_in, att_in, busy_in };
assign {stop_out, cnt, att_out, busy_out } = csr_out;
assign rom_addr = cnt[18:1];
assign over     = rom_addr >= stop_out;

jt6295_sh_rst #(.WIDTH(CSRW), .STAGES(4) ) u_cnt(
    .rst    ( rst       ),
    .clk    ( clk       ),
    .clk_en ( cen4      ),
    .din    ( csr_in    ),
    .drop   ( csr_out   )
);

// Channel data is latched for a clock cycle to wait for ROM data

always @(posedge clk, posedge rst) begin
    if(rst) begin
        pipe_data<= 4'd0;
        pipe_en  <= 1'b0;
        pipe_att <= 4'd0;
    end else if(cen4) begin
        // data
        pipe_data <= !cnt[0] ? rom_data[7:4] : rom_data[3:0];
        // attenuation
        pipe_att  <= att_out;
        // busy / enable
        pipe_en   <= busy_out;
    end
end

endmodule
