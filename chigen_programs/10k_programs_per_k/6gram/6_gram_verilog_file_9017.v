// Seed: 1690672130
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1[1 : 1] = id_4;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    .id_11(id_4),
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_12;
  xor (id_9, id_8, id_4, id_2, id_12, id_5, id_11, id_1, id_6);
  wire id_13 = id_8[1 : 1];
  module_0(
      id_8, id_5, id_5, id_5, id_12, id_13
  );
endmodule
