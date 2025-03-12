// Seed: 3734361623
module module_0 (
    input tri id_0,
    output wire id_1,
    input wand id_2,
    input uwire id_3,
    output tri0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    input tri0 id_10,
    input uwire id_11,
    output wor id_12,
    output wand id_13,
    output wand id_14,
    output uwire id_15,
    output uwire id_16,
    input supply0 id_17,
    input uwire id_18
);
  assign id_4 = id_2;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output wand id_2,
    input tri id_3,
    input supply0 id_4,
    output supply0 id_5,
    output tri0 id_6,
    input supply1 id_7,
    input supply0 id_8
);
  assign id_6 = -1;
  xnor primCall (id_5, id_0, id_7, id_3);
  assign id_6 = id_7;
  assign id_6 = id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_8,
      id_5,
      id_3,
      id_7,
      id_6,
      id_3,
      id_2,
      id_8,
      id_0,
      id_5,
      id_6,
      id_2,
      id_6,
      id_2,
      id_4,
      id_8
  );
  assign modCall_1.id_18 = 0;
  logic [1 'b0 : -1  >>  1] id_10[1 : 1];
endmodule
