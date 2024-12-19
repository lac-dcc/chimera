// Seed: 2657450666
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_11;
  wire id_12;
  assign id_11 = 1'd0;
  assign {1, (1)} = id_8;
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
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  uwire id_9 = id_6;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_6,
      id_6,
      id_6,
      id_7,
      id_8,
      id_3
  );
  assign modCall_1.id_8 = 0;
  assign id_6 = 1;
  assign id_5[1] = 1'b0;
endmodule
