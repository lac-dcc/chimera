// Seed: 4082539129
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  logic id_3;
  ;
  logic id_4;
  final $unsigned(30);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output tri1 id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_2,
      id_6
  );
  assign id_6 = -1;
endmodule
module module_2 #(
    parameter id_10 = 32'd20
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_7,
      id_5
  );
  inout wire id_11;
  input wire _id_10;
  input wire id_9;
  output reg id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input logic [7:0] id_1;
  always @(posedge 1'b0) id_2[id_10-:1'h0] = id_1[-1];
  always @(id_10 or id_4) id_8 = id_1;
  assign id_7 = id_7;
endmodule
