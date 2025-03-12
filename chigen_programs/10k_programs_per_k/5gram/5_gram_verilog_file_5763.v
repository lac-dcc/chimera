// Seed: 2166269097
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri id_9,
    output wor id_10,
    output wand id_11,
    input supply0 id_12,
    input wor id_13,
    output wand id_14,
    output supply0 id_15,
    output supply1 id_16,
    input tri1 id_17,
    output tri0 id_18,
    input supply0 id_19,
    output wire id_20,
    input tri1 id_21
);
  parameter id_23 = -1;
  logic id_24;
  wire  id_25;
  wire  id_26;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wand id_7,
    output tri0 id_8
    , id_16,
    input uwire id_9,
    output supply1 id_10,
    input tri id_11,
    output wor id_12,
    input supply1 id_13
    , id_17,
    input uwire id_14
);
  logic id_18;
  ;
  assign id_10 = id_1;
  initial begin : LABEL_0
    if (1 !== 1) assign id_18 = -1;
  end
  module_0 modCall_1 (
      id_7,
      id_2,
      id_10,
      id_2,
      id_8,
      id_13,
      id_4,
      id_5,
      id_11,
      id_5,
      id_10,
      id_12,
      id_14,
      id_2,
      id_10,
      id_8,
      id_8,
      id_1,
      id_8,
      id_4,
      id_10,
      id_0
  );
  assign modCall_1.id_21 = 0;
endmodule
