// Seed: 387829684
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
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_0 #(
    parameter id_14 = 32'd30
) (
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
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire _id_14;
  input wire id_13;
  inout tri0 id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  bit id_19;
  module_0 modCall_1 (
      id_17,
      id_18,
      id_1,
      id_2,
      id_2,
      id_15,
      id_15,
      id_11,
      id_12,
      id_11
  );
  wire id_20;
  assign id_8[{-1*module_1, id_14+""}] = 1 ? 1'b0 : 1'b0;
  always_latch @(posedge -1 or id_14) begin : LABEL_0
    id_19 = -1;
  end
  assign id_12 = 1'b0;
  parameter id_21 = 1;
  assign id_5 = !(id_10);
  xnor primCall (id_11, id_2, id_1, id_15, id_10, id_7, id_12, id_3, id_17, id_16, id_13);
endmodule
