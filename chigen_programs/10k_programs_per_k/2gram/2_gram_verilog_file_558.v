// Seed: 3035722119
module module_0 (
    input wor id_0,
    output wire id_1
    , id_17,
    input tri0 id_2,
    output wor id_3,
    output supply0 id_4,
    input wor id_5,
    input wor id_6,
    output supply0 id_7,
    output wand id_8,
    input wor id_9,
    input tri0 id_10,
    output tri0 id_11,
    output tri0 id_12,
    output wand id_13,
    output uwire id_14,
    input wire id_15
);
  assign id_8 = id_2;
  wire id_18;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output tri id_3,
    output supply1 id_4
);
  reg id_6;
  always #id_7 id_6 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_10 = 0;
  uwire [-1 : -1 'h0] id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  assign id_12 = -1;
endmodule
