// Seed: 1036230232
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wor id_2,
    input supply0 id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    output tri1 id_7,
    input wor id_8,
    output uwire id_9,
    input supply0 id_10,
    input tri0 id_11,
    input tri id_12
);
  always_ff @*;
  tri0  id_14;
  wire  id_15;
  logic id_16;
  ;
  assign module_1.id_5 = 0;
  assign id_9 = id_8;
  assign id_14 = -1;
  assign id_16 = -1;
endmodule
module module_1 #(
    parameter id_7 = 32'd3
) (
    input uwire id_0,
    output wor id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wor id_6,
    input wire _id_7,
    input tri0 id_8
);
  logic [-1 : id_7] id_10;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_0,
      id_8,
      id_3,
      id_2,
      id_5,
      id_1,
      id_2,
      id_3,
      id_8,
      id_0,
      id_4
  );
endmodule
