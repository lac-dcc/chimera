// Seed: 2770533763
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri id_2,
    input wire id_3,
    input wire id_4,
    input supply1 id_5,
    input tri id_6,
    input tri id_7,
    input tri1 id_8,
    input wand id_9,
    output supply0 id_10,
    input wand id_11,
    output wor id_12,
    input wire id_13,
    output wire id_14,
    output tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input supply0 id_18,
    input uwire id_19,
    input uwire id_20,
    input uwire id_21,
    output wor id_22
);
  assign id_22 = id_8;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd92
) (
    input supply1 id_0,
    inout tri id_1,
    output supply0 id_2,
    output supply1 id_3,
    output wand _id_4,
    output supply1 id_5
);
  logic [id_4 : 1] id_7;
  ;
  wor   id_8 = 1;
  logic id_9;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule
