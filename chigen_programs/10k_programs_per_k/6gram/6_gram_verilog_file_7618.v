// Seed: 526553648
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output tri id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_17, id_18;
  wire id_19;
  assign id_11 = -1;
  wire id_20;
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
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_10,
      id_9,
      id_7,
      id_6,
      id_11,
      id_6,
      id_1,
      id_11,
      id_11,
      id_8,
      id_6,
      id_3,
      id_4,
      id_4
  );
  output reg id_2;
  inout wire id_1;
  always @(posedge (id_7)) begin : LABEL_0
    id_2 = -1;
  end
endmodule
