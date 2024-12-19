// Seed: 2254923344
module module_0 #(
    parameter id_24 = 32'd83,
    parameter id_25 = 32'd86
) (
    output supply0 id_0,
    input supply1 id_1
    , id_22,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    output tri id_6,
    input wand id_7
    , id_23,
    output supply1 id_8,
    input supply0 id_9,
    output wor id_10,
    input wire id_11,
    input wand id_12,
    input tri id_13,
    output uwire id_14,
    input uwire id_15,
    input wor id_16,
    output wand id_17,
    input supply1 id_18,
    output wand id_19,
    input wire id_20
);
  generate
    defparam id_24.id_25 = 1;
  endgenerate
endmodule
module module_1 (
    output tri0 id_0,
    output wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output wor id_4,
    output supply1 id_5,
    input wand id_6,
    output wor id_7,
    input wire id_8,
    output logic id_9,
    input wire id_10,
    input wire id_11,
    input wire id_12,
    input tri0 id_13,
    output supply0 id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_14,
      id_10,
      id_2,
      id_10,
      id_13,
      id_3,
      id_14,
      id_12,
      id_14,
      id_11,
      id_14,
      id_8,
      id_6,
      id_10,
      id_1,
      id_11,
      id_12,
      id_14,
      id_8,
      id_7,
      id_3
  );
  assign modCall_1.type_10 = 0;
  always id_9 = #id_17 1'b0;
endmodule
