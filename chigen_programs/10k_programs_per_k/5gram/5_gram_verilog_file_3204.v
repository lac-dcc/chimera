// Seed: 3119388941
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    output tri id_5
);
  logic [1 : -1] id_7;
  ;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_19 = 32'd43
) (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5
    , id_22,
    output tri1 id_6,
    input supply1 id_7,
    input supply1 id_8,
    output wand id_9,
    output wand id_10,
    input wor id_11,
    output supply0 id_12,
    input tri0 id_13,
    output supply0 id_14,
    input wand id_15
    , id_23,
    output supply1 id_16,
    input tri1 id_17,
    input uwire id_18,
    input wand _id_19,
    input wire id_20
);
  wire id_24;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_2,
      id_3,
      id_11,
      id_12
  );
  assign id_22 = 1;
  logic [7:0] id_25;
  and primCall (
      id_12,
      id_11,
      id_2,
      id_15,
      id_24,
      id_4,
      id_13,
      id_23,
      id_3,
      id_7,
      id_18,
      id_1,
      id_5,
      id_17,
      id_22,
      id_8
  );
  assign id_25[~id_19] = -1;
endmodule
