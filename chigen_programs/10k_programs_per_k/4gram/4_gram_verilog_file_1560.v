// Seed: 1411274840
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
    access,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  input wire id_27;
  output wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic module_0;
  ;
  logic id_28;
endmodule
module module_1 (
    id_1,
    id_2
);
  output reg id_2;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  inout wire id_1;
  always @(posedge 1'b0 or posedge ~id_1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= id_1;
    end else disable id_3;
  end
  buf primCall (id_2, id_1);
endmodule
