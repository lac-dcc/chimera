// Seed: 3373597940
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
    module_0,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_21;
  always @(id_12 or negedge id_12[1]) begin : LABEL_0
    if (1) #1 if (id_15 && id_8) id_17 = (id_11[1 : 1]);
  end
endmodule
module module_1 #(
    parameter id_13 = 32'd82,
    parameter id_4  = 32'd58
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
  wire id_12;
  assign id_2[(1)] = 1;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_7,
      id_7,
      id_7,
      id_10,
      id_11,
      id_6,
      id_11,
      id_11,
      id_2,
      id_2,
      id_6,
      id_12,
      id_3,
      id_6,
      id_11,
      id_7,
      id_3,
      id_11
  );
  assign modCall_1.id_15 = 0;
  wire _id_13;
  always @(posedge "") force id_10[id_4 : id_13] = 1;
endmodule
