// Seed: 1449545374
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri id_3,
    output supply1 id_4,
    output wire id_5,
    input wire id_6,
    input tri1 id_7
);
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wand id_3,
    input supply0 id_4,
    output tri1 id_5,
    output wire id_6,
    input wor id_7,
    output wand id_8,
    output wand id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_9,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
