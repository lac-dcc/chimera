// Seed: 1356981564
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd4
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  output wire id_3;
  input wire id_2;
  inout wire _id_1;
  assign id_6 = id_4[id_1];
  module_0 modCall_1 (
      id_9,
      id_2,
      id_6,
      id_2,
      id_8,
      id_6,
      id_9,
      id_8
  );
endmodule
