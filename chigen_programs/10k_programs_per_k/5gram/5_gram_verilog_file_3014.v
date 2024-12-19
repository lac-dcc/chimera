// Seed: 2267087685
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input wor id_3,
    input uwire id_4,
    output wor id_5,
    input supply1 id_6,
    input wor id_7,
    input wand id_8,
    output wand id_9,
    input supply0 id_10,
    output tri1 id_11,
    input wor id_12,
    input supply0 id_13,
    input supply1 module_0,
    input wire id_15,
    input supply1 id_16,
    input supply0 id_17,
    input wor id_18
);
  wire id_20;
endmodule
module module_1 (
    output supply0 id_0,
    output wire id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input uwire id_5,
    output tri1 id_6,
    output supply1 id_7,
    input wand id_8,
    input uwire id_9,
    input wor id_10,
    output tri0 id_11
);
  assign id_6 = 1;
  or primCall (id_2, id_5, id_10, id_9, id_3, id_4);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_8,
      id_5,
      id_9,
      id_11,
      id_5,
      id_9,
      id_5,
      id_0,
      id_9,
      id_1,
      id_5,
      id_3,
      id_10,
      id_5,
      id_5,
      id_8,
      id_8
  );
  assign modCall_1.id_3 = 0;
endmodule
