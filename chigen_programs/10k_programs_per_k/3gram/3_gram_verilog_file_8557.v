// Seed: 3508442
module module_0 (
    input wor id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wire id_3,
    output supply1 id_4,
    input wor id_5,
    input tri0 id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply1 id_9,
    input wire id_10,
    input uwire id_11,
    output uwire id_12,
    input tri id_13,
    input tri id_14,
    input tri0 id_15
);
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1#(.id_10(1)),
    output tri id_2,
    output tri0 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    input tri0 id_8
);
  wand id_11;
  assign id_2 = id_11;
  xnor primCall (id_3, id_5, id_6, id_7, id_10, id_0, id_4, id_1, id_11);
  module_0 modCall_1 (
      id_11,
      id_6,
      id_11,
      id_8,
      id_3,
      id_1,
      id_7,
      id_11,
      id_0,
      id_5,
      id_1,
      id_7,
      id_3,
      id_0,
      id_7,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
