// Seed: 1635059723
module module_0 (
    id_1,
    id_2[-1 : 1],
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output tri id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  assign id_12 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd5,
    parameter id_2  = 32'd60,
    parameter id_5  = 32'd4
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6[1 : id_2]
);
  input logic [7:0] id_6;
  inout wire _id_5;
  input wire id_4;
  inout wire id_3;
  output wire _id_2;
  output wire id_1;
  assign id_5 = id_6;
  wire id_7;
  wire id_8;
  struct packed {logic id_9;} id_10;
  ;
  assign id_5 = id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_10,
      id_9,
      id_4,
      id_9,
      id_7,
      id_10,
      id_8,
      id_3,
      id_9,
      id_1
  );
  logic [7:0] id_11;
  always $clog2(id_5);
  ;
  logic _id_12;
  ;
  wire id_13[&  1 : id_12];
  ;
endmodule
