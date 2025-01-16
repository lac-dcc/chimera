// Seed: 3539703471
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output tri id_2,
    input wand id_3,
    input wire id_4,
    input wor id_5,
    input tri0 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wor id_14,
    output wire id_15,
    output supply0 id_16,
    output wor id_17,
    input wand id_18
);
  wire id_20, id_21;
endmodule
module module_1 (
    input  tri0 id_0,
    id_5,
    input  wand id_1,
    output wire id_2,
    output wor  id_3
);
  wire id_6;
  xnor primCall (id_2, id_6, id_1, id_5, id_0);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0,
      id_2,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
