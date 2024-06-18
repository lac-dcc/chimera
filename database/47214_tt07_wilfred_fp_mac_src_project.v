// This program was cloned from: https://github.com/wilfredkisku/tt07_wilfred_fp_mac
// License: Apache License 2.0

/*
* Copyright (c) 2024 Aiden Fox Ivey
* SPDX-License-Identifier: Apache-2.0
*/

`default_nettype none

module tt_um_aidenfoxivey (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

  assign uio_out = 0;
  assign uio_oe  = 0;

  crc8 crc (
    .data_in(ui_in),
    .data_out(uo_out),
    .rst(!rst_n),
    .clk(clk),
    .enable(uio_in[0])
  );
endmodule

// 1+x^1+x^2+x^8;
module crc8 (
  input wire [7:0] data_in,
  output wire [7:0] data_out,
  input wire rst,
  input wire clk,
  input wire enable
);

reg [7:0] next_crc, curr_crc;

assign data_out = curr_crc;

always @(posedge clk or posedge rst) begin
  if (rst) begin
    curr_crc <= {8{1'b0}}; // CCITT initial value is defined as 0
  end
  else begin
    curr_crc <= enable ? next_crc : curr_crc;
  end
end // always

always @(*) begin
  next_crc[0] = curr_crc[0] ^ curr_crc[6] ^ curr_crc[7] ^ data_in[0] ^ data_in[6] ^ data_in[7];
  next_crc[1] = curr_crc[0] ^ curr_crc[1] ^ curr_crc[6] ^ data_in[0] ^ data_in[1] ^ data_in[6];
  next_crc[2] = curr_crc[0] ^ curr_crc[1] ^ curr_crc[2] ^ curr_crc[6] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[6];
  next_crc[3] = curr_crc[1] ^ curr_crc[2] ^ curr_crc[3] ^ curr_crc[7] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7];
  next_crc[4] = curr_crc[2] ^ curr_crc[3] ^ curr_crc[4] ^ data_in[2] ^ data_in[3] ^ data_in[4];
  next_crc[5] = curr_crc[3] ^ curr_crc[4] ^ curr_crc[5] ^ data_in[3] ^ data_in[4] ^ data_in[5];
  next_crc[6] = curr_crc[4] ^ curr_crc[5] ^ curr_crc[6] ^ data_in[4] ^ data_in[5] ^ data_in[6];
  next_crc[7] = curr_crc[5] ^ curr_crc[6] ^ curr_crc[7] ^ data_in[5] ^ data_in[6] ^ data_in[7];
end // always

endmodule // crc8