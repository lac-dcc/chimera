// Seed: 1682663312
module module_0 (
    input tri id_0,
    output wand id_1,
    input wire id_2,
    output uwire id_3,
    input uwire id_4,
    input wor id_5,
    inout wor id_6,
    output uwire id_7,
    id_12,
    input wor id_8,
    output supply0 id_9,
    input supply1 id_10
);
endmodule
module module_1 #(
    parameter id_28 = 32'd60
) (
    input wand id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri id_3,
    output tri1 id_4,
    input wand id_5,
    output uwire id_6,
    input supply1 id_7,
    id_26,
    input supply0 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12,
    output wire id_13,
    input supply1 id_14,
    input wand id_15,
    input wor id_16,
    input supply1 id_17,
    output tri0 id_18,
    input wor id_19,
    output wor id_20,
    input tri0 id_21,
    output logic id_22,
    input uwire id_23,
    output tri1 id_24
);
  wor id_27 = id_8;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_10,
      id_24,
      id_27,
      id_19,
      id_27,
      id_24,
      id_10,
      id_20,
      id_17
  );
  assign modCall_1.id_9 = 0;
  always_ff id_22 = new;
  defparam id_28 = -1;
  assign id_18 = 1;
endmodule
