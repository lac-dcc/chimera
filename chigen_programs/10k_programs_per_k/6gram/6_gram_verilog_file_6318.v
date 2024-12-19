// Seed: 3150802379
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output uwire id_5,
    input tri id_6,
    input tri0 id_7
);
  reg  id_9 = 1;
  wire id_10;
  always @(1 or posedge 1) begin : LABEL_0
    id_9 = id_9;
    id_9 <= 1;
  end
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    output tri id_5,
    output tri id_6,
    output tri0 id_7,
    output supply0 id_8,
    output supply0 id_9,
    output wor id_10,
    output wire id_11,
    output supply1 id_12,
    input wor id_13,
    input logic id_14,
    output tri0 id_15,
    input uwire id_16,
    output wand id_17,
    output tri1 id_18,
    input tri0 id_19,
    input tri0 id_20,
    output supply1 id_21,
    input supply0 id_22,
    input supply1 id_23,
    input tri0 id_24,
    output wire id_25,
    input wire id_26
);
  always force id_11 = id_14;
  module_0 modCall_1 (
      id_20,
      id_16,
      id_1,
      id_11,
      id_26,
      id_17,
      id_16,
      id_24
  );
  assign modCall_1.id_2 = 0;
  assign #id_28 id_6 = id_19 == 1;
endmodule
