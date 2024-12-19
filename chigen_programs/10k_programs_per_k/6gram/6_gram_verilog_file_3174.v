// Seed: 228876042
module module_0 #(
    parameter id_20 = 32'd11,
    parameter id_21 = 32'd42
) (
    output supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    output supply1 id_4,
    output wire id_5,
    input wor id_6,
    input tri0 id_7,
    input tri1 id_8,
    input tri0 id_9,
    output tri id_10,
    input tri id_11,
    output uwire id_12,
    output uwire id_13,
    input supply0 id_14,
    input wire id_15,
    output supply1 id_16
);
  wire id_18;
  wire id_19;
  defparam id_20.id_21 = (1'b0);
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    input uwire id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wire id_6,
    output wire id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input supply0 id_11,
    input supply1 id_12,
    output wor id_13
);
  assign id_7 = id_5 == 1;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_6,
      id_12,
      id_9,
      id_9,
      id_6,
      id_5,
      id_4,
      id_2,
      id_13,
      id_3,
      id_9,
      id_13,
      id_11,
      id_4,
      id_13
  );
  assign modCall_1.type_23 = 0;
endmodule
