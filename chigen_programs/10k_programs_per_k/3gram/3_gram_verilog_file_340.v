// Seed: 2652164340
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
    id_13
);
  inout wire id_13;
  inout supply0 id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout supply0 id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7  = id_5;
  assign id_7  = id_3 & id_7;
  assign id_12 = -1;
endmodule
module module_1 #(
    parameter id_13 = 32'd88,
    parameter id_6  = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  inout wire _id_13;
  inout wire id_12;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_3,
      id_3,
      id_12,
      id_14,
      id_3,
      id_11,
      id_12,
      id_12,
      id_10,
      id_3,
      id_3
  );
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  output logic [7:0] id_1;
  wire [id_6  &  -1 : -1] id_16;
  wire id_17;
  logic id_18;
  ;
  always @(id_3 or posedge id_14);
  assign id_2[-1] = id_14;
endmodule
