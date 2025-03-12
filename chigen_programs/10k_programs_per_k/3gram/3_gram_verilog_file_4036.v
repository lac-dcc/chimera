// Seed: 2350573955
module module_0 #(
    parameter id_17 = 32'd64,
    parameter id_7  = 32'd69,
    parameter id_8  = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17
);
  input wire _id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output tri1 id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire _id_8;
  input wire _id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_18 = -1;
  logic [1 : id_17  &  id_7] id_19;
  ;
  logic [id_8 : 1] id_20[1 : -1];
  wire id_21;
  assign id_13 = -1;
  logic id_22;
endmodule
module module_1 #(
    parameter id_10 = 32'd8,
    parameter id_14 = 32'd35
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire _id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  localparam id_14 = 1;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_8,
      id_5,
      id_13,
      id_13,
      id_14,
      id_14,
      id_12,
      id_5,
      id_5,
      id_5,
      id_13,
      id_5,
      id_8,
      id_7,
      id_14
  );
  wire id_15;
  always_comb @(posedge -1'b0) id_1[1 : id_10] <= id_2;
  wire [(  id_14  ) : -1] id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23;
endmodule
