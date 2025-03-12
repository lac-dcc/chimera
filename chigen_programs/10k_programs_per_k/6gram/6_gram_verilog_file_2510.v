// Seed: 1117704243
module module_0 (
    input wor id_0,
    input wand id_1,
    output wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input tri id_12,
    input supply0 id_13,
    input supply0 id_14,
    output supply0 id_15,
    output wor id_16,
    input tri1 id_17,
    input wor id_18,
    output tri0 id_19,
    output supply0 id_20
);
  assign id_2 = id_4;
  parameter id_22 = 1;
  logic id_23;
endmodule
module module_1 #(
    parameter id_10 = 32'd28,
    parameter id_6  = 32'd69
) (
    input tri id_0,
    input wand id_1,
    output supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    input supply1 _id_6,
    input supply0 id_7,
    input uwire id_8,
    input uwire id_9,
    input wand _id_10,
    output supply0 id_11,
    input wire id_12,
    output wor id_13,
    input tri id_14,
    input tri0 id_15,
    output uwire id_16
);
  wire [1 : id_6  ^  ~  id_10] id_18;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_11,
      id_4,
      id_1,
      id_1,
      id_12,
      id_3,
      id_13,
      id_15,
      id_15,
      id_8,
      id_9,
      id_12,
      id_1,
      id_2,
      id_13,
      id_14,
      id_8,
      id_13,
      id_2
  );
  assign modCall_1.id_1 = 0;
  assign id_16 = -1 !== id_18;
  always disable id_19;
endmodule
