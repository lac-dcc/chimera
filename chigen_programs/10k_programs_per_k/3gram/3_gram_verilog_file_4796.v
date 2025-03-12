// Seed: 1271035430
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
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_6 = 0;
  wire id_11;
  wire id_12;
  parameter id_13 = {1, 1};
endmodule
module module_1 #(
    parameter id_6 = 32'd18
) (
    output wire  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    input  wand  id_3,
    output tri1  id_4,
    output tri1  id_5,
    input  tri0  _id_6,
    output uwire id_7
);
  assign id_0 = 1;
  parameter id_9 = 1;
  wire [id_6 : -1 'b0] id_10;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_10,
      id_9,
      id_10,
      id_10
  );
  assign id_7 = id_9;
endmodule
