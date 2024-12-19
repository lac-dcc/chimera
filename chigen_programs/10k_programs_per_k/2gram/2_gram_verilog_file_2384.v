// Seed: 518717565
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    output uwire id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input uwire id_12,
    output tri id_13,
    input wor id_14,
    output wand id_15,
    input supply0 id_16,
    output wor id_17,
    input tri1 id_18,
    output wand id_19,
    output uwire id_20
);
  wire id_22;
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    input wor id_4,
    output wor id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input tri1 id_9,
    output tri1 id_10
);
  assign id_10 = id_7;
  id_12 :
  assert property (@(id_2) id_1)
  else;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_3,
      id_5,
      id_6,
      id_12,
      id_4,
      id_7,
      id_12,
      id_0,
      id_9,
      id_1,
      id_1,
      id_0,
      id_12,
      id_0,
      id_6,
      id_5,
      id_8,
      id_10,
      id_10
  );
  assign modCall_1.type_25 = 0;
endmodule
