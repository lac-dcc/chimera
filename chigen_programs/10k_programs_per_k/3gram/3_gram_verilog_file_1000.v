// Seed: 936489193
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_25;
  parameter id_26 = -1;
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
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout reg id_6;
  inout wire id_5;
  inout wire id_4;
  or primCall (id_6, id_3, id_8, id_9, id_4, id_7, id_5, id_1);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_9,
      id_4,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1,
      id_9,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1,
      id_7,
      id_5,
      id_9,
      id_7,
      id_5,
      id_5,
      id_4,
      id_3
  );
  always @(negedge id_8) begin : LABEL_0
    id_6 = id_6;
  end
  assign id_1 = id_9;
endmodule
