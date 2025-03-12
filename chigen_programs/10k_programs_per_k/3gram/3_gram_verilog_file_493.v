// Seed: 153429126
program module_0 (
    output uwire id_0,
    input tri id_1,
    input supply1 id_2,
    input wire id_3,
    output uwire id_4,
    input wor id_5,
    input uwire id_6
);
  assign id_0 = id_5;
endprogram
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    input tri id_2,
    input wor id_3,
    input wire id_4,
    input wor id_5,
    input wand id_6,
    input supply1 id_7,
    output supply1 id_8,
    output tri id_9,
    output tri1 id_10,
    input tri0 id_11,
    inout wor id_12,
    output supply1 id_13,
    input wire id_14,
    input wand id_15,
    output wor id_16
);
  and primCall (id_8, id_0, id_11, id_15, id_6, id_5, id_7, id_3, id_12, id_14, id_4, id_2);
  module_0 modCall_1 (
      id_13,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
