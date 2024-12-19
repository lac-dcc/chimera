// Seed: 373910862
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input uwire id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    input tri id_6,
    output wand id_7,
    input wor id_8,
    input supply0 id_9,
    output tri id_10,
    output tri id_11,
    output supply1 id_12,
    input wire id_13,
    output wire id_14,
    output tri1 id_15,
    output supply1 id_16,
    input tri1 id_17,
    input wire id_18,
    input wor id_19,
    output supply0 id_20
);
  always @(*) begin : LABEL_0
    id_15 = id_17;
  end
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    output wand id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output supply1 id_8
    , id_12,
    input wand id_9,
    input wire id_10
);
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_5,
      id_1,
      id_5,
      id_5,
      id_8,
      id_6,
      id_0,
      id_2,
      id_1,
      id_1,
      id_7,
      id_4,
      id_8,
      id_1,
      id_5,
      id_5,
      id_10,
      id_2
  );
  assign modCall_1.id_0 = 0;
  wire id_13;
endmodule
