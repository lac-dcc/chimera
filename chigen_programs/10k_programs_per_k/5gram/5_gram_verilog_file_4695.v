// Seed: 3785506988
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
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  final $signed(76);
  ;
  wire id_10;
  ;
  wand id_11 = -1'd0;
  final $clog2(45);
  ;
endmodule
module module_1 (
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
    id_11
);
  input logic [7:0] id_11;
  output wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_1,
      id_9,
      id_6,
      id_1,
      id_1,
      id_1
  );
  output wire id_3;
  output tri1 id_2;
  inout wire id_1;
  assign id_2 = id_11[-1] == {-1, id_11} ? 1 - {~id_11, 1} + 1'b0 : id_8[1];
  wire id_12 = 1;
endmodule
