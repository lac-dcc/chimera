// Seed: 3164970466
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always force id_5 = 1;
  logic [7:0] id_7;
  assign id_7[-1] = id_1;
  parameter id_8 = 1;
  parameter id_9 = id_8;
  genvar id_10;
  assign id_10 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_7,
      id_5
  );
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1'd0] = id_5;
  logic id_9;
endmodule
