// Seed: 42830948
module module_0 #(
    parameter id_17 = 32'd53,
    parameter id_7  = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire _id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire [1 'b0 : id_7] _id_17, id_18;
  localparam id_19 = (-1);
  wire [-1 'h0 : id_17] id_20;
  logic [7:0][-1] id_21;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd51,
    parameter id_18 = 32'd49,
    parameter id_19 = 32'd10,
    parameter id_5  = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4[id_12 :-1],
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output logic [7:0] id_16;
  input wire id_15;
  input wire id_14;
  inout tri1 id_13;
  input wire _id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire _id_5;
  input logic [7:0] id_4;
  output reg id_3;
  output wire id_2;
  input wire id_1;
  localparam id_17 = 1;
  parameter id_18 = id_17;
  assign id_13.id_1 = -1;
  assign id_10 = $unsigned(id_18);
  ;
  logic _id_19;
  ;
  wire id_20;
  wire id_21;
  module_0 modCall_1 (
      id_17,
      id_20,
      id_11,
      id_20,
      id_20,
      id_21,
      id_18,
      id_11,
      id_13,
      id_11,
      id_20,
      id_17,
      id_17,
      id_20,
      id_11,
      id_13
  );
  assign id_21 = $unsigned(id_18);
  ;
  parameter id_22 = id_18;
  wire [id_19  .  id_5  |  -1  + $realtime : -1] id_23, id_24;
  logic id_25;
  always_ff begin : LABEL_0
    id_3 = id_1;
  end
  assign id_3 = id_25;
  assign id_16[id_18] = -1 !=? -1;
endmodule
