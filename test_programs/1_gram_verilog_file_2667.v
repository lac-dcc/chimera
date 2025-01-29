// Seed: 2547716159
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  wire id_5, id_6;
  wire id_7;
  wand id_8, id_9;
  wand id_10 = id_3;
  wire id_11;
  parameter id_12 = -1'b0, id_13 = id_9 == (1), id_14 = id_2 == id_9, id_15 = id_14;
  wire id_16;
  assign id_9 = id_10;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  parameter id_2 = id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_19 = 0;
endmodule
