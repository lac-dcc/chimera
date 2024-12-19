// Seed: 2600451283
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output tri0 id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wor id_5,
    output wor id_6,
    input tri0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input wand id_10,
    input tri0 id_11,
    input supply1 id_12,
    input supply0 id_13,
    output tri0 id_14,
    output tri1 id_15,
    output supply1 id_16,
    input tri1 id_17,
    input wand id_18,
    input uwire id_19
    , id_23,
    input tri1 id_20,
    input wor id_21
);
  wire id_24;
endmodule
module module_1 (
    output tri0 id_0,
    input logic id_1,
    output tri0 id_2,
    input wire id_3,
    input uwire id_4,
    input wire id_5,
    output supply1 id_6,
    output tri id_7,
    input supply1 id_8,
    input wand id_9,
    input wor id_10,
    output wire id_11,
    output wor id_12,
    input tri id_13,
    output supply0 id_14,
    output tri0 id_15,
    input supply1 id_16
);
  logic [7:0] id_18;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_2,
      id_2,
      id_13,
      id_6,
      id_10,
      id_11,
      id_10,
      id_5,
      id_4,
      id_16,
      id_10,
      id_0,
      id_11,
      id_15,
      id_10,
      id_8,
      id_4,
      id_9,
      id_8
  );
  assign modCall_1.id_18 = 0;
  always @(negedge 1) begin : LABEL_0
    id_18['b0] <= id_1;
  end
endmodule
