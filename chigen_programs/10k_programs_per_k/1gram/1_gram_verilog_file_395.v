// Seed: 1945906646
module module_0 (
    output wor   id_0,
    output uwire id_1
);
  assign id_0 = id_3;
  uwire id_4 = 1, id_5;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input uwire id_2,
    output supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output supply0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wire id_11,
    input wand id_12,
    output wire id_13,
    input tri0 id_14
);
  xor primCall (id_3, id_0, id_1, id_12, id_5, id_4, id_10, id_7);
  module_0 modCall_1 (
      id_8,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_13 = id_10;
endmodule
