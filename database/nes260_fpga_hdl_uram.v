// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

// Single-Port BRAM with Byte-wide Write Enable
// Read-First mode
// Single-process description
// Compact description of the write with a generate-for 
//   statement
// Column width and number of columns easily configurable
//
// bytewrite_ram_1b.v
//
module bytewrite_ram_1b (clk, we, addr, di, do);

parameter SIZE = 256*1024;  // 256*9=2304 KB, we use up all URAM
parameter ADDR_WIDTH = 18;
parameter COL_WIDTH = 8; 
parameter NB_COL = 9;

input clk;
input [NB_COL-1:0] we;
input [ADDR_WIDTH-1:0] addr;
input [NB_COL*COL_WIDTH-1:0] di;
output reg [NB_COL*COL_WIDTH-1:0] do;

(* ram_style = "ultra" *)
reg [NB_COL*COL_WIDTH-1:0] RAM [SIZE-1:0];

always @(posedge clk)
begin
    do <= RAM[addr];
end

generate genvar i;
for (i = 0; i < NB_COL; i = i+1)
begin
always @(posedge clk)
begin
    if (we[i])
        RAM[addr][(i+1)*COL_WIDTH-1:i*COL_WIDTH] <= di[(i+1)*COL_WIDTH-1:i*COL_WIDTH];
    end 
end
endgenerate

endmodule


module uram_driver (input clk,
    output reg [5:0] color,
    output reg [8:0] scanline,
    output reg [8:0] cycle);

reg state = 0;
reg [7:0] y = 0, y2;
reg [7:0] x = 0, x2; 

wire [15:0] byte_addr = {y, x};
wire [15:0] byte_addr2 = {y2, x2};

reg [8:0] we;
reg [9:0] addr;
reg [71:0] di;
wire [71:0] do;
    
bytewrite_ram_1b ram(clk, we, addr, di, do);

always @(posedge clk) begin
    x <= x + 1;
    if (x == 255) begin
        y <= y == 239 ? 0 : y + 1;
    end
end

always @(posedge clk) begin
    addr <= byte_addr[15:3];
    case (state)
    0: begin
        // fill memory
        we <= 1 << byte_addr[2:0];
        di <= y[5:0] << byte_addr[2:0];
        if (y == 239 && x == 255) begin
            state <= 1;
            we <= 0;
        end
    end
    1: begin
        // output video
        y2 <= y;
        x2 <= x;
        scanline <= {'b0,y2};
        cycle <= {'b0,x2};
        color <= do << byte_addr2[2:0];
    end
    endcase
end



endmodule
