// Seed: 2614056759
macromodule module_0 (
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
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  input wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout logic [7:0] id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_14[1] = 1;
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
  output wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_2,
      id_14,
      id_4,
      id_7,
      id_12,
      id_2,
      id_2,
      id_4,
      id_7,
      id_5,
      id_4,
      id_2,
      id_3,
      id_7,
      id_8,
      id_4,
      id_6,
      id_4,
      id_1,
      id_4,
      id_7,
      id_2
  );
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output reg id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5[1 :-1'b0] = -1'b0;
  always @(negedge id_13) id_11 = -1;
endmodule
