// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module memory(data, address, wr, clock, sw, seg, an, dp);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 16;

inout [DATA_WIDTH-1:0] data;
input [ADDR_WIDTH-1:0] address;
input wr;
input clock;
input [11:0] sw;
output [6:0] seg;
output [3:0] an;
output dp;

reg [3:0] num0, num1, num2, num3;
wire dp, an0, an1, an2, an3;

//take only 4bit for synthesis
reg	[4:0]	mem[0:1<<ADDR_WIDTH - 1];
reg	[DATA_WIDTH - 1:0]	data_out;

// Tri-State buffer
assign data = (wr == 0) ? data_out : 32'bz;

// ----------------------------------------------------------------------

wire targetClk;
wire [18:0] tclk;
assign tclk[0] = clock;
genvar c;
generate for(c = 0; c < 18; c = c + 1) begin
    clockDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate
clockDiv fdivTarget(targetClk, tclk[18]);

quadSevenSeg quad7seg(seg, dp, an, num0, num1, num2, num3, targetClk);

// ----------------------------------------------------------------------

generate
    begin: init_bram_to_zero
        integer ram_index;
        initial
        for (ram_index = 0; ram_index < ADDR_WIDTH; ram_index = ram_index + 1)
            mem[ram_index] = 0;
    end
endgenerate


always @(address)
begin
    case (address)
        16'hFFF0 : data_out = num0;
        16'hFFF4 : data_out = num1;
        16'hFFF8 : data_out = num2;
        16'hFFFC : data_out = num3;
        16'hFFE0 : data_out = sw[3:0];
        16'hFFE4 : data_out = sw[7:4];
        16'hFFE8 : data_out = sw[11:8];
        default : data_out = mem[address];        
    endcase
end


always @(posedge clock)
begin : MEM_WRITE
    if (wr) begin
	   case (address)
	       16'hFFF0 : num0 = data;
	       16'hFFF4 : num1 = data;
	       16'hFFF8 : num2 = data;
	       16'hFFFC : num3 = data[7:4];
	       default : mem[address] = data;
		endcase
	end
end

endmodule
