// Seed: 2332593414
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output tri id_2;
  input logic [7:0] id_1;
  logic [1 : -1] id_10;
  assign id_2 = id_1[1];
  assign id_2 = (-1'b0) / id_1;
  logic id_11;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd42
) (
    id_1,
    _id_2,
    id_3
);
  inout logic [7:0] id_3;
  input wire _id_2;
  inout wire id_1;
  assign #(1) id_3[id_2] = -1 && id_2;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
