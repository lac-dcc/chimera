// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the fifo used by inst fetch unit
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

module ifu_fifo#(parameter DATA_LEN=32,AddR_Width=6)(
    input clk,rst_n,Wready,Rready,flush,
    input [DATA_LEN-1:0] wdata,
    output empty,
    output [DATA_LEN-1:0] rdata
);

parameter Word_Depth = 2** AddR_Width;

reg [AddR_Width:0] wdata_poi,rdata_poi;
reg [DATA_LEN-1:0] fifo_sram[0:Word_Depth-1];
assign rdata=fifo_sram[rdata_poi[AddR_Width-1:0]];
assign empty = wdata_poi==rdata_poi;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        wdata_poi<={(AddR_Width+1){1'b0}};
        rdata_poi<={(AddR_Width+1){1'b0}};
    end
    else begin
        if(flush)begin
            wdata_poi<=rdata_poi;
        end
        else begin
            case ({Wready,Rready})
                2'b11:begin
                    fifo_sram[wdata_poi[AddR_Width-1:0]]<=wdata;
                    wdata_poi<=wdata_poi+1'b1;
                    rdata_poi<=rdata_poi+1'b1;
                end
                2'b10:begin
                    fifo_sram[wdata_poi[AddR_Width-1:0]]<=wdata;
                    wdata_poi<=wdata_poi+1'b1;
                end
                2'b01:begin
                    rdata_poi<=rdata_poi+1'b1;
                end
                default ;
            endcase
        end
    end
end

endmodule //ifu_fifo
