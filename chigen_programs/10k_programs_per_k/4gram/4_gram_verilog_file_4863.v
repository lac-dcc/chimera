// Seed: 3639307146
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    output uwire id_4,
    input tri1 id_5,
    output tri0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri id_9,
    input wand id_10,
    output uwire id_11,
    output wire id_12,
    input tri id_13,
    input tri0 id_14,
    input supply0 id_15,
    output tri id_16,
    input uwire id_17,
    input uwire id_18
);
  wire id_20;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output uwire id_2
);
  assign id_2 = |id_1;
  wire id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_10 = 0;
endmodule
