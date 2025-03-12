// Seed: 2050839013
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    output tri id_6,
    output tri id_7
    , id_19,
    input supply0 id_8,
    output wor id_9,
    input wire id_10,
    input supply1 id_11,
    input wor id_12,
    input tri0 id_13,
    input uwire id_14,
    output wand id_15,
    output tri1 id_16,
    output supply0 id_17
);
  assign id_7 = ~id_13;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    input uwire id_2,
    input tri id_3,
    output wor id_4,
    input wand id_5,
    output tri id_6,
    input supply1 id_7,
    input tri id_8,
    output uwire id_9,
    input supply1 id_10
);
  tri id_12 = 1'b0;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_0,
      id_5,
      id_4,
      id_9,
      id_5,
      id_1,
      id_0,
      id_10,
      id_5,
      id_7,
      id_10,
      id_9,
      id_6,
      id_6
  );
  assign modCall_1.id_17 = 0;
endmodule
