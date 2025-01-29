// Seed: 4002987363
module module_0 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    input wand id_3,
    input wor id_4,
    input wire id_5,
    input wire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input supply1 id_9,
    output tri1 id_10
);
  wire id_12, id_13;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input wor id_2,
    output supply0 id_3,
    input tri id_4,
    input tri id_5,
    input supply1 id_6,
    input wire id_7,
    output uwire id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    input tri id_12,
    input wand id_13,
    input wire id_14
);
  wire id_16;
  xnor primCall (id_3, id_16, id_14, id_2, id_5, id_6, id_7, id_11, id_4, id_13, id_9);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_14,
      id_5,
      id_5,
      id_2,
      id_11,
      id_4,
      id_14,
      id_14,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
