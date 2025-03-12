// Seed: 1251001412
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output tri id_2;
  input wire id_1;
  assign id_2 = 'b0;
endmodule
module module_1 #(
    parameter id_4 = 32'd26,
    parameter id_6 = 32'd66,
    parameter id_8 = 32'd84
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire _id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_9,
      id_1,
      id_7,
      id_2
  );
  output wire _id_6;
  inout wire id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_11;
  struct packed {
    logic [1 'b0 : 1 'b0 *  id_8  + ""] id_12;
    logic [id_4 : 1] id_13;
  } [-1 : id_6] id_14 = 1'b0;
endmodule
