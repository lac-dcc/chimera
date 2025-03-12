// Seed: 3429287018
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic [-1 'h0 : -1] id_7;
endmodule
module module_1 #(
    parameter id_10 = 32'd87,
    parameter id_17 = 32'd59,
    parameter id_20 = 32'd65,
    parameter id_23 = 32'd67
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    _id_20,
    id_21,
    id_22,
    _id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29
);
  input wire id_29;
  inout wire id_28;
  input wire id_27;
  output wire id_26;
  output wire id_25;
  inout wire id_24;
  output wire _id_23;
  inout wire id_22;
  output wire id_21;
  input wire _id_20;
  input wire id_19;
  input wire id_18;
  input wire _id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_3,
      id_22,
      id_24,
      id_14
  );
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire _id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout tri0 id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  struct packed {
    logic [1 'b0 : id_23] id_30;
    logic [id_17 : 1] id_31;
  } [id_20 : id_10] id_32;
  ;
  parameter id_33 = 1;
  integer id_34 = 1;
  assign id_5 = id_19 - id_28;
  always @(posedge id_19) id_32 <= id_27;
  logic id_35;
  wire  id_36;
  if (id_33) wire id_37;
  assign id_36 = id_9;
endmodule
