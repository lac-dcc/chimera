// Seed: 160859024
module module_0 (
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
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_10 = id_10;
  assign id_4[1] = id_5;
  assign id_5 = id_3;
endmodule
module module_1 #(
    parameter id_4 = 32'd4,
    parameter id_5 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  output logic [7:0] id_6;
  input wire _id_5;
  input wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  tri1 [-1 : id_4] id_9 = (-1) || -1 || ~id_8;
  assign id_9 = id_3[id_5] ? 1'b0 : 1'b0 ? id_2 : ~id_4;
  parameter id_10 = 1;
  assign id_6[id_4==-1'b0] = id_4;
  tri0 id_11 = -1;
  assign id_11 = -1;
  assign id_11 = id_11 ? 1'b0 - id_9 : id_9 & id_9;
endmodule
