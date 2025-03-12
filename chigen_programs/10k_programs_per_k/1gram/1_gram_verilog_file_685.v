// Seed: 2325535078
program module_0 (
    id_1,
    id_2#(.sum(1)),
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_6;
  wire id_10, id_11, id_12, id_13;
  localparam id_14 = 1'b0;
  wire id_15;
  assign id_8 = "" - 1 | 1;
  assign id_8 = -1'h0;
endprogram
module module_1 #(
    parameter id_2 = 32'd28,
    parameter id_3 = 32'd43,
    parameter id_4 = 32'd11
) (
    id_1,
    _id_2[id_4 :-1],
    _id_3,
    _id_4[id_4==id_3 : id_2]
);
  input logic [7:0] _id_4;
  input wire _id_3;
  output logic [7:0] _id_2;
  output wire id_1;
  logic id_5;
  ;
  logic [id_3 : id_4] id_6;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6
  );
  wire  id_7;
  logic id_8 = "";
  wire  id_9;
  assign id_5 = 1;
  parameter id_10 = 1;
  wire id_11;
  ;
endmodule
