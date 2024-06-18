// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module regfile_controller (
  input [31:0] id,
  output [4:0] ra1,
  output [4:0] ra2,
  output [4:0] wa
);

assign ra1 = id[19:15];
assign ra2 = id[24:20];
assign wa = id[11:7];

endmodule
