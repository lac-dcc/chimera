// Seed: 2878106517
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
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
  wire id_12;
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
    id_15
);
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  always_latch @(posedge id_5 or posedge 1'b0) begin : LABEL_0
    assert (1 || id_16);
    if (id_16) #1 id_9 <= 1;
  end
  module_0 modCall_1 (
      id_16,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_8,
      id_4,
      id_1,
      id_16
  );
endmodule
