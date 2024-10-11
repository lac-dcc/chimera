// This program was cloned from: https://github.com/siliconcompiler/scgallery
// License: Apache License 2.0

module vs_hdsp_256x32_bw(
  input CK,
  input CEN,
  input [3:0] WEN,
  input OEN,
  input [7:0] ADR,
  input [31:0] DI,
  output [31:0] DOUT
);

  wire we;
  assign we = ~WEN[0] | ~WEN[1] | ~WEN[2] | ~WEN[3];

  la_spram #(.DW(32), .AW(8)) mem (
    .clk(CK),
    .dout(DOUT),
    .ce(~CEN),
    .we(we),
    .wmask({{8{WEN[3]}},
            {8{WEN[2]}},
            {8{WEN[1]}},
            {8{WEN[0]}}}),
    .addr(ADR),
    .din(DI)
  );

endmodule
