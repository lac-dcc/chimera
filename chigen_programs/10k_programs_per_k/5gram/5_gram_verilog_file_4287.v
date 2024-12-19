// Seed: 3354732294
module module_0 (
    output wand id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    input wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    output uwire id_8,
    input wor id_9,
    input wor id_10,
    output uwire id_11,
    output uwire id_12,
    output uwire id_13,
    input supply0 id_14,
    output tri id_15,
    input tri id_16,
    input supply1 id_17,
    output supply1 id_18
);
  assign id_18 = id_6;
  assign id_2  = 1;
  wire id_20;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    input supply1 id_2,
    output wand id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_14 = 0;
  assign id_0 = 1;
endmodule
