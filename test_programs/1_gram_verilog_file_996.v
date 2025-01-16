// Seed: 2423737714
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2
);
  wire id_4;
  always id_5 = -1;
  assign module_2.id_9 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    output tri1 id_2,
    output uwire id_3,
    input wand id_4,
    output tri1 id_5,
    output wand id_6,
    input wor id_7,
    input supply1 id_8,
    output tri id_9,
    input wor id_10
);
  assign id_6 = id_10;
  xnor primCall (id_0, id_10, id_4, id_8);
  module_0 modCall_1 (
      id_4,
      id_7,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    input supply1 id_0,
    output wire id_1,
    input supply0 id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    output wand id_6,
    output wand id_7,
    output supply1 id_8,
    input supply0 id_9,
    input tri1 id_10,
    input uwire id_11,
    output wire id_12,
    output wand id_13,
    input supply1 id_14,
    input wand id_15,
    input tri id_16,
    output wor id_17,
    input tri0 id_18
);
  assign id_7 = 1 ? id_2 : id_0;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_16
  );
  assign id_4 = id_16 * -1;
endmodule
