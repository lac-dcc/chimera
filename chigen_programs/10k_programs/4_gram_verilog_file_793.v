// Seed: 1292647988
module module_0 #(
    parameter id_21 = 32'd42,
    parameter id_22 = 32'd4
) (
    output supply0 id_0,
    output supply0 id_1,
    input tri id_2,
    output supply1 id_3,
    input wand module_0,
    output wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri id_10,
    output wor id_11,
    output supply1 id_12,
    output wor id_13,
    input uwire id_14,
    output uwire id_15,
    input supply0 id_16
);
  wire id_18;
  wire id_19;
  generate
    wire id_20;
    defparam id_21.id_22 = id_21;
    wire id_23;
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input wand id_2,
    input wire id_3,
    input wor id_4,
    output tri0 id_5,
    input wand id_6,
    output supply0 id_7,
    output wire id_8,
    input tri id_9,
    input wor id_10,
    output tri id_11,
    input wor id_12,
    input wor id_13,
    output wor id_14,
    output tri id_15
);
  module_0(
      id_15,
      id_5,
      id_2,
      id_5,
      id_13,
      id_1,
      id_10,
      id_4,
      id_0,
      id_15,
      id_12,
      id_8,
      id_7,
      id_11,
      id_2,
      id_11,
      id_0
  );
  assign #id_17 id_1 = id_9;
endmodule
