// Seed: 3890935374
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[1 :-1'b0],
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
    id_29,
    id_30
);
  input wire id_30;
  inout wire id_29;
  output wire id_28;
  output wire id_27;
  input wire id_26;
  input wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd90,
    parameter id_4  = 32'd24
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire _id_11;
  inout wire id_10;
  output wire id_9;
  inout tri0 id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire _id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  logic id_16;
  ;
  assign id_4 = ~id_11;
  assign id_2[{1}][-1 : id_4?id_11 : id_4] = id_15;
  assign id_8 = id_16 - id_15;
  logic id_17;
  ;
  module_0 modCall_1 (
      id_17,
      id_14,
      id_16,
      id_5,
      id_2,
      id_3,
      id_8,
      id_5,
      id_16,
      id_17,
      id_3,
      id_8,
      id_6,
      id_15,
      id_10,
      id_10,
      id_1,
      id_3,
      id_8,
      id_7,
      id_3,
      id_15,
      id_8,
      id_7,
      id_7,
      id_15,
      id_16,
      id_5,
      id_17,
      id_14
  );
  wire id_18, id_19;
endmodule
