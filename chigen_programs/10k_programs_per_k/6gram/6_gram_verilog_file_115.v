// Seed: 4125026885
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    output wire id_6
    , id_19,
    input tri0 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10,
    input tri0 id_11,
    input wor id_12,
    input supply0 id_13,
    output tri0 id_14,
    output tri0 id_15,
    output wand id_16,
    output uwire id_17
);
  assign id_17 = 1 & 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    output uwire id_4
);
  assign id_4 = id_0 !== 1'b0 ? 1 : 1'b0 ? 1 : 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1,
      id_4,
      id_2,
      id_1,
      id_0,
      id_0,
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
