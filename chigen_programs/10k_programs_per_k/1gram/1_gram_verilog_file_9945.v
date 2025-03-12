// Seed: 4090713563
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
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_14 = 0;
  assign id_12 = id_4 ? -1 : id_22;
  wire id_23;
  ;
  logic id_24;
  ;
  assign id_7 = id_20;
endmodule
module module_1 #(
    parameter id_1  = 32'd61,
    parameter id_14 = 32'd54,
    parameter id_16 = 32'd26,
    parameter id_19 = 32'd59,
    parameter id_5  = 32'd44
) (
    output tri0 id_0,
    output wand _id_1,
    output wand id_2#(.id_4(1), ._id_5(-1))
);
  logic id_6;
  union packed {
    id_7  id_8;
    logic id_9[id_5  <=  id_1 : 1 'b0];
    logic id_10;
    logic id_11;
  } id_12;
  ;
  assign id_1 = id_4;
  wire [-1 : -1] id_13, _id_14;
  parameter id_15 = -1;
  assign id_4 = -1;
  logic _id_16;
  logic id_17;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_4,
      id_9,
      id_6,
      id_13,
      id_11,
      id_15,
      id_10,
      id_17,
      id_9,
      id_13,
      id_11,
      id_12,
      id_6,
      id_17,
      id_13,
      id_17,
      id_13,
      id_12
  );
  assign id_12.id_7 = -1;
  logic id_18;
  ;
  parameter id_19 = -1'b0;
  wire [1 : id_14] id_20[id_19 : 1], id_21;
  parameter id_22 = -1 ^ id_15;
  wire [1 : -1 'b0] id_23, id_24[-1 'h0 : id_16];
  generate
    wire [id_5 : -1] id_25;
  endgenerate
endmodule
