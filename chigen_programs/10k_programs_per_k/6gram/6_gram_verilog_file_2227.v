// Seed: 1538131221
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_6, id_7, id_8, id_9;
  wire id_10;
  assign id_9[1] = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd2
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
    _id_11
);
  input wire _id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_9,
      id_9
  );
  output wire id_2;
  input wire id_1;
  assign id_9 = id_4[id_11];
  logic id_12;
endmodule
