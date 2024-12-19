// Seed: 257372220
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri0 id_2
);
  wire id_4;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    input supply1 id_7,
    output supply1 id_8,
    output tri0 id_9,
    output supply1 id_10,
    output tri0 id_11,
    output supply1 id_12,
    input tri id_13,
    output supply0 id_14,
    output uwire id_15,
    input tri0 id_16,
    input wand id_17,
    input supply1 id_18
);
  wire id_20;
  nor primCall (id_15, id_5, id_13, id_4, id_0, id_3, id_18, id_16, id_17, id_2, id_1, id_7);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_6
  );
  assign modCall_1.type_1 = 0;
endmodule
