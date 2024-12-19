// Seed: 2434486125
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    input supply0 id_4,
    output uwire id_5,
    input tri id_6,
    output tri1 id_7,
    output wor id_8,
    input tri id_9,
    input supply1 id_10,
    output uwire id_11,
    output tri0 id_12,
    input wand id_13,
    input tri0 id_14
);
  assign id_12 = 1'd0;
  always disable id_16;
  wire id_17;
  assign id_11 = id_9;
  assign id_17 = id_6;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input logic id_2,
    output uwire id_3,
    output wand id_4
    , id_24,
    input wand id_5,
    input tri1 id_6,
    input wand id_7,
    input tri1 id_8,
    input wand id_9,
    input tri1 id_10,
    input tri0 id_11,
    input wand id_12,
    input uwire id_13,
    input supply1 id_14,
    input wand id_15
    , id_25,
    input tri id_16,
    output tri0 id_17,
    output tri1 id_18,
    input supply0 id_19,
    output wand id_20,
    input wor id_21,
    output uwire id_22
);
  initial begin : LABEL_0
    id_3 = 1;
    assign id_18 = id_2;
  end
  wire  id_26;
  uwire id_27 = id_19;
  and primCall (
      id_3,
      id_9,
      id_11,
      id_13,
      id_10,
      id_16,
      id_24,
      id_5,
      id_6,
      id_25,
      id_14,
      id_1,
      id_21,
      id_0,
      id_15
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_10,
      id_11,
      id_27,
      id_4,
      id_16,
      id_3,
      id_20,
      id_7,
      id_9,
      id_27,
      id_17,
      id_16,
      id_12
  );
  assign modCall_1.id_10 = 0;
  wire id_28;
  always @(posedge id_10) if (1 - 1) id_4 = 1;
endmodule
