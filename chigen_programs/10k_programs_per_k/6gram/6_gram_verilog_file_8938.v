// Seed: 2283994794
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
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_11[1] = id_14;
endmodule
module module_1 #(
    parameter id_0 = 32'd80,
    parameter id_2 = 32'd86
) (
    input tri0 _id_0,
    output supply1 id_1,
    input tri1 _id_2,
    output wand id_3
);
  logic [id_0 : -1] id_5;
  ;
  wire [-1 : 1] id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  always @(negedge id_2) begin : LABEL_0
    id_5[id_2] <= id_2;
  end
endmodule
