// Seed: 2128470726
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
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @(id_11) release id_12[1-1 : 1];
endmodule
module module_1 #(
    parameter id_6 = 32'd59
) (
    output logic id_0,
    input uwire id_1,
    input tri0 id_2
    , id_8,
    output supply1 id_3,
    input tri id_4,
    output tri0 id_5,
    output tri1 _id_6
);
  logic id_9;
  logic [1 : (  id_6  )] id_10;
  wire id_11 = id_9;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_9,
      id_9,
      id_8,
      id_10,
      id_10,
      id_10,
      id_9,
      id_8,
      id_11,
      id_11,
      id_11,
      id_9,
      id_11,
      id_8,
      id_11,
      id_8,
      id_10,
      id_11,
      id_10
  );
  logic id_12;
  ;
  assign id_3 = id_10;
  initial id_0 = id_12;
  logic id_13;
  parameter id_14 = -1'b0;
  parameter id_15 = -1'b0;
  reg id_16;
  ;
  wand id_17 = id_10 <= -1'b0;
  assign id_12 = 1 ? id_9 : -1;
  always @(1) begin : LABEL_0
    id_16 = -1;
  end
endmodule
