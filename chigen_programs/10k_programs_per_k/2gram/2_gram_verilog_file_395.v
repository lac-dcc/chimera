// Seed: 1608780488
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  parameter integer id_3 = 1'b0;
  assign id_1 = id_3;
  always begin : LABEL_0
    assert (1) begin : LABEL_1
      disable id_4;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
  genvar id_5;
  wire [-1 : 1] id_6;
  wire id_7;
endmodule
