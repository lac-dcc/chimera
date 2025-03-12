// Seed: 3848210103
module module_0 #(
    parameter id_2 = 32'd50,
    parameter id_5 = 32'd62,
    parameter id_6 = 32'd82,
    parameter id_9 = 32'd99
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10
);
  output wire id_10;
  input wire _id_9;
  output wire id_8;
  output wire id_7;
  inout wire _id_6;
  inout wire _id_5;
  output wire id_4;
  output logic [7:0] id_3;
  inout wire _id_2;
  inout wire id_1;
  logic [1 : 1] id_11;
  logic [7:0][id_9 : id_6] id_12;
  assign id_1 = id_6;
  wire id_13;
  assign id_8 = id_9;
  assign id_3[id_5] = id_11;
  assign #(1) id_12[id_2] = id_2;
  parameter id_14 = (1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  assign #id_5 id_1[-1] = -1'b0;
  wire id_6;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6,
      id_5,
      id_6
  );
endmodule
