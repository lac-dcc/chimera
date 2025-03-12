// Seed: 749051768
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input logic [7:0] id_9;
  output wire id_8;
  inout wire _id_7;
  inout wire id_6;
  inout logic [7:0] id_5;
  output reg id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  final begin : LABEL_0
    $clog2(32);
    ;
    id_4 <= -1;
  end
  assign id_5[id_7] = 1;
  assign id_5 = id_7;
  logic id_11;
  wire  id_12;
  ;
  module_0 modCall_1 (
      id_12,
      id_6,
      id_10,
      id_6,
      id_6,
      id_12
  );
  wire id_13 = id_10;
endmodule
