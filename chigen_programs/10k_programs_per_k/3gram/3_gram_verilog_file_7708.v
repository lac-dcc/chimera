// Seed: 1143555919
module module_0 (
    output wor id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    output supply0 id_5
);
  wire id_7;
  assign id_1 = id_2;
endmodule
module module_1 (
    output tri1 id_0,
    output wand id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5
    , id_14,
    input uwire id_6,
    output tri id_7,
    input wand id_8
    , id_15,
    input supply0 id_9,
    output wand id_10,
    inout uwire id_11,
    output supply1 id_12
);
  logic id_16 = 1;
  nor primCall (id_1, id_2, id_4, id_16, id_14, id_6, id_8, id_11, id_15, id_9);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_2,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
