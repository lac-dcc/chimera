// Seed: 2055125471
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input wand id_4,
    output wor id_5,
    input wor id_6,
    output wire id_7,
    input wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    output wand id_11
);
  wire id_13;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    output tri1 id_7,
    input wand id_8,
    input wire id_9,
    output uwire id_10,
    input uwire id_11
);
  always @(negedge 1'd0) id_4 = id_2;
  or primCall (id_10, id_6, id_0, id_8, id_2, id_3, id_11, id_5, id_9);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_6,
      id_7,
      id_5,
      id_7,
      id_11,
      id_0,
      id_0,
      id_10
  );
  assign modCall_1.id_5 = 0;
endmodule
