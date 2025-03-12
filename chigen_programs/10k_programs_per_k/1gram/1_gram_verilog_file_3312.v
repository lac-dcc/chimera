// Seed: 190131531
module module_0 (
    input  wand  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    output uwire id_3,
    output wire  id_4
);
  logic id_6;
endmodule
module module_1 #(
    parameter id_11 = 32'd69,
    parameter id_16 = 32'd5,
    parameter id_7  = 32'd4,
    parameter id_8  = 32'd33
) (
    input supply0 id_0,
    input wand id_1,
    output tri0 id_2,
    output uwire id_3,
    input supply0 id_4[1 : (  id_7  )],
    input wand id_5,
    input tri1 id_6,
    output uwire _id_7,
    input tri0 _id_8[{  id_11  ,  id_16  } : id_8],
    input uwire id_9,
    output tri id_10,
    output supply0 _id_11,
    output wire id_12,
    input tri0 id_13,
    output wor id_14,
    output wand id_15,
    input supply1 _id_16,
    input uwire id_17,
    input wand id_18,
    output tri0 id_19,
    input tri1 id_20
);
  wire [1 : -1] id_22, id_23, id_24, id_25;
  wire id_26, id_27;
  wire id_28;
  wire id_29;
  logic id_30 = -1, id_31 = id_13;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_0,
      id_18,
      id_4,
      id_12,
      id_19
  );
  assign modCall_1.id_2 = 0;
  assign id_10 = -1;
endmodule
