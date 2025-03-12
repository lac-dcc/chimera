// Seed: 194229312
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output tri id_2,
    output wor id_3,
    input tri id_4,
    input tri id_5,
    input wire id_6,
    input tri id_7,
    input wor id_8,
    output tri1 id_9,
    output tri1 id_10,
    input wor id_11,
    input wand id_12,
    input wire id_13,
    input wire id_14,
    input supply1 id_15,
    input tri0 id_16
);
  assign id_2 = id_11;
  localparam id_18 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd70,
    parameter id_9 = 32'd28
) (
    output supply1 id_0,
    output wand id_1,
    input tri _id_2,
    input wire id_3,
    output tri id_4,
    input uwire id_5,
    output tri1 id_6,
    input wor id_7,
    input wor id_8,
    input supply1 _id_9,
    input wor id_10,
    output supply1 id_11,
    input tri id_12,
    output tri id_13,
    output supply0 id_14,
    input tri0 id_15,
    input wand id_16,
    output wor id_17,
    input uwire id_18
);
  wire [id_9  ^  -1 : id_2] id_20;
  module_0 modCall_1 (
      id_6,
      id_16,
      id_17,
      id_14,
      id_18,
      id_16,
      id_3,
      id_10,
      id_5,
      id_17,
      id_4,
      id_15,
      id_15,
      id_12,
      id_10,
      id_7,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule
