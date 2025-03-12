// Seed: 995906695
module module_0 (
    output wire id_0,
    output wand id_1,
    output wand id_2,
    input tri0 id_3,
    output tri0 id_4,
    output uwire id_5,
    input wire id_6,
    input wand id_7,
    output supply1 id_8
    , id_25,
    input tri id_9,
    input wand id_10,
    input wand id_11,
    output tri0 id_12
    , id_26,
    input wire id_13
    , id_27,
    input wor id_14,
    input wand id_15,
    output tri id_16,
    input wor id_17,
    input supply1 id_18,
    output wor id_19,
    input wire id_20,
    input supply1 id_21,
    input supply1 id_22,
    output wand id_23
);
  wire id_28;
endmodule
module module_1 #(
    parameter id_6 = 32'd28
) (
    input wand id_0,
    input wire id_1,
    output wor id_2,
    input tri id_3,
    input wor id_4,
    input tri0 id_5,
    output wand _id_6,
    input uwire id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wand id_10,
    input wand id_11
);
  logic [1 : id_6] id_13;
  assign id_2 = 1 ? id_10 : id_5;
  wire id_14;
  parameter id_15 = !1;
  parameter id_16 = id_15;
  assign id_2 = id_7;
  parameter id_17 = id_15;
  tri1 id_18 = -1;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_2,
      id_4,
      id_2,
      id_8,
      id_0,
      id_1,
      id_8,
      id_7,
      id_9,
      id_9,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_7,
      id_4,
      id_8,
      id_10,
      id_7,
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
  assign id_13[1] = 1'h0;
endmodule
