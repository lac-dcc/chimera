// Seed: 690583774
module module_0 #(
    parameter id_29 = 32'd79
) (
    output uwire id_0
    , id_25,
    input tri id_1,
    output wor id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wire id_5,
    input wand id_6,
    input tri0 id_7,
    output tri id_8,
    input supply0 id_9,
    input tri1 id_10,
    input wand id_11
    , id_26,
    input tri0 id_12,
    output uwire id_13,
    output supply1 id_14,
    input tri1 id_15,
    output uwire id_16,
    input supply1 id_17,
    input tri1 id_18,
    input tri1 id_19,
    input tri id_20,
    input supply0 id_21,
    input tri0 id_22,
    input supply1 id_23
);
  tri1 id_27 = id_22 ? 1 + id_19 : -1;
  assign id_14 = id_18;
  logic id_28;
  wire _id_29;
  wire [id_29 : -1] id_30;
  assign id_30 = id_11;
  assign id_30 = id_1;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    output supply0 id_2,
    input supply1 id_3,
    output wand id_4
);
  assign id_1 = 1;
  assign id_2 = -1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_0,
      id_3,
      id_2,
      id_1,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_22 = 0;
  assign id_4 = -1;
endmodule
