// Seed: 2970086458
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wire id_5,
    input wand id_6,
    output tri id_7,
    input supply0 id_8,
    output supply1 id_9,
    output tri id_10
);
  assign id_7 = -1;
  logic id_12;
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    output tri0 id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9,
    output wor id_10,
    output supply0 id_11,
    input tri0 id_12,
    output supply0 id_13,
    output wor id_14
);
  parameter id_16 = 1;
  xnor primCall (id_14, id_2, id_8, id_5, id_1, id_7, id_4, id_9);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_14,
      id_5,
      id_1,
      id_0,
      id_8,
      id_6,
      id_12,
      id_14,
      id_14
  );
  assign modCall_1.id_9 = 0;
endmodule
