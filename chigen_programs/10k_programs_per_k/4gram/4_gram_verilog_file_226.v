// Seed: 2966540455
module module_0 (
    id_1,
    id_2,
    module_0,
    id_4
);
  output tri1 id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_15 = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input logic [7:0] id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  nand primCall (id_7, id_3, id_2, id_8, id_14);
  wire [-1 : 1] id_14;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_14,
      id_7
  );
  _id_15 :
  assert property (@(negedge id_9) id_9)
  else $clog2(28);
  ;
  wire [-1 : 1 'h0 -  -1] id_16;
endmodule
