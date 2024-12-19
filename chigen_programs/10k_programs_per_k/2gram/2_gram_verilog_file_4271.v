// Seed: 2036684273
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input wor id_2,
    input wire id_3,
    output uwire id_4,
    input uwire id_5,
    output supply0 id_6,
    input wire id_7,
    input wand id_8
);
  uwire id_10 = id_2, id_11, id_12, id_13, id_14, id_15 = id_10, id_16, id_17;
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1
);
  assign id_3 = id_1;
  wor id_4;
  assign id_4 = id_1;
  assign id_3 = 1'd0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
