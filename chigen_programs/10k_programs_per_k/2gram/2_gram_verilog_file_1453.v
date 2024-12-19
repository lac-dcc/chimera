// Seed: 1501279947
module module_0 (
    output uwire id_0,
    input wand id_1,
    input wand id_2,
    input tri0 id_3,
    input uwire id_4,
    output tri1 id_5,
    output tri id_6,
    input tri id_7,
    output supply1 id_8,
    output supply0 id_9
    , id_16,
    input wor id_10,
    output wor id_11,
    input wand id_12,
    input wire id_13,
    input tri0 id_14
);
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input uwire id_2,
    input tri id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input wire id_7,
    output wire id_8,
    input uwire id_9,
    input wor id_10
);
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_1,
      id_9,
      id_7,
      id_8,
      id_8,
      id_6,
      id_8,
      id_8,
      id_10,
      id_8,
      id_6,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
