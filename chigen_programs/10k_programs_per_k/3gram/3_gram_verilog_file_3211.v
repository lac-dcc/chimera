// Seed: 2080669930
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    output uwire id_5,
    input supply0 id_6,
    output wor id_7,
    input supply1 id_8,
    input wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    output supply0 id_12,
    output wor id_13
);
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input wand id_5
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_3,
      id_5,
      id_5,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.type_7 = 0;
  wire id_7;
  assign id_2 = id_1 & 1'b0;
endmodule
