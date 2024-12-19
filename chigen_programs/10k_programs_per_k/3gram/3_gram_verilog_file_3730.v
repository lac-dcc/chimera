// Seed: 3030159991
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
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_7;
  always_latch @(*) cover (id_5);
  assign id_7 = 1'b0;
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
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(1) id_16 = 1'b0;
  assign id_11 = 1;
  or primCall (id_8, id_14, id_1, id_12, id_16, id_17, id_6, id_9, id_13, id_15, id_4, id_2, id_10);
  module_0 modCall_1 (
      id_1,
      id_17,
      id_14,
      id_17,
      id_16,
      id_4,
      id_8
  );
  always @(posedge 1 + 1) begin : LABEL_0
    id_2[1 : 1-1] <= 1 && 1;
  end
endmodule
