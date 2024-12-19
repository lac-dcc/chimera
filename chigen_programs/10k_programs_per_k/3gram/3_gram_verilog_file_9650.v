// Seed: 3542820118
module module_0 #(
    parameter id_22 = 32'd46,
    parameter id_23 = 32'd51
) (
    input uwire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    input uwire id_6,
    input wor id_7,
    input wand id_8,
    output supply1 id_9,
    input uwire id_10,
    input wor id_11,
    input wire id_12,
    input uwire id_13,
    output supply0 id_14,
    input supply0 id_15,
    input wire id_16,
    input wand id_17,
    output tri0 id_18,
    input tri0 id_19,
    input supply0 id_20
);
  assign module_1.type_12 = 0;
  defparam id_22.id_23 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    output tri   id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  wor   id_6
);
  tri1 id_8 = id_5;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6,
      id_3,
      id_4,
      id_8,
      id_5,
      id_8,
      id_3,
      id_2,
      id_5,
      id_8,
      id_3,
      id_6,
      id_4
  );
endmodule
