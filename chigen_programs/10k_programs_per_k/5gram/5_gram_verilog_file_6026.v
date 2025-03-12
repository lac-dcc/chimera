// Seed: 1996756407
module module_0 (
    input uwire id_0,
    input wand id_1,
    input uwire id_2,
    input tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri id_8,
    input wand id_9,
    input tri1 id_10,
    input tri0 id_11,
    input supply1 id_12,
    input tri id_13,
    input uwire id_14,
    input tri0 id_15,
    input supply0 id_16
);
  wire id_18;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output tri id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
