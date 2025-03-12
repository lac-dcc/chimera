// Seed: 2702987197
module module_1 (
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
    module_0
);
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_16;
  logic id_17 = id_16;
endmodule
module module_1 #(
    parameter id_10 = 32'd17,
    parameter id_3  = 32'd54,
    parameter id_4  = 32'd73
) (
    id_1,
    id_2,
    _id_3,
    _id_4
);
  input wire _id_4;
  input wire _id_3;
  input wire id_2;
  output logic [7:0] id_1;
  parameter id_5 = 1;
  localparam id_6 = id_5[-1];
  logic id_7 = 1'h0 == 1'b0;
  wire [id_3 : -1] id_8;
  logic [1 : (  id_3  )] id_9;
  wire _id_10, id_11;
  wire id_12;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_9,
      id_6,
      id_2,
      id_7,
      id_11,
      id_8,
      id_12,
      id_9,
      id_6,
      id_6,
      id_11,
      id_2
  );
  struct packed {
    logic id_13;
    logic [id_10 : id_4] id_14;
  } id_15;
  ;
  logic [-1 'b0 : 1] id_16;
endmodule
