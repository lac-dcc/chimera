// Seed: 4182517807
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
    id_15
);
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_11 = id_6;
  wire id_16;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_10,
      id_9,
      id_9,
      id_6,
      id_10,
      id_10,
      id_2,
      id_10,
      id_10,
      id_3,
      id_6,
      id_10,
      id_9
  );
  wire id_11;
  reg id_12, id_13, id_14;
  always @(posedge $realtime) begin : LABEL_0
    id_13 <= (id_4[-1'b0]);
  end
  wire id_15;
  wire id_16;
endmodule
