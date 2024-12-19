// Seed: 1336056491
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    output tri id_8,
    input tri1 id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri1 id_12,
    input tri0 id_13,
    input wire id_14,
    output wire id_15
    , id_24,
    input wand id_16,
    input tri0 id_17,
    output wand id_18,
    input tri1 id_19,
    input supply0 id_20,
    output wire id_21,
    input tri0 id_22
);
  assign id_18 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd35,
    parameter id_11 = 32'd77
) (
    input uwire id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    output tri1 id_5,
    output uwire id_6,
    output wand id_7,
    output tri id_8
);
  defparam id_10.id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_6,
      id_2,
      id_7,
      id_0,
      id_8,
      id_0,
      id_2,
      id_0,
      id_3,
      id_2,
      id_3,
      id_8,
      id_2,
      id_2,
      id_4,
      id_2,
      id_0,
      id_8,
      id_3
  );
endmodule
