// Seed: 2865048449
module module_0 #(
    parameter id_1 = 32'd54
) (
    _id_1,
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
    id_17
);
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output supply1 id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire _id_1;
  logic id_18, id_19;
  assign id_13 = -1;
  always @(posedge 1) id_6[id_1] = id_14;
  initial begin : LABEL_0
    id_19 <= id_12;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd71
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  parameter id_10 = 1;
  tri id_11;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_11,
      id_11,
      id_7,
      id_2,
      id_11,
      id_4,
      id_11,
      id_11,
      id_11,
      id_8,
      id_4,
      id_3,
      id_8,
      id_4,
      id_11
  );
  assign modCall_1.id_1 = 0;
  parameter id_12 = id_10;
  assign id_11 = id_2["" : id_10];
  wire id_13;
  ;
  assign id_11 = -1;
  wire [id_10 : -1] id_14;
  logic id_15;
  ;
  wire id_16;
endmodule
