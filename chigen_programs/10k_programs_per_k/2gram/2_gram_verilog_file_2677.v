// Seed: 2080140468
program module_0 (
    output tri id_0,
    input tri id_1,
    output uwire id_2,
    output supply0 id_3,
    output wire id_4
);
  supply1 id_6 = 1, id_7;
endprogram
module module_1 #(
    parameter id_13 = 32'd85,
    parameter id_14 = 32'd24,
    parameter id_7  = 32'd81
) (
    output wire  id_0,
    input  tri0  id_1,
    output wire  id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    output wor   id_5,
    input  tri0  id_6,
    input  tri0  _id_7,
    input  uwire id_8,
    input  wire  id_9
    , _id_13,
    input  tri0  id_10,
    output tri0  id_11
);
  assign id_11 = id_13 != 1;
  wire _id_14;
  logic [-1 : id_7] id_15;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_11,
      id_5
  );
  assign modCall_1.id_4 = 0;
  logic [1 'h0 +  id_13 : id_14] id_16 = id_1;
endmodule
