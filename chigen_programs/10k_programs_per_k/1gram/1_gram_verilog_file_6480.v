// Seed: 3777373276
program module_0 (
    input uwire id_0,
    output wand id_1,
    output tri1 id_2,
    input wand id_3,
    input uwire id_4,
    output tri id_5,
    input tri1 id_6,
    input wand id_7,
    output tri0 id_8,
    output supply1 id_9,
    output tri id_10,
    input uwire id_11,
    output tri0 id_12,
    input supply0 id_13,
    input wand id_14,
    output wire id_15
);
  supply0 [1 : -1] id_17 = id_14, id_18 = -1'd0;
  assign module_1.id_2 = 0;
endprogram
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    output wire  id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2
  );
endmodule
