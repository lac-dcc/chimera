// Seed: 3318455069
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input tri1 id_8,
    input uwire id_9
);
  rtran (1, 1, id_0 + id_7);
  logic id_11 = id_5 - 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd37,
    parameter id_9  = 32'd28
) (
    output uwire id_0,
    input wor id_1,
    output wand id_2,
    output wire id_3,
    input wor id_4,
    output supply1 id_5,
    input wand id_6,
    input wire id_7,
    output wire id_8
    , id_27,
    input wire _id_9,
    input uwire id_10,
    input tri1 id_11,
    input wire _id_12,
    input supply1 id_13,
    output tri1 id_14,
    input wor id_15,
    output tri0 id_16,
    output tri1 id_17,
    input tri id_18,
    output supply1 id_19,
    input tri0 id_20,
    output supply0 id_21,
    input tri id_22,
    input wor id_23,
    input wire id_24,
    output wor id_25
);
  wire [id_9 : id_12] id_28;
  assign id_27[-1] = id_4#(.id_10(-1'b0 < 1'h0)) ? -1 : 1 & id_10;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_3,
      id_4,
      id_7,
      id_20,
      id_15,
      id_17,
      id_18,
      id_23
  );
  assign modCall_1.id_0 = 0;
endmodule
