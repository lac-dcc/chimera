// Seed: 1320981908
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wor id_4,
    output supply1 id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    input wire id_10,
    output wire id_11,
    output tri0 id_12,
    input supply0 id_13,
    output tri1 id_14,
    output wand id_15
);
  assign id_6 = 1 - id_2;
  wire id_17;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    output tri id_6,
    input tri1 id_7,
    output supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri0 id_11
    , id_31,
    input tri0 id_12,
    output wire id_13,
    input tri1 id_14,
    input tri0 id_15
    , id_32,
    input tri id_16,
    input supply1 id_17,
    input tri1 id_18,
    input wire id_19,
    input wire id_20,
    input supply1 id_21,
    input tri id_22,
    input tri id_23,
    input supply0 id_24,
    input uwire id_25,
    output uwire id_26,
    input uwire id_27,
    input wor id_28,
    output wor id_29
);
  uwire id_33;
  assign id_33 = id_10;
  always @(id_15 or posedge 1'h0 == 1) begin : LABEL_0
    id_29 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_22,
      id_7,
      id_15,
      id_17,
      id_26,
      id_6,
      id_14,
      id_4,
      id_11,
      id_16,
      id_29,
      id_26,
      id_0,
      id_33,
      id_9
  );
  assign modCall_1.id_8 = 0;
endmodule
