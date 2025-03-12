// Seed: 1042692124
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input wand id_2,
    input uwire id_3,
    output wand id_4,
    input uwire id_5,
    input tri id_6,
    input tri1 id_7,
    output supply1 id_8,
    input tri id_9,
    input uwire id_10,
    input tri0 id_11
    , id_16,
    input supply0 id_12,
    input wand id_13,
    input wire id_14
    , id_17
);
  initial
  fork
    id_17 <= "";
    id_18;
  join_any
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    output tri   id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
  always_comb @(posedge id_0) id_1 <= id_0 - id_0;
  wire id_4;
endmodule
