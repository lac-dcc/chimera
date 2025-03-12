// Seed: 1034574511
module module_0 (
    output wor id_0,
    output tri id_1,
    output uwire id_2,
    output supply1 id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    output wor id_7,
    input supply0 id_8,
    output tri1 id_9,
    input tri0 id_10
);
  parameter id_12 = 1'b0;
  wire id_13;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd52
) (
    output uwire id_0,
    output tri1  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    input  tri1  _id_4,
    output uwire id_5,
    input  wire  id_6,
    input  tri0  id_7
);
  wire [-1 : id_4] id_9;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_0,
      id_7,
      id_7,
      id_6,
      id_0,
      id_3,
      id_0,
      id_3
  );
endmodule
