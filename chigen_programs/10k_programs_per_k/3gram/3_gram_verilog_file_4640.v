// Seed: 255111603
module module_0 #(
    parameter id_4 = 32'd27
) (
    input  tri1  id_0,
    output uwire id_1
);
  wire id_3;
  wire _id_4;
  wire id_5;
  parameter id_6 = 1;
  logic [-1 : id_4] id_7;
  ;
  assign module_1.id_8 = 0;
  wire [1 'b0 : 1] id_8;
  parameter id_9 = id_6;
  generate
    assign id_1 = id_5;
  endgenerate
endmodule
module module_1 (
    output supply1 id_0
    , id_13,
    input tri0 id_1,
    output tri id_2,
    output tri0 id_3,
    output wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    output tri0 id_7,
    output wor id_8,
    input tri1 id_9,
    input supply0 id_10,
    input tri0 id_11
);
  assign id_4 = -1;
  nand primCall (id_5, id_11, id_10, id_9, id_13, id_6, id_1);
  module_0 modCall_1 (
      id_11,
      id_5
  );
endmodule
