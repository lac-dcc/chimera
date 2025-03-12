// Seed: 1097573127
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri id_3,
    output tri id_4,
    input supply1 id_5,
    input wire id_6,
    input wire id_7,
    output uwire id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11,
    input uwire id_12,
    input tri id_13,
    input wand id_14
);
  assign module_1.id_22 = 0;
endmodule
module module_1 #(
    parameter id_19 = 32'd60,
    parameter id_23 = 32'd4
) (
    input wire id_0,
    input uwire id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output supply1 id_5,
    input supply1 id_6,
    output wand id_7,
    output tri1 id_8,
    input wire id_9,
    input supply1 id_10,
    input tri0 id_11,
    input tri1 id_12
    , id_29,
    input tri0 id_13,
    input wor id_14,
    input tri1 id_15,
    output uwire id_16,
    input uwire id_17,
    output tri id_18,
    input wand _id_19
    , id_30,
    input wire id_20,
    input uwire id_21,
    input uwire id_22,
    input wand _id_23,
    input supply1 id_24,
    input supply1 id_25,
    input tri id_26,
    input uwire id_27
);
  wire [id_19 : -1 'b0 &  -1] id_31;
  assign id_7 = id_6;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_5,
      id_21,
      id_18,
      id_20,
      id_25,
      id_17,
      id_7,
      id_8,
      id_0,
      id_13,
      id_2,
      id_14,
      id_14
  );
  wire [id_23 : -1] id_32, id_33;
  always @(*) begin : LABEL_0
    #1;
  end
endmodule
