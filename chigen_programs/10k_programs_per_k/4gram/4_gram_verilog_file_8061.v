// Seed: 385878301
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    output uwire id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri id_6,
    input wire id_7,
    input wand id_8,
    output tri1 id_9,
    output wire id_10,
    input wire id_11,
    output tri id_12,
    output supply1 id_13,
    input tri id_14,
    input uwire id_15
);
  assign id_13 = ~id_11;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    output uwire id_2,
    input  wand  id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
