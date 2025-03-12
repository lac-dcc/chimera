// Seed: 4462163
module module_0 #(
    parameter id_8 = 32'd11
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire _id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_11;
  assign id_4[(id_8)] = id_5 ~^ 1;
  string id_15 = "";
endmodule
module module_1 #(
    parameter id_2 = 32'd72,
    parameter id_6 = 32'd59
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire _id_6;
  output wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  input wire _id_2;
  input wire id_1;
  wire id_9;
  wire id_10;
  assign #id_11 id_3[id_6 : 1] = id_2;
  logic id_12;
  ;
  assign id_12 = 1'b0;
  module_0 modCall_1 (
      id_10,
      id_12,
      id_4,
      id_3,
      id_4,
      id_1,
      id_7,
      id_11,
      id_10,
      id_10,
      id_10,
      id_12,
      id_12,
      id_10
  );
  assign modCall_1.id_8 = 0;
  logic id_13[1 : -1  &  id_2];
  always disable id_14;
endmodule
