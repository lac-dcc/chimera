// Seed: 2185145839
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input wand id_2,
    output uwire id_3,
    input tri id_4
    , id_15,
    output supply1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wire id_8,
    output supply0 id_9,
    input uwire id_10,
    input wire id_11,
    input wor id_12,
    output uwire id_13
);
  assign id_6 = -1'd0;
endmodule
module module_1 #(
    parameter id_16 = 32'd36,
    parameter id_22 = 32'd11,
    parameter id_24 = 32'd68,
    parameter id_29 = 32'd67
) (
    input wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input wand id_4,
    input wire id_5,
    input wire id_6,
    output tri0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input tri0 id_12
    , id_26,
    input tri id_13,
    input tri0 id_14,
    input tri1 id_15,
    input wire _id_16,
    input wire id_17,
    input supply1 id_18,
    input tri id_19,
    input tri id_20,
    input supply0 id_21,
    input uwire _id_22,
    input uwire id_23,
    output uwire _id_24
);
  parameter id_27 = ~-1;
  parameter id_28 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_10,
      id_7,
      id_8,
      id_18,
      id_4,
      id_8,
      id_3,
      id_5,
      id_4,
      id_7
  );
  assign modCall_1.id_12 = 0;
  wire [id_22 : id_24] _id_29 = id_17;
  parameter id_30 = id_28;
  wor [id_29 : id_16] id_31 = -1;
endmodule
