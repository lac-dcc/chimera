// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module spdif (
  input  clock_i,     // S/PDIF clock
  output spdif_o,     // S/PDIF output
  output block_o,     // Block status output
  output frame_o,     // Frame status output
  output subframe_o   // Sub-frame status output
);

  // Sub-frame preambles
  localparam preamble_b = 8'b11101000;  // Channel 1 (Left) and start of block
  localparam preamble_m = 8'b11100010;  // Channel 1 (Left)
  localparam preamble_w = 8'b11100100;  // Channel 2 (Right) or higher

  assign spdif_o = 0;
  assign block_o = 0;
  assign frame_o = 0;
  assign subframe_o = 0;
endmodule
