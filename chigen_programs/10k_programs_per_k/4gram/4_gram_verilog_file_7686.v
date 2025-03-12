// Seed: 1577609889
module module_0 #(
    parameter id_11 = 32'd0,
    parameter id_2  = 32'd40,
    parameter id_6  = 32'd80,
    parameter id_7  = 32'd74
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12
);
  output wire id_12;
  inout wire _id_11;
  inout wire id_10;
  input wire id_9;
  assign module_1.id_0 = 0;
  output wire id_8;
  inout wire _id_7;
  inout wire _id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  wire [id_11 : id_7] id_13;
  struct packed {
    logic [module_0[id_2] : -1] id_14;
    id_15 id_16;
  } [id_6 : id_7] id_17 = id_2 - id_4;
endmodule
module module_1 #(
    parameter id_0 = 32'd62,
    parameter id_4 = 32'd28,
    parameter id_6 = 32'd87
) (
    input  tri1 _id_0,
    input  tri  id_1,
    output wand id_2,
    output wire id_3,
    input  tri  _id_4
);
  parameter [id_4 : id_0] id_6 = 1;
  wire  id_7;
  defparam id_6.id_6 = 1;
  logic id_8 = 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_8,
      id_8,
      id_6,
      id_6,
      id_7,
      id_8,
      id_8,
      id_6,
      id_8
  );
  assign id_3 = -1;
endmodule
