// Seed: 3570790190
module module_0 #(
    parameter id_24 = 32'd81
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
    id_16,
    module_0,
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wor id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  assign module_1.id_4 = 0;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire  id_21;
  logic id_22;
  wire  id_23;
  wire  _id_24;
  wire  id_25;
  parameter id_26 = 1'b0;
  wire [-1 : id_24] id_27;
  assign id_8 = 1 | 1'b0 ? 1 : id_16;
  logic id_28;
  ;
  logic id_29;
  logic id_30;
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output logic id_3,
    input tri0 id_4,
    output supply0 id_5,
    output logic id_6
);
  parameter id_8 = 1'b0;
  xor primCall (id_5, id_4, id_8, id_1, id_9);
  wire id_9;
  ;
  always @(id_4 > id_1) begin : LABEL_0
    if (id_8) id_6 = id_4;
  end
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_9,
      id_9,
      id_8
  );
  always @(posedge id_9) begin : LABEL_1
    id_3 = id_4;
    disable id_10;
  end
endmodule
