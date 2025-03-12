// Seed: 1178771512
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input wand id_2,
    input wor id_3,
    output uwire id_4,
    input tri1 id_5,
    output uwire id_6,
    input uwire id_7,
    input supply0 id_8,
    input supply0 id_9,
    input wand id_10,
    input tri0 id_11,
    output tri0 id_12,
    input uwire id_13,
    input uwire id_14,
    input wor id_15,
    output tri id_16,
    input tri id_17,
    input tri1 id_18,
    output tri1 id_19,
    input supply0 id_20,
    input wor id_21,
    input wire id_22,
    input supply0 id_23,
    output wand id_24,
    input wire id_25,
    output wire id_26,
    output wor id_27,
    output uwire id_28,
    output uwire id_29,
    output wand id_30,
    output tri0 id_31,
    output wire id_32,
    input wor id_33,
    input uwire id_34
);
  wire id_36;
  assign id_19 = (id_13);
endmodule
module module_1 #(
    parameter id_1 = 32'd54
) (
    input  wor   id_0,
    input  wor   _id_1,
    output uwire id_2,
    output wire  id_3,
    input  tri   id_4,
    output tri   id_5,
    input  wand  id_6,
    input  wire  id_7,
    output tri   id_8
);
  wire [1 : id_1] id_10;
  xor primCall (id_8, id_0, id_7);
  module_0 modCall_1 (
      id_0,
      id_8,
      id_4,
      id_0,
      id_5,
      id_4,
      id_5,
      id_6,
      id_0,
      id_0,
      id_4,
      id_0,
      id_5,
      id_6,
      id_7,
      id_0,
      id_2,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_6,
      id_7,
      id_2,
      id_0,
      id_3,
      id_8,
      id_3,
      id_5,
      id_8,
      id_2,
      id_3,
      id_6,
      id_4
  );
endmodule
