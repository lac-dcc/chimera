// Seed: 1838126864
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  wire [-1 : -1] id_9;
endmodule
module module_0 #(
    parameter id_23 = 32'd13,
    parameter id_27 = 32'd61
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
    module_1,
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
    _id_23,
    id_24,
    id_25,
    id_26,
    _id_27
);
  inout wire _id_27;
  input logic [7:0] id_26;
  output wire id_25;
  input wire id_24;
  input wire _id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  input logic [7:0] id_17;
  input wire id_16;
  inout wire id_15;
  inout tri0 id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_28;
  assign id_4 = id_17[id_23];
  logic [id_27 : -1] id_29;
  ;
  assign id_4  = id_4;
  assign id_25 = id_17;
  assign id_14 = -1;
  parameter id_30 = 1;
  wire [1 : -1] id_31;
  wire id_32;
  ;
  logic id_33;
  module_0 modCall_1 (
      id_8,
      id_30,
      id_21,
      id_25,
      id_30,
      id_7,
      id_29
  );
  wire id_34;
  id_35 :
  assert property (@(posedge 1) id_26[-1])
  else $signed(48);
  ;
  assign id_6[(id_27)] = id_4;
endmodule
