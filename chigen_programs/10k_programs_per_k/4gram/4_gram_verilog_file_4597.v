// Seed: 151428330
module module_0 #(
    parameter id_4 = 32'd19,
    parameter id_7 = 32'd80,
    parameter id_9 = 32'd41
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10
);
  output wire id_10;
  inout wire _id_9;
  inout wire id_8;
  input wire _id_7;
  input wire id_6;
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire [1 'd0 : id_9] id_11;
  assign id_5 = id_11;
  wire id_12;
  wire id_13;
  logic id_14;
  wire [id_4 : id_7] id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd57,
    parameter id_1 = 32'd97,
    parameter id_3 = 32'd37
) (
    output tri1 _id_0,
    input  tri  _id_1
);
  wire _id_3;
  logic [id_0 : id_1] id_4;
  ;
  assign id_3 = id_1;
  assign id_3 = id_4;
  wire [1 : id_3] id_5;
  logic id_6;
  ;
  parameter id_7 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_3,
      id_7,
      id_3,
      id_7
  );
  generate
    assign id_5 = id_1;
  endgenerate
endmodule
