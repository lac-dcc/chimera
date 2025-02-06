// Seed: 2150101324
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
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_19;
  bit  id_20;
  wire id_21;
  assign id_11 = $realtime;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_2,
      id_5,
      id_4,
      id_19
  );
  assign id_18 = $realtime;
  always @(posedge -1 or $realtime) begin : LABEL_0
    id_13 <= id_20;
    id_7  <= $realtime;
  end
endmodule
