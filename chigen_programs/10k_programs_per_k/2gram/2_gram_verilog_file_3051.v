// Seed: 411941856
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_11 = (1'b0);
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
    id_18,
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_22;
  wire id_23;
  wire id_24;
  always @(1) disable id_25;
  always @(1'b0 or posedge id_19 == id_14);
  assign id_12 = 1'b0;
  xnor primCall (
      id_17,
      id_7,
      id_25,
      id_3,
      id_9,
      id_8,
      id_15,
      id_22,
      id_12,
      id_26,
      id_23,
      id_27,
      id_2,
      id_21,
      id_28,
      id_24,
      id_19,
      id_20,
      id_10,
      id_14,
      id_6
  );
  assign id_12 = 1;
  wire id_26;
  wire id_27;
  tri  id_28;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_26,
      id_26,
      id_10,
      id_6,
      id_22,
      id_3,
      id_21,
      id_28,
      id_27,
      id_25
  );
  id_29 :
  assert property (@(id_28) 1)
  else;
endmodule
