// Seed: 3944214439
module module_0 (
    input wor id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri1 id_3,
    input tri id_4
    , id_24,
    output wire id_5,
    input uwire id_6,
    input supply1 id_7,
    input uwire id_8,
    input wand id_9,
    input tri0 id_10,
    input uwire id_11,
    input uwire id_12,
    input wand id_13,
    output wand id_14,
    output supply1 id_15,
    input tri1 id_16,
    output wire id_17,
    output wand id_18,
    input tri id_19,
    output supply0 id_20,
    input tri1 id_21,
    input uwire id_22
);
  assign id_24 = -1;
  assign id_5  = id_19;
  parameter id_25 = 1 ==? 1;
endmodule
module module_0 #(
    parameter id_12 = 32'd89,
    parameter id_25 = 32'd18
) (
    input supply0 id_0,
    output wire id_1,
    output tri1 id_2,
    output tri0 id_3,
    output tri1 id_4,
    output tri id_5,
    output tri id_6,
    output tri0 id_7,
    output uwire id_8,
    input wire id_9,
    input wand id_10,
    input wor id_11,
    input wand _id_12,
    input uwire id_13,
    output wand id_14,
    input wor id_15,
    input tri id_16,
    output uwire id_17,
    input supply0 id_18,
    input wand id_19,
    input tri0 id_20,
    input wand id_21,
    input tri id_22,
    input wire id_23,
    input uwire module_1,
    input tri0 _id_25,
    output uwire id_26,
    output wor id_27,
    input tri id_28,
    input wand id_29
);
  wire [1 : id_25] id_31;
  logic id_32;
  ;
  wire [1 : id_12] id_33;
  wire id_34;
  nand primCall (
      id_3,
      id_0,
      id_11,
      id_16,
      id_19,
      id_10,
      id_21,
      id_28,
      id_31,
      id_22,
      id_32,
      id_23,
      id_33,
      id_29,
      id_9,
      id_18,
      id_13,
      id_34,
      id_20
  );
  module_0 modCall_1 (
      id_19,
      id_29,
      id_11,
      id_3,
      id_10,
      id_5,
      id_28,
      id_22,
      id_10,
      id_23,
      id_28,
      id_11,
      id_22,
      id_22,
      id_17,
      id_26,
      id_19,
      id_8,
      id_5,
      id_0,
      id_8,
      id_15,
      id_15
  );
  assign modCall_1.id_13 = 0;
endmodule
