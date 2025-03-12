// Seed: 3780429290
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
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = id_28;
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    input  wire  id_2,
    input  wire  id_3,
    input  tri0  id_4,
    output logic id_5
    , id_11,
    output logic id_6,
    input  wor   id_7,
    inout  tri0  id_8,
    input  wand  id_9
);
  localparam id_12 = -1;
  wire id_13;
  assign id_8 = id_2;
  generate
    always @(posedge id_3) if (1'b0) id_5 <= 1;
  endgenerate
  wire id_14;
  bit [1 : 1] id_15;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_12,
      id_14,
      id_13,
      id_12,
      id_14,
      id_12,
      id_12,
      id_13,
      id_14,
      id_13,
      id_13,
      id_13,
      id_12,
      id_12,
      id_14,
      id_13,
      id_13,
      id_14,
      id_13,
      id_13,
      id_14,
      id_13,
      id_14,
      id_13,
      id_12,
      id_13
  );
  initial begin : LABEL_0
    #1 id_6 <= 1;
    if (-1) id_15 = -1;
    id_0 <= 1;
    id_5 <= id_14;
    if (id_12) deassign id_13;
    assign id_15 = id_8;
  end
  assign id_8 = id_11[-1];
endmodule
