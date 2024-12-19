// Seed: 1033332879
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_5 ==? id_2;
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
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_12,
      id_14,
      id_10,
      id_12
  );
  assign modCall_1.id_5 = 0;
  assign id_2 = 1'h0;
  always_latch @(posedge id_7 or posedge id_11) id_6 <= id_4;
endmodule
