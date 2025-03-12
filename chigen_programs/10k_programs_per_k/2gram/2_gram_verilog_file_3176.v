// Seed: 388887744
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wand id_5
    , id_15,
    output wand id_6,
    input tri1 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input wand id_10,
    output supply0 id_11,
    output supply1 id_12,
    input tri0 id_13
);
  assign id_12 = id_7;
endmodule
macromodule module_1 (
    output supply1 id_0,
    input wor id_1,
    output wand id_2,
    output uwire id_3,
    input wor id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8,
    input supply0 id_9
);
  parameter id_11 = -1;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_0,
      id_2,
      id_7,
      id_1,
      id_0,
      id_8,
      id_9,
      id_0,
      id_1,
      id_5,
      id_0,
      id_4
  );
  assign modCall_1.id_8 = 0;
endmodule
