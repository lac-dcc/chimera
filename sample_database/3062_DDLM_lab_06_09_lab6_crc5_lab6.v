// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// Description     : x^5+x^2+1 USB CRC5 

module crc_ser
(
 input            data,
 input            clk,
 input            rst_n,
 input            crc_en, 
 output reg [4:0] crc5
);
  reg [4:0]       crc5_s;
  
  always@(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
        crc5 <= 5'h1f;
      else
        crc5 <= crc_en ? crc5_s : crc5;
    end

  always@*
    begin
      crc5_s[0] = crc5[4] ^ data ;
      crc5_s[1] = crc5[0] ;
      crc5_s[2] = crc5[4] ^ crc5[1] ^ data;
      crc5_s[3] = crc5[2];
      crc5_s[4] = crc5[3];
    end

  
endmodule // crc_serial
