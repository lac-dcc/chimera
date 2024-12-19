// Seed: 4081994558
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri id_5,
    output tri0 id_6,
    output tri1 id_7,
    input tri1 id_8,
    input tri0 id_9,
    output wand id_10,
    input supply1 id_11
    , id_16,
    input supply1 id_12,
    output supply1 id_13,
    input wand id_14
);
  wire id_17;
  wire id_18 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    output supply1 id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4,
    input wand id_5,
    output tri id_6
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_0,
      id_2,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule
