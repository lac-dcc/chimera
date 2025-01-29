// Seed: 866951900
macromodule module_0 (
    input wand id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri id_7,
    input wire id_8,
    output uwire id_9,
    input tri1 id_10,
    input tri id_11,
    input wand id_12,
    output tri0 id_13,
    input supply1 id_14,
    input supply0 id_15,
    input wand id_16,
    input wire id_17,
    input tri id_18
);
  wire id_20, id_21;
  assign id_20 = id_15;
  integer id_22;
  wire id_23, id_24;
  assign id_21.id_23 = 1;
  wire id_25;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output wor id_2,
    input supply1 id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    output tri id_7
);
  wire id_9, \id_10 ;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_5,
      id_0,
      id_1,
      id_3,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
