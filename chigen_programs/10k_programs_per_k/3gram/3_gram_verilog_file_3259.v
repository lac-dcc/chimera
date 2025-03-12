// Seed: 3979724854
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
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29
);
  input wire id_29;
  input wire id_28;
  output wire id_27;
  input wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  output logic [7:0] id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  assign module_1.id_7 = 0;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_17[-1'b0] = id_1[1 :-1];
endmodule
module module_1 #(
    parameter id_6 = 32'd51,
    parameter id_7 = 32'd97
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7
);
  output wire _id_7;
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  output tri id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
  logic [id_7 : id_7] id_8;
  ;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_5,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_8,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5
  );
  initial
    @(posedge id_1) begin : LABEL_0
      id_8[id_6] <= -1;
    end
  assign id_3 = 1 == id_2;
  wire [1 : 1] id_9;
endmodule
