// Seed: 2295774009
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_7(
      id_4
  );
  wire id_8, id_9;
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
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_8 == id_7;
  uwire id_9, id_10, id_11, id_12;
  assign id_9 = 1;
  always $display((id_2 ^ id_9) - id_12);
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_10,
      id_10,
      id_5
  );
  always_latch id_8 <= -1;
  localparam id_13 = -1'b0;
endmodule
