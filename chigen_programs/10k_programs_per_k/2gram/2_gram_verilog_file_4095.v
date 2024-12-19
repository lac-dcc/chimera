// Seed: 3795804584
module module_0 (
    output uwire id_0,
    output wire id_1,
    output wor id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5,
    input uwire id_6,
    input tri1 id_7,
    input tri0 id_8,
    input uwire id_9,
    output wor id_10,
    output wor id_11,
    input uwire id_12,
    input wor id_13,
    output wire id_14,
    input uwire id_15
);
  assign id_1 = id_3;
endmodule
module module_1 (
    input  wor  id_0,
    output tri  id_1,
    input  wand id_2,
    output wire id_3,
    input  tri0 id_4
);
  assign id_1 = 1'd0;
  not primCall (id_1, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_2,
      id_0,
      id_4,
      id_0,
      id_4,
      id_1,
      id_1,
      id_4,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
