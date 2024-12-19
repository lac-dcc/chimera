// Seed: 1161973165
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2
    , id_13,
    input tri id_3,
    output wor id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wand id_10,
    output wor id_11
);
  wire id_14;
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input uwire id_3,
    output wand id_4,
    input wor id_5,
    output tri0 id_6,
    output wand id_7,
    input wire id_8
);
  assign id_6 = 1 ? 1 : 1'b0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_8,
      id_4,
      id_3,
      id_5,
      id_1,
      id_3,
      id_0,
      id_4,
      id_7
  );
endmodule
