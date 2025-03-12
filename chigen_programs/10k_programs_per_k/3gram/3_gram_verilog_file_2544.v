// Seed: 2743999574
module module_0 (
    output supply1 id_0,
    input wire id_1,
    input uwire id_2,
    input wor id_3,
    output wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wor id_7
    , id_12,
    output supply0 id_8,
    output supply0 id_9,
    input supply1 id_10
);
  generate
    wire id_13;
  endgenerate
  assign id_0 = id_10;
  localparam id_14 = 1 - ~1;
  assign id_4 = id_12;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    output wire id_3
    , id_29,
    input wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    output tri1 id_8,
    input tri0 id_9,
    input wire id_10,
    input supply0 id_11,
    input tri1 id_12,
    output wand id_13,
    output supply1 id_14,
    input tri1 id_15,
    output wor id_16,
    output supply1 id_17,
    output supply1 id_18
    , id_30,
    input wor id_19,
    output tri id_20,
    output uwire id_21,
    output tri0 id_22,
    output wand id_23,
    input tri0 id_24,
    output wand id_25,
    input wire id_26,
    input wor id_27
);
  logic id_31;
  ;
  nand primCall (
      id_8,
      id_10,
      id_7,
      id_0,
      id_15,
      id_9,
      id_1,
      id_6,
      id_19,
      id_24,
      id_27,
      id_12,
      id_5,
      id_11,
      id_4,
      id_26,
      id_29,
      id_31,
      id_30
  );
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_11,
      id_13,
      id_0,
      id_10,
      id_15,
      id_23,
      id_22,
      id_10
  );
  assign modCall_1.id_10 = 0;
endmodule
