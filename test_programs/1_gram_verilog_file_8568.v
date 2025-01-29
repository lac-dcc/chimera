// Seed: 2250097373
module module_0 (
    input wor id_0,
    input tri0 id_1,
    output wire id_2,
    input wire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    input wire id_7,
    input tri1 id_8,
    id_11,
    output supply0 id_9
);
  wand id_12 = id_5;
  id_13(
      id_11
  );
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wand id_2 id_14,
    output tri0 id_3,
    input tri1 id_4,
    input wire id_5,
    input logic id_6,
    output supply0 id_7,
    input supply1 id_8,
    output logic id_9,
    input tri0 id_10,
    input wand id_11,
    output wire id_12,
    id_15
);
  logic id_16;
  final id_9 = id_16;
  nand primCall (
      id_7, id_16, id_17, id_14, id_4, id_11, id_15, id_8, id_10, id_0, id_1, id_5, id_6
  );
  tri id_17 = id_5;
  initial id_16 <= id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5,
      id_8,
      id_1,
      id_17,
      id_7
  );
  assign modCall_1.id_0 = 0;
endmodule
