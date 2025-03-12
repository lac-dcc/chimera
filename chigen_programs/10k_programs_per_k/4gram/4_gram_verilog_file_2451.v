// Seed: 56327820
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire _id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire [id_9 : -1] id_14;
  assign id_4[-1] = 1'b0 + id_1;
endmodule
module module_1 #(
    parameter id_17 = 32'd52,
    parameter id_23 = 32'd65
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  inout logic [7:0] id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire _id_17;
  supply0 id_18 = id_18 + id_7;
  wire [1 : -1] id_19;
  wire ["" : 1] id_20;
  logic [id_17 : 1 'h0] id_21;
  generate
    logic id_22 = -1;
  endgenerate
  parameter id_23 = 1;
  wire  id_24;
  logic id_25;
  ;
  xor primCall (
      id_8,
      id_20,
      id_23,
      id_9,
      id_1,
      id_11,
      id_15,
      id_6,
      id_19,
      id_3,
      id_16,
      id_26,
      id_14,
      id_7,
      id_10,
      id_4,
      id_13,
      id_5,
      id_12,
      id_24,
      id_21,
      id_22,
      id_18,
      id_2,
      id_25
  );
  wire id_26;
  assign id_14[1] = 1 - id_4;
  parameter id_27 = id_23 !== -1;
  assign id_4 = id_16;
  module_0 modCall_1 (
      id_21,
      id_21,
      id_4,
      id_14,
      id_8,
      id_21,
      id_22,
      id_8,
      id_23,
      id_24,
      id_10,
      id_8,
      id_27
  );
  defparam id_23.id_23 = id_23;
endmodule
