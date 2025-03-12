// Seed: 754148954
module module_0 #(
    parameter id_17 = 32'd93
) (
    input tri  id_0,
    input tri1 id_1,
    input wand id_2
);
  logic [7:0]
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      _id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42,
      id_43,
      id_44,
      id_45,
      id_46,
      id_47,
      id_48,
      id_49,
      id_50;
  parameter id_51 = 1;
  assign id_46 = id_42[id_17];
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd27,
    parameter id_12 = 32'd50
) (
    input tri1 _id_0,
    output uwire id_1,
    output wire id_2,
    input tri0 id_3
    , id_28,
    input supply0 id_4,
    output wor id_5,
    input wand id_6,
    input wire id_7,
    input wand id_8,
    input tri0 id_9,
    input tri id_10,
    input uwire id_11,
    input tri0 _id_12,
    input wor id_13,
    output tri id_14,
    output tri0 id_15,
    input wand id_16,
    output tri0 id_17,
    input supply1 id_18,
    output tri1 id_19,
    input tri0 id_20,
    output tri1 id_21,
    input wor id_22,
    output tri0 id_23,
    output wire id_24,
    input wand id_25,
    output tri0 id_26
);
  wire id_29;
  module_0 modCall_1 (
      id_22,
      id_13,
      id_11
  );
  wire [id_0 : id_12] id_30;
  xnor primCall (id_19, id_9, id_4, id_3, id_25, id_22, id_13, id_29, id_8, id_7, id_20, id_18);
endmodule
