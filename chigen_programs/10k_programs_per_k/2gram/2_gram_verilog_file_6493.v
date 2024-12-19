// Seed: 1034958364
module module_0 (
    input uwire id_0
);
  wire id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1
);
  logic [7:0] id_3;
  module_0 modCall_1 (id_1);
  logic [7:0] id_4 = id_3;
  wire id_5;
  assign id_0 = |id_4[1];
endmodule
module module_2 (
    input  wor   id_0,
    input  tri   id_1,
    output uwire id_2
);
  assign id_2 = 1;
  always
  fork
  join_any
  assign id_2 = 1'b0;
  assign id_2 = 1'd0;
  module_0 modCall_1 (id_0);
  assign modCall_1.type_0 = 0;
  wire id_4;
  wire id_5;
  nand primCall (id_2, id_0, id_1);
  tri id_6;
  generate
    assign id_6 = id_0;
  endgenerate
  assign id_5 = id_4;
endmodule
