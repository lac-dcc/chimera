// Seed: 2607848342
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    input supply0 id_6,
    output wor id_7,
    input tri1 id_8
    , id_10
);
  assign id_5  = 1;
  assign id_0  = 1;
  assign id_3  = id_1;
  assign id_10 = {id_6 - 1, 1, 1};
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output wor id_2,
    output tri1 id_3,
    input tri1 id_4,
    output wand id_5,
    output tri0 id_6,
    input tri0 id_7,
    output wor id_8,
    input wor id_9,
    output wire id_10,
    input tri1 id_11,
    output tri1 id_12,
    output tri id_13,
    output tri0 id_14,
    input wor id_15,
    input tri id_16,
    input tri id_17
);
  assign id_6 = id_16 - 1;
  module_0 modCall_1 (
      id_14,
      id_16,
      id_17,
      id_2,
      id_4,
      id_13,
      id_4,
      id_10,
      id_11
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = 1;
endmodule
