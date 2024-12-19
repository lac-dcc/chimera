// Seed: 4160783829
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output wor id_2,
    input uwire id_3,
    input supply1 id_4,
    output tri id_5,
    input wor id_6,
    output tri0 id_7,
    output uwire id_8,
    output tri1 id_9,
    input supply1 id_10,
    output wand id_11,
    output wor id_12,
    output supply0 id_13,
    input wand id_14
);
  wire id_16;
  wor  id_17 = 1 ^ id_14;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input wor id_2,
    input wor id_3,
    output wire id_4,
    input uwire id_5,
    input supply0 id_6,
    input wire id_7,
    input uwire id_8,
    input supply0 id_9,
    output uwire id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_4,
      id_5,
      id_6,
      id_4,
      id_5,
      id_10,
      id_10,
      id_0,
      id_9,
      id_10,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
