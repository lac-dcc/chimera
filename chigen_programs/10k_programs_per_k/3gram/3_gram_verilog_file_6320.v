// Seed: 1114540100
module module_0 #(
    parameter id_22 = 32'd96,
    parameter id_23 = 32'd75
) (
    input tri id_0,
    output supply1 id_1,
    output wire id_2,
    output tri1 id_3,
    output tri0 id_4,
    output uwire id_5,
    input tri1 id_6,
    output supply1 id_7,
    input wand id_8,
    input uwire id_9,
    input uwire id_10,
    output wire id_11,
    output wand id_12,
    input tri id_13,
    output uwire id_14,
    input uwire id_15,
    output uwire id_16,
    input supply0 id_17,
    input wire id_18,
    input wor id_19,
    input tri0 id_20
);
  assign id_7 = {1, id_10 * id_9 - 1, 1, id_0};
  generate
    defparam id_22.id_23 = !1;
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output tri id_2,
    output uwire id_3,
    output tri1 id_4,
    input tri0 id_5,
    output wire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9
);
  assign id_4 = id_9;
  assign id_4 = id_9;
  wire id_11;
  module_0(
      id_0,
      id_3,
      id_2,
      id_2,
      id_4,
      id_2,
      id_8,
      id_6,
      id_0,
      id_8,
      id_1,
      id_2,
      id_6,
      id_0,
      id_4,
      id_9,
      id_3,
      id_7,
      id_0,
      id_1,
      id_0
  );
endmodule
