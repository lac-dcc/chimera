// Seed: 2794138950
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  logic id_3;
  wire  id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd83,
    parameter id_5 = 32'd72,
    parameter id_6 = 32'd98
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    _id_6,
    id_7
);
  inout wire id_7;
  inout wire _id_6;
  input wire _id_5;
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri [id_5 : 1] id_8 = -1 == 'd0;
  nand primCall (id_2, id_7, id_1, id_3, id_9);
  logic [-1  &&  id_6 : id_4] id_9 = 1 == id_3;
  logic id_10;
  module_0 modCall_1 (
      id_3,
      id_8
  );
  assign id_10 = id_9;
endmodule
