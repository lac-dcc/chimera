// Seed: 1469051447
module module_0 #(
    parameter id_9 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wor id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  integer _id_9;
  localparam id_10 = -1'b0;
  logic [7:0][id_9 : 1  ||  1] id_11 = 1;
  wire id_12, id_13;
  localparam id_14 = id_10;
  assign id_6 = 1;
  wire [-1 : -1 'b0] id_15;
  always $clog2(36);
  ;
  logic id_16 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_11,
      id_9,
      id_7,
      id_2,
      id_11,
      id_8
  );
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always id_4[id_5] <= id_1 ? id_9 : id_3;
endmodule
