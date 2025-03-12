// Seed: 1851481218
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output wand id_2,
    input supply1 id_3
    , id_11,
    input tri0 id_4,
    output uwire id_5,
    input wand id_6,
    output supply0 id_7,
    output tri id_8,
    input wire id_9
);
  assign id_8 = 1;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input wire id_2,
    output tri0 id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wand id_6,
    output uwire id_7
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_6,
      id_5,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
  nand primCall (id_3, id_0, id_6, id_2);
endmodule
