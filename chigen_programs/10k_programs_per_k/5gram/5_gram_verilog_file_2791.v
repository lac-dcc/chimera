// Seed: 568637378
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wor id_2,
    input supply1 id_3,
    input wor id_4,
    input supply1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    output uwire id_10,
    input tri id_11,
    input wor id_12,
    output wor id_13,
    input uwire id_14,
    output wor id_15,
    output tri0 id_16,
    input wor id_17,
    input tri0 id_18,
    input wire id_19,
    input wire id_20,
    input wire id_21
);
  assign id_6  = 1;
  assign id_16 = 1;
  parameter id_23 = -1;
  assign id_10 = -1'b0;
endmodule
module module_1 #(
    parameter id_12 = 32'd3
) (
    input supply0 id_0
    , id_37,
    input wand id_1,
    input uwire id_2,
    output wire id_3,
    output wire id_4,
    input supply0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9,
    output supply0 id_10,
    output tri1 id_11,
    input uwire _id_12,
    input tri1 id_13,
    input wire id_14,
    input tri0 id_15,
    input uwire id_16,
    output tri0 id_17,
    input wor id_18,
    input supply0 id_19,
    input tri id_20,
    input tri id_21,
    input tri0 id_22,
    input uwire id_23,
    input tri1 id_24,
    input tri1 id_25,
    input supply1 id_26,
    output wor id_27,
    input uwire id_28,
    output tri1 id_29,
    output tri id_30,
    input wor id_31,
    input tri1 id_32,
    output uwire id_33,
    input tri id_34,
    input tri id_35
);
  wire id_38;
  nand primCall (
      id_3,
      id_18,
      id_25,
      id_0,
      id_15,
      id_2,
      id_7,
      id_16,
      id_5,
      id_13,
      id_31,
      id_1,
      id_34,
      id_28,
      id_26,
      id_14,
      id_24,
      id_19,
      id_20,
      id_22,
      id_9,
      id_21,
      id_23,
      id_32,
      id_38,
      id_37
  );
  module_0 modCall_1 (
      id_8,
      id_35,
      id_6,
      id_28,
      id_15,
      id_14,
      id_10,
      id_32,
      id_31,
      id_1,
      id_27,
      id_13,
      id_21,
      id_17,
      id_25,
      id_17,
      id_17,
      id_19,
      id_34,
      id_21,
      id_14,
      id_35
  );
  assign modCall_1.id_9 = 0;
  wire [id_12 : 1] id_39, id_40, id_41, id_42;
endmodule
