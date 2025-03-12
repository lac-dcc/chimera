// Seed: 2442526554
module module_0 #(
    parameter id_9 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
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
    id_29,
    id_30,
    id_31,
    id_32
);
  inout wire id_32;
  inout wire id_31;
  output wire id_30;
  inout wire id_29;
  inout wire id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire _id_9;
  input wire id_8;
  assign module_1.id_6 = 0;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [id_9 : 1] id_33 = id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd18,
    parameter id_2 = 32'd45,
    parameter id_3 = 32'd83
) (
    _id_1,
    _id_2
);
  inout wire _id_2;
  inout wire _id_1;
  localparam id_3 = 1;
  wire [id_1 : id_2  -  id_3] id_4;
  logic [-1 : 1] id_5;
  ;
  bit id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  always @(id_1 ^ id_5 or posedge id_2) id_6 = id_5[id_2];
  wire id_7;
endmodule
