// Seed: 906448910
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wand id_2,
    output wand id_3,
    input tri1 id_4,
    input uwire id_5,
    output wor id_6,
    output uwire id_7,
    input supply1 id_8,
    input tri id_9,
    output wor id_10,
    input tri0 id_11,
    output supply1 id_12,
    input wor id_13,
    input wor id_14,
    input wor id_15,
    input supply0 id_16,
    input wand id_17,
    input wor id_18
);
  wire id_20;
  assign id_7  = -1'd0;
  assign id_12 = {-1, id_17};
  assign id_1  = id_9;
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    input supply1 id_7,
    input tri id_8,
    input supply1 id_9,
    input uwire id_10,
    input wand id_11,
    output tri0 id_12,
    input tri0 id_13,
    output supply0 id_14,
    input wor id_15,
    input tri0 id_16
);
  always id_14 = id_7;
  module_0 modCall_1 (
      id_6,
      id_14,
      id_3,
      id_12,
      id_1,
      id_5,
      id_0,
      id_12,
      id_16,
      id_7,
      id_14,
      id_9,
      id_12,
      id_2,
      id_1,
      id_2,
      id_2,
      id_7,
      id_5
  );
  assign modCall_1.id_15 = 0;
  logic [7:0][1] id_18;
endmodule
