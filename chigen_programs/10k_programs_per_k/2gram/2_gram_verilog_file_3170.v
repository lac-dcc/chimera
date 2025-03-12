// Seed: 2429465314
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_11;
  wire id_12;
endmodule
module module_1 #(
    parameter id_1 = 32'd8,
    parameter id_3 = 32'd58
) (
    _id_1,
    id_2,
    _id_3,
    id_4
);
  output wire id_4;
  output wire _id_3;
  output wire id_2;
  input wire _id_1;
  struct packed {
    logic [-1 : -1] id_5;
    logic [id_3  ==  -1 'd0 : -1] id_6;
    logic id_7;
  } [id_1 : (  -1  )] id_8 = id_8.id_5;
  logic id_9;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_9,
      id_5,
      id_8,
      id_6,
      id_8,
      id_7,
      id_5,
      id_8
  );
  logic id_10, id_11;
  assign id_4 = id_11;
endmodule
