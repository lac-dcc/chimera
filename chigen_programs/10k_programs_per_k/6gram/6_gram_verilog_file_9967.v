// Seed: 1459691271
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_1.id_7 = 0;
  always @(posedge 1 or posedge -1'h0) #1;
endmodule
module module_1 #(
    parameter id_7 = 32'd22,
    parameter id_8 = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire _id_8;
  input wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter [1 : id_7] id_11 = 1 == "";
  nand primCall (id_9, id_11, id_6, id_4, id_5);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_4,
      id_9
  );
  assign id_2 = id_7;
  logic [1 : id_8] id_12;
endmodule
