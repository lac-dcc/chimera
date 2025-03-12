// Seed: 1143022561
module module_0 #(
    parameter id_4 = 32'd73
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  parameter id_4 = 1;
  logic [7:0] id_5;
  assign id_1[id_4] = -1'b0 - 1;
  assign id_1 = id_5[-1==id_4];
endmodule
module module_1 #(
    parameter id_3 = 32'd95
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  inout logic [7:0] id_4;
  inout wire _id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
  output wire id_1;
  assign id_1 = id_4[id_3+-1];
endmodule
