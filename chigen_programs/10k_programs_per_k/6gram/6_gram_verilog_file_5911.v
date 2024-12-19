// Seed: 1991986120
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wand id_2
    , id_15, id_16,
    input tri0 id_3,
    output tri1 id_4,
    output wor id_5
    , id_17,
    output wand id_6,
    input tri1 id_7,
    input wire id_8,
    output wor id_9,
    output wor id_10,
    input tri0 id_11,
    input supply1 id_12,
    input tri0 id_13
);
  wire id_18;
  always @(1) begin : LABEL_0
    id_15 = id_13;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    input wire id_7,
    input wand id_8,
    output wire id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12,
    input wand id_13,
    input supply1 id_14,
    output wire id_15,
    output wire id_16,
    output wand id_17
);
  wire id_19;
  wire id_20, id_21;
  logic [7:0] id_22;
  assign id_9 = id_12;
  assign id_22[1] = id_3;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_1,
      id_4,
      id_9,
      id_2,
      id_17,
      id_11,
      id_7,
      id_9,
      id_9,
      id_8,
      id_10,
      id_5
  );
  assign modCall_1.id_16 = 0;
endmodule
