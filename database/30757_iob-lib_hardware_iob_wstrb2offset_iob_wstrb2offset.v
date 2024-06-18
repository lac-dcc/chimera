// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1 ns / 1 ps

module iob_wstrb2offset
   #(
     parameter DATA_W = 32
     )
   (
    input [DATA_W/8-1:0] wstrb,
    output reg [$clog2(DATA_W/8)-1:0] wr_addr_offset
    );

   generate if (DATA_W==32)
     always @* begin
        case (wstrb)
          4'b0010: wr_addr_offset = 2'b01;
          4'b0100: wr_addr_offset = 2'b10;
          4'b1000: wr_addr_offset = 2'b11;
          4'b1100: wr_addr_offset = 2'b10;
          default: wr_addr_offset = 2'b00;
        endcase
     end
   endgenerate
endmodule
