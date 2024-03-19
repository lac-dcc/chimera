// Ethernet FCS computation
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module crc(
  input clk,
  input reset,
  input en,
  input [7:0] din,
  output [31:0] crc_out
);

  reg [31:0] crc,next;

  wire [7:0] d = {din[0],din[1],din[2],din[3],din[4],din[5],din[6],din[7]};

  always @(*) begin
    next[0] = crc[24] ^ crc[30] ^ d[0] ^ d[6];
    next[1] = crc[24] ^ crc[25] ^ crc[30] ^ crc[31] ^ d[0] ^ d[1] ^ d[6] ^ d[7];
    next[2] = crc[24] ^ crc[25] ^ crc[26] ^ crc[30] ^ crc[31] ^ d[0] ^ d[1] ^ d[2] ^ d[6] ^ d[7];
    next[3] = crc[25] ^ crc[26] ^ crc[27] ^ crc[31] ^ d[1] ^ d[2] ^ d[3] ^ d[7];
    next[4] = crc[24] ^ crc[26] ^ crc[27] ^ crc[28] ^ crc[30] ^ d[0] ^ d[2] ^ d[3] ^ d[4] ^ d[6];
    next[5] = crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ crc[29] ^ crc[30] ^ crc[31] ^ d[0] ^ d[1] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7];
    next[6] = crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc[30] ^ crc[31] ^ d[1] ^ d[2] ^ d[4] ^ d[5] ^ d[6] ^ d[7];
    next[7] = crc[24] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc[31] ^ d[0] ^ d[2] ^ d[3] ^ d[5] ^ d[7];
    next[8] = crc[0] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ d[0] ^ d[1] ^ d[3] ^ d[4];
    next[9] = crc[1] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ d[1] ^ d[2] ^ d[4] ^ d[5];
    next[10] = crc[2] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[29] ^ d[0] ^ d[2] ^ d[3] ^ d[5];
    next[11] = crc[3] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ d[0] ^ d[1] ^ d[3] ^ d[4];
    next[12] = crc[4] ^ crc[24] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc[30] ^ d[0] ^ d[1] ^ d[2] ^ d[4] ^ d[5] ^ d[6];
    next[13] = crc[5] ^ crc[25] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc[30] ^ crc[31] ^ d[1] ^ d[2] ^ d[3] ^ d[5] ^ d[6] ^ d[7];
    next[14] = crc[6] ^ crc[26] ^ crc[27] ^ crc[28] ^ crc[30] ^ crc[31] ^ d[2] ^ d[3] ^ d[4] ^ d[6] ^ d[7];
    next[15] = crc[7] ^ crc[27] ^ crc[28] ^ crc[29] ^ crc[31] ^ d[3] ^ d[4] ^ d[5] ^ d[7];
    next[16] = crc[8] ^ crc[24] ^ crc[28] ^ crc[29] ^ d[0] ^ d[4] ^ d[5];
    next[17] = crc[9] ^ crc[25] ^ crc[29] ^ crc[30] ^ d[1] ^ d[5] ^ d[6];
    next[18] = crc[10] ^ crc[26] ^ crc[30] ^ crc[31] ^ d[2] ^ d[6] ^ d[7];
    next[19] = crc[11] ^ crc[27] ^ crc[31] ^ d[3] ^ d[7];
    next[20] = crc[12] ^ crc[28] ^ d[4];
    next[21] = crc[13] ^ crc[29] ^ d[5];
    next[22] = crc[14] ^ crc[24] ^ d[0];
    next[23] = crc[15] ^ crc[24] ^ crc[25] ^ crc[30] ^ d[0] ^ d[1] ^ d[6];
    next[24] = crc[16] ^ crc[25] ^ crc[26] ^ crc[31] ^ d[1] ^ d[2] ^ d[7];
    next[25] = crc[17] ^ crc[26] ^ crc[27] ^ d[2] ^ d[3];
    next[26] = crc[18] ^ crc[24] ^ crc[27] ^ crc[28] ^ crc[30] ^ d[0] ^ d[3] ^ d[4] ^ d[6];
    next[27] = crc[19] ^ crc[25] ^ crc[28] ^ crc[29] ^ crc[31] ^ d[1] ^ d[4] ^ d[5] ^ d[7];
    next[28] = crc[20] ^ crc[26] ^ crc[29] ^ crc[30] ^ d[2] ^ d[5] ^ d[6];
    next[29] = crc[21] ^ crc[27] ^ crc[30] ^ crc[31] ^ d[3] ^ d[6] ^ d[7];
    next[30] = crc[22] ^ crc[28] ^ crc[31] ^ d[4] ^ d[7];
    next[31] = crc[23] ^ crc[29] ^ d[5];
  end

  always @(posedge clk)
    if (reset)
      crc <= {32{1'b1}};
    else
      crc <= en ? next : crc;

  assign crc_out = ~{
    next[24], next[25], next[26], next[27], next[28], next[29], next[30], next[31],
    next[16], next[17], next[18], next[19], next[20], next[21], next[22], next[23],
    next[8], next[9], next[10], next[11], next[12], next[13], next[14], next[15],
    next[0], next[1], next[2], next[3], next[4], next[5], next[6], next[7] };

endmodule
