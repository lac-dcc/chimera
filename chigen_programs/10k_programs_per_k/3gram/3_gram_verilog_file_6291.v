// Seed: 717951326
module module_0 (
    input wand id_0,
    input tri0 id_1,
    output tri0 id_2,
    input uwire id_3,
    output supply1 id_4
    , id_15,
    input tri id_5,
    output supply1 id_6,
    output tri id_7,
    input supply0 id_8,
    output wor id_9,
    input tri0 id_10,
    input tri id_11,
    input supply1 id_12,
    input tri0 id_13
);
  assign id_15 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri id_4,
    output uwire id_5,
    input uwire id_6,
    output wire id_7,
    output tri0 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input tri0 id_12
);
  xor primCall (id_8, id_2, id_6, id_0, id_10, id_1, id_11, id_3, id_12);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_3,
      id_8,
      id_12,
      id_7,
      id_9,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
