// Seed: 3506651088
module module_0 (
    input wand id_0,
    input tri id_1,
    output tri id_2,
    output supply1 id_3,
    output uwire id_4,
    output supply0 id_5,
    input supply0 id_6
    , id_20,
    input wand id_7,
    output supply1 id_8,
    input wire id_9,
    input tri0 id_10,
    input supply0 id_11,
    output tri0 id_12,
    output wor id_13,
    input tri0 id_14,
    output wand id_15,
    input wand id_16,
    input wire id_17,
    input uwire id_18
);
  wire id_21;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    output uwire id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0
  );
endmodule
