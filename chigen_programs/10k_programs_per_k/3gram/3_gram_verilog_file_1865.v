// Seed: 3671177049
module module_0 #(
    parameter id_6 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  assign module_1._id_1 = 0;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[id_6 : id_6] = id_2;
endmodule
module module_1 #(
    parameter id_1 = 32'd93,
    parameter id_4 = 32'd56,
    parameter id_6 = 32'd11
) (
    input wor  id_0,
    input wire _id_1,
    input wire id_2,
    input tri0 id_3,
    input wand _id_4
);
  parameter id_6 = -1'd0;
  logic [7:0][(  id_4  ) : 1] id_7;
  assign id_7[1] = 1;
  wire id_8;
  wire id_9;
  logic [id_6 : id_1] id_10 = id_2;
  module_0 modCall_1 (
      id_9,
      id_8,
      id_7,
      id_10,
      id_8,
      id_6,
      id_10,
      id_8
  );
endmodule
