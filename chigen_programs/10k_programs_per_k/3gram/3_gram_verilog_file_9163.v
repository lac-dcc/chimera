// Seed: 860071427
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    input  tri   id_2,
    input  logic id_3,
    input  logic id_4,
    input  logic id_5,
    input  logic id_6,
    output logic id_7
    , id_9
);
  logic id_10;
  assign id_7 = id_4;
  assign id_9 = id_5;
  always_latch begin : LABEL_0
    if (1) if (id_10) id_7 <= id_5;
    id_10 = id_3;
  end
  wire id_11;
  assign id_9 = id_10#(.id_3(1));
  supply0 id_12 = 1;
  assign id_10 = id_6;
  module_0 modCall_1 (
      id_12,
      id_11,
      id_12,
      id_11,
      id_12,
      id_11
  );
  assign id_10 = 1;
  wire id_13;
endmodule
