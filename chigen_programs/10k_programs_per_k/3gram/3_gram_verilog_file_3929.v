// Seed: 998586364
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wand id_4,
    output tri1 id_5,
    output uwire id_6,
    output tri0 id_7
);
  wire id_9;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    input uwire id_2,
    input wire id_3,
    inout uwire id_4,
    input wor id_5,
    output uwire id_6,
    input tri1 id_7,
    input supply0 id_8,
    output wand id_9,
    output wor id_10,
    output tri1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wire id_14
);
  wire id_16;
  always @(*);
  and primCall (id_4, id_12, id_5, id_0, id_16, id_2, id_13, id_7, id_14, id_8, id_3);
  module_0 modCall_1 (
      id_14,
      id_5,
      id_14,
      id_10,
      id_5,
      id_1,
      id_11,
      id_4
  );
  assign modCall_1.id_4 = 0;
  parameter id_17 = -1;
endmodule
