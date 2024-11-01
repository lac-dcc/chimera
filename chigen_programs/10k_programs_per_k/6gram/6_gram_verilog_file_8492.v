// Seed: 1570611255
module module_0 (
    input wand id_0,
    output supply1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri id_5,
    input wor id_6,
    input tri1 id_7,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    input wand id_11,
    input tri id_12,
    input uwire id_13,
    output uwire id_14,
    input wor id_15,
    input wor id_16,
    input uwire id_17,
    input tri id_18
);
  assign id_1 = 1;
  reg
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33;
  wire id_34;
  initial id_27 = #1 1'h0;
endmodule
module module_1 #(
    parameter id_7 = 32'd71,
    parameter id_8 = 32'd73
) (
    input  tri0  id_0,
    output wand  id_1,
    output tri   id_2,
    input  wire  id_3,
    input  wand  id_4,
    output uwire id_5
);
  assign id_5 = id_0;
  assign id_2 = id_4;
  module_0(
      id_3,
      id_5,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_5,
      id_4,
      id_0,
      id_4,
      id_4
  ); defparam id_7.id_8 = 1;
endmodule
