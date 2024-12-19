// Seed: 4006725349
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wire id_5
);
  tri1 id_7 = id_0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    inout tri0 id_3,
    input wire id_4,
    input wire id_5,
    output wire id_6,
    output wire id_7,
    output uwire id_8,
    input tri0 id_9,
    output wor id_10,
    input supply1 id_11,
    output wire id_12,
    input wor id_13,
    input supply0 id_14,
    input supply0 id_15
);
  module_0 modCall_1 (
      id_15,
      id_5,
      id_10,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = id_11;
  xor primCall (id_3, id_1, id_2, id_4, id_15, id_13, id_5, id_11, id_14, id_9);
endmodule
