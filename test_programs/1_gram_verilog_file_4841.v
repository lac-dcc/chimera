// Seed: 2433564808
module module_0 (
    input wor id_0,
    output wor id_1,
    input uwire id_2,
    input tri1 id_3,
    output tri1 id_4,
    input supply1 id_5
);
  assign id_4 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    output supply0 id_3,
    input wand id_4,
    output supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply1 id_8,
    output wire id_9,
    output supply0 id_10,
    input uwire id_11,
    input uwire id_12,
    input tri0 id_13
);
  wire id_15;
  or primCall (id_0, id_11, id_1, id_7, id_13, id_12, id_8, id_6, id_15);
  module_0 modCall_1 (
      id_8,
      id_3,
      id_4,
      id_4,
      id_9,
      id_4
  );
  assign modCall_1.type_9 = 0;
endmodule
