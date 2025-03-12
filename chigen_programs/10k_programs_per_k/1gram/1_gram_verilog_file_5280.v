// Seed: 3474114874
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output supply1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output supply1 id_8,
    output tri0 id_9
);
  assign id_6 = id_7 - id_0;
  wire id_11;
endmodule
module module_1 #(
    parameter id_1  = 32'd82,
    parameter id_12 = 32'd21,
    parameter id_15 = 32'd66,
    parameter id_20 = 32'd63,
    parameter id_26 = 32'd60,
    parameter id_3  = 32'd82,
    parameter id_7  = 32'd11,
    parameter id_8  = 32'd85,
    parameter id_9  = 32'd86
) (
    input supply0 id_0[-1 : id_20  .  id_9],
    input wor _id_1,
    input supply0 id_2,
    input supply0 _id_3,
    input wor id_4,
    output tri1 id_5,
    output tri1 id_6,
    input wand _id_7,
    output tri0 _id_8,
    input wire _id_9,
    output tri1 id_10,
    output logic id_11[id_8 : id_7  *  id_12],
    input tri _id_12,
    output supply1 id_13,
    input wire id_14,
    input uwire _id_15,
    output wire id_16,
    output tri0 id_17,
    input tri0 id_18,
    input supply1 id_19,
    input wand _id_20[id_1  |  1 : 1  ==  1]
);
  assign id_10 = id_3;
  logic id_22;
  ;
  wire id_23, id_24, id_25, _id_26;
  tranif1 (-1);
  wire id_27;
  ;
  assign id_6 = id_20 !== 1'b0;
  assign id_6 = 1;
  assign id_5 = 1;
  wire id_28;
  logic [7:0][id_15 : id_26] id_29;
  module_0 modCall_1 (
      id_18,
      id_4,
      id_13,
      id_0,
      id_10,
      id_17,
      id_16,
      id_14,
      id_6,
      id_6
  );
  wire id_30;
  wire id_31, id_32;
  assign id_27 = id_29#(
      .id_4 (1),
      .id_22(1)
  ) [id_3];
  always id_11 <= id_29 !== -id_19;
  wire id_33;
endmodule
