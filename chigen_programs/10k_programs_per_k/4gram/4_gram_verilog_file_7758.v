// Seed: 2664157192
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
    id_22
);
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output tri id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_16 = -1'b0 ? id_19 : 1;
  id_23 :
  assert property (@(posedge id_14) !id_10)
  else $clog2(4);
  ;
  assign id_12 = id_8;
  generate
    wire id_24, id_25;
  endgenerate
endmodule
module module_1 #(
    parameter id_2 = 32'd36,
    parameter id_4 = 32'd6
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5
);
  inout wire id_5;
  output wire _id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  logic [id_2 : (  1  &  id_4  )] id_6;
  ;
  assign id_1[-1] = -1 ? 1 - -1 : 1;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_3,
      id_5,
      id_6,
      id_5,
      id_6,
      id_6,
      id_3,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_6,
      id_5
  );
endmodule
