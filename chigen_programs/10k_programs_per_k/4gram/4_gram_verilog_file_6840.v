// Seed: 1394146641
module module_0 #(
    parameter id_1 = 32'd32,
    parameter id_5 = 32'd61
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input logic [7:0] id_6;
  assign module_1.id_2 = 0;
  input wire _id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wire _id_1;
  genvar id_9;
  assign id_4[-1] = "" ? (-id_2[id_5]) : id_6[-1 : id_1] ? id_2 : 1;
  parameter id_10 = 1 ^ 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd29,
    parameter id_2 = 32'd46,
    parameter id_6 = 32'd90
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  inout logic [7:0] id_3;
  inout wire _id_2;
  output wire _id_1;
  wire id_5;
  ;
  assign id_1 = id_3;
  wire _id_6;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_5,
      id_3,
      id_6,
      id_3,
      id_5,
      id_5
  );
  assign id_5 = id_4[1'b0];
  wire id_7;
  wire id_8;
  logic [-1  *  id_1 : id_6] id_9;
  ;
endmodule
