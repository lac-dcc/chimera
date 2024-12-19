// Seed: 1795721959
module module_0 (
    input  tri1  id_0,
    output uwire id_1
);
  assign id_1 = id_0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    input uwire id_3,
    output uwire id_4,
    input tri1 id_5,
    output wor id_6,
    input tri0 id_7,
    input tri id_8,
    input uwire id_9,
    output wand id_10,
    output supply1 id_11,
    input supply1 id_12,
    output tri id_13
);
  wire id_15, id_16;
  xor primCall (id_10, id_5, id_9, id_12, id_2, id_3, id_15, id_1, id_0, id_8, id_16, id_7);
  module_0 modCall_1 (
      id_9,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
