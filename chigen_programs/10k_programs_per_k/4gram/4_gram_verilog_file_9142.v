// Seed: 4183031258
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input supply1 id_2,
    output wand id_3,
    input uwire id_4,
    input uwire id_5,
    input tri1 id_6,
    output wand id_7,
    input wor id_8,
    input wire id_9,
    output tri0 id_10,
    input tri id_11,
    input tri0 id_12,
    input supply0 id_13,
    output tri id_14
    , id_19,
    output tri0 id_15,
    output wand id_16,
    output tri id_17
);
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    inout tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri0 id_5
);
  assign id_2 = -1 - id_1;
  or primCall (id_2, id_5, id_0, id_1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_4,
      id_2,
      id_2,
      id_5,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_11 = 0;
endmodule
