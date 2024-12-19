// Seed: 3473870118
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    output wand id_3,
    output supply1 id_4,
    input tri1 id_5,
    output wor id_6,
    output supply1 id_7,
    output tri1 id_8,
    input tri1 id_9,
    output tri0 id_10
);
endmodule
module module_1 (
    output tri   id_0,
    input  wand  id_1,
    input  wire  id_2,
    input  tri   id_3,
    output wire  id_4,
    input  uwire id_5,
    output logic id_6,
    output wor   id_7,
    input  tri1  id_8,
    output tri0  id_9,
    output wire  id_10
);
  wire id_12;
  wire id_13;
  reg  id_14;
  always id_6 <= id_14;
  tri id_15;
  reg id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  wire id_23;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_9,
      id_10,
      id_4,
      id_2,
      id_0,
      id_7,
      id_10,
      id_8,
      id_7
  );
  assign modCall_1.type_12 = 0;
  assign id_15 = 1;
  always_latch id_22 <= id_16;
endmodule
