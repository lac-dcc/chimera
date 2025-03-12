// Seed: 1011008599
program module_0 (
    input wire id_0,
    output uwire id_1,
    input wand id_2,
    input wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    input tri1 id_6
    , id_18,
    input tri id_7,
    output wand id_8,
    output uwire id_9
    , id_19,
    input wand id_10,
    input supply1 id_11,
    output uwire id_12,
    input uwire id_13,
    output tri0 id_14,
    output wand id_15,
    output wire id_16
);
endprogram
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri id_3,
    input tri1 id_4,
    output supply1 id_5,
    input wand id_6
    , id_9,
    input tri id_7
);
  assign id_5 = id_9;
  and primCall (id_5, id_3, id_4);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_3,
      id_3,
      id_5,
      id_6,
      id_1,
      id_0,
      id_0,
      id_4,
      id_7,
      id_5,
      id_1,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
