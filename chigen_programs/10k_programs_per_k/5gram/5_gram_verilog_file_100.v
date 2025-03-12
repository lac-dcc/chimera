// Seed: 2308214654
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_14 = 32'd24,
    parameter id_15 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  ;
  always_latch @(posedge id_6[~((-1))]) begin : LABEL_0
    $clog2(2);
    ;
  end
  wire id_8;
  wire id_9;
  bit  id_10;
  ;
  wire id_11, id_12, id_13, _id_14;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_8,
      id_5,
      id_12,
      id_13,
      id_7
  );
  always begin : LABEL_1
    id_10 = id_6;
  end
  logic _id_15;
  ;
  parameter [id_14 : -1  ==  id_15] id_16 = 1 == -1;
  wire id_17;
endmodule
