// Seed: 357052571
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_9 = id_4 / id_8;
  wor id_10;
  always_latch id_10 = id_4;
  wire id_11 = 1;
  wire id_12, id_13;
  wire id_14;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  tri id_2, id_3;
  assign id_1 = 1;
  wand id_4, id_5;
  assign id_1 = id_3;
  tri1 id_6, id_7 = 1;
  assign id_2 = id_7.id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_10 = 0;
  assign id_2 = 1;
  assign id_4 = (1'b0);
endmodule
