// Seed: 3845285131
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
    id_16,
    id_17
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  assign module_1.id_2 = 0;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_13 = ~id_14;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout reg id_2;
  inout wire id_1;
  reg id_3 = -1;
  logic id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_1,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_4
  );
  always_latch @(posedge -1 !== -1'h0 or posedge 1 ^ -1)
    if ({1, 1}) begin : LABEL_0
      id_3 = id_2;
    end else id_2 <= -1'h0;
endmodule
