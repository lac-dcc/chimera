// Seed: 3395888582
module module_0 #(
    parameter id_3 = 32'd26,
    parameter id_9 = 32'd40
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  inout wire _id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  logic id_10 [id_9 : id_3];
  wire  id_11;
endmodule
module module_1 #(
    parameter id_7 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_5 = (id_2);
  wire  id_6;
  parameter integer id_7 = -1'b0;
  logic [7:0][id_7] id_8;
  assign id_1 = id_6 & id_7 != id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_1,
      id_4,
      id_2,
      id_6,
      id_6,
      id_7
  );
  always id_5[-1] <= id_6 * 1 & id_7;
endmodule
