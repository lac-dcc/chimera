// Seed: 3009069065
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    output wire id_5,
    input wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri id_9,
    output wor id_10
);
  assign id_0 = id_7;
endmodule
module module_1 #(
    parameter id_1  = 32'd67,
    parameter id_15 = 32'd34
) (
    input wor id_0,
    output wand _id_1,
    input supply1 id_2,
    output wor id_3,
    input wor id_4,
    output supply1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri id_12,
    output wor id_13
);
  assign id_5 = id_8;
  wor _id_15 = id_11 && 1;
  wire [id_15 : -1] id_16 = id_12;
  logic [id_1 : 1] id_17;
  module_0 modCall_1 (
      id_5,
      id_12,
      id_4,
      id_3,
      id_5,
      id_5,
      id_7,
      id_4,
      id_10,
      id_9,
      id_13
  );
  assign modCall_1.id_0 = 0;
  assign id_13 = id_11 < -1;
endmodule
