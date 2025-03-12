// Seed: 2426837355
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri1 id_2,
    output uwire id_3,
    input wire id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wire id_7,
    output supply0 id_8,
    input supply0 id_9,
    input wire id_10,
    output tri1 id_11,
    input supply0 id_12
    , id_16,
    input wire id_13,
    output wor id_14
);
  logic id_17 = -1;
  assign id_17 = -1;
  parameter id_18 = -1;
  uwire [-1 : -1] id_19 = 1;
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_16 = 32'd45,
    parameter id_17 = 32'd72,
    parameter id_8  = 32'd46
) (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri id_4,
    output supply1 id_5,
    input tri id_6,
    output uwire id_7,
    input wand _id_8,
    input wand id_9,
    output tri id_10,
    input wor id_11,
    input wand id_12,
    output tri id_13,
    output supply1 id_14
);
  module_0 modCall_1 (
      id_2,
      id_12,
      id_5,
      id_3,
      id_4,
      id_9,
      id_11,
      id_4,
      id_3,
      id_2,
      id_12,
      id_14,
      id_9,
      id_2,
      id_0
  );
  assign modCall_1.id_5 = 0;
  always disable _id_16;
  wire _id_17;
  logic [-1 : -1] id_18;
  wire [id_8 : id_17] id_19;
  logic [id_16 : 1] id_20 = id_4;
endmodule
