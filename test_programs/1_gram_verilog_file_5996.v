// Seed: 4169898308
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply1 id_4
);
  wor id_6 = id_2;
  wire id_7, id_8, id_9;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wor id_3,
    output tri id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_1,
      id_0
  );
  assign id_4 = 1;
endmodule
module module_2 (
    input wor id_0,
    output supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    output tri1 id_5,
    output wor id_6,
    output supply0 id_7,
    input uwire id_8,
    input wire id_9,
    input supply0 id_10,
    output wand id_11
);
  wire id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_10,
      id_9
  );
  assign modCall_1.id_2 = 0;
  id_17(
      1, $realtime
  );
endmodule
