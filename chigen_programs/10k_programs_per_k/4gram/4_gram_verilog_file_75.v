// Seed: 1737511019
module module_0 #(
    parameter id_19 = 32'd83,
    parameter id_20 = 32'd86
) (
    input tri id_0,
    output supply1 id_1,
    input tri id_2,
    input wand id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wand id_9,
    input supply1 id_10,
    output supply0 id_11,
    output wor id_12,
    output wire id_13,
    input wor id_14,
    input wand id_15,
    output tri id_16,
    output wire id_17
);
  generate
    defparam id_19.id_20 = 1;
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_13 = 0;
endmodule
