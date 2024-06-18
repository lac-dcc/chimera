// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module sd_crc_7(
 input              bitval,     // Next input bit
 input              en,
 input              clk,        // Current bit valid (Clock)
 input              rst,        // Init crc value
 output reg [6:0]   crc         // Current output crc value
);

//Local Parameters
//Registers/Wires
wire         inv;

//Submodules
//Asynchronous Logic
//Synchronous Logic

assign inv = bitval ^ crc[6];                   // XOR required?

always @(posedge clk or posedge rst) begin
  if (rst) begin
    crc = 0;
  end
  else begin
    if (en==1) begin
      crc[6] = crc[5];
      crc[5] = crc[4];
      crc[4] = crc[3];
      crc[3] = crc[2] ^ inv;
      crc[2] = crc[1];
      crc[1] = crc[0];
      crc[0] = inv;
    end
  end
end

endmodule

