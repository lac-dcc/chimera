// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

// ==========================================================================
// crc Generation Unit - Linear Feedback Shift Register implementation
// (c) Kay Gorontzi, GHSi.de, distributed under the terms of LGPL
// https://www.ghsi.de/crc/index.php?

// https://www.ghsi.de/crc/index.php?
// =========================================================================
module sd_crc_16(
 input              clk,        // Current bit valid (Clock)
 input              rst,        // Init crc value
 input              en,
 input              bitval,     // Next input bit
 output reg [15:0]  crc         // Current output crc value
);
//Local Parameters

//Registers/Wires
wire         inv;

//Submodules
//Asynchronous Logic
//Synchronsou Logic

assign inv = bitval ^ crc[15];  // XOR required?

always @(posedge clk or posedge rst) begin
  if (rst) begin
    crc = 0;
  end
  else begin
    if (en==1) begin
      crc[15] = crc[14];
      crc[14] = crc[13];
      crc[13] = crc[12];
      crc[12] = crc[11] ^ inv;
      crc[11] = crc[10];
      crc[10] = crc[9];
      crc[9]  = crc[8];
      crc[8]  = crc[7];
      crc[7]  = crc[6];
      crc[6]  = crc[5];
      crc[5]  = crc[4] ^ inv;
      crc[4]  = crc[3];
      crc[3]  = crc[2];
      crc[2]  = crc[1];
      crc[1]  = crc[0];
      crc[0]  = inv;
    end
  end
end
endmodule
