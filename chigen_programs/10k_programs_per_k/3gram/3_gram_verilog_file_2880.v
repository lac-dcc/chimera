// Seed: 992139343
module module_0 (
    output tri id_0,
    output wire id_1,
    input uwire id_2,
    input wor id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri0 id_11,
    input wor id_12,
    output wand id_13,
    input tri0 id_14,
    input wire id_15,
    input wor id_16,
    output wor id_17,
    input wand id_18,
    input tri1 id_19,
    input wand id_20,
    input tri0 id_21
    , id_28,
    output wand id_22,
    output tri id_23,
    output wire id_24,
    input uwire id_25,
    output wor id_26
);
  logic id_29;
  assign id_26 = id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd5,
    parameter id_4 = 32'd1
) (
    output wand id_0,
    output tri1 id_1,
    input uwire id_2
    , id_8,
    output wand _id_3,
    input supply1 _id_4,
    input wor id_5,
    input supply0 id_6
);
  always_ff begin : LABEL_0
    id_8[1] <= -1;
  end
  logic [id_3 : -1] id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_6,
      id_2,
      id_5,
      id_5,
      id_6,
      id_6,
      id_0,
      id_6,
      id_5,
      id_2,
      id_6,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5,
      id_5,
      id_1,
      id_0,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.id_11 = 0;
  wire id_10 = id_6;
  logic id_11[1  ?  1 'd0 : id_4 : -1];
  ;
endmodule
