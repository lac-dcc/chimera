// Seed: 1587754255
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
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_10 = 0;
endmodule
module module_1;
  reg  id_1;
  wire id_3;
  assign id_2 = 1;
  genvar id_4;
  assign id_4 = 1;
  reg id_5;
  assign id_2 = id_1;
  reg id_6;
  reg id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  reg id_8;
  reg id_9 = id_6;
  reg id_10 = 1;
  assign id_9 = id_5;
  reg id_11 = id_2;
  initial begin : LABEL_0
    id_6 <= 1;
    id_6 <= id_4;
  end
  initial begin : LABEL_0
    id_7  <= id_11;
    id_10 <= id_8;
    $display((1));
    disable id_12;
  end
endmodule
