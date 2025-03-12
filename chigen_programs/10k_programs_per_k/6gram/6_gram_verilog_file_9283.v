// Seed: 2890202660
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
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_1[-1] = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd71
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire _id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_10,
      id_10,
      id_8
  );
  input wire id_1;
  logic [7:0] id_11;
  assign id_11[-1 :-1] = !id_10;
  wire id_12;
  wire id_13;
  ;
  assign id_13 = -1 || id_4[id_5];
endmodule
