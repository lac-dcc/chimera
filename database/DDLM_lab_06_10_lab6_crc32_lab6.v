//                              -*- Mode: Verilog -*-
// Filename    : crc32.v
// Description : x^32+x^26+x^23+x^22+x^16+x^12+x^11+x^10+x^8+x^7+x^5+x^4+x^2+x^1+x^0
// Algorithm   : CRC-32 MPEG-2
// Polynomial  : 0x04C11DB7
// Init value  : 0xFFFFFFFF
// RefIn       : False
// RefOut      : False
// Checkout    : 0x376E6E7 

module crc32
(
 input             clk,
 input             rst_n,
 input [7:0]       data,
 input             crc_en,
 output reg [31:0] crc32
);
  always@(posedge clk or negedge rst_n)
    if(!rst_n)
      crc32 <= 32'hFFFFFFFF;
    else begin
      crc32 <= crc_en ? crc32_byte(crc32,data) : crc32;
      
    end
  function [31:0] crc32_bit;
    input [31:0]   crc;
    input          data;
    begin
      crc32_bit      = crc << 1;
      crc32_bit[0]   = crc[31] ^ data;
      crc32_bit[1]   = crc[31] ^ data ^ crc[0];
      crc32_bit[2]   = crc[31] ^ data ^ crc[1];
      crc32_bit[4]   = crc[31] ^ data ^ crc[3];
      crc32_bit[5]   = crc[31] ^ data ^ crc[4];
      crc32_bit[7]   = crc[31] ^ data ^ crc[6];
      crc32_bit[8]   = crc[31] ^ data ^ crc[7];
      crc32_bit[10]  = crc[31] ^ data ^ crc[9];
      crc32_bit[11]  = crc[31] ^ data ^ crc[10];
      crc32_bit[12]  = crc[31] ^ data ^ crc[11];
      crc32_bit[16]  = crc[31] ^ data ^ crc[15];
      crc32_bit[22]  = crc[31] ^ data ^ crc[21];
      crc32_bit[23]  = crc[31] ^ data ^ crc[22];
      crc32_bit[26]  = crc[31] ^ data ^ crc[25];
    end
  endfunction // crc32_bit

  function [31:0] crc32_byte;
    input [31:0] crc;
    input [7:0]  data;
    integer      i;
    begin
      crc32_byte = crc;
      for(i=0;i<8;i=i+1)begin
        crc32_byte = crc32_bit(crc32_byte,data[7-i]);
      end
    end
  endfunction // crc32_byte
  
endmodule // crc32
