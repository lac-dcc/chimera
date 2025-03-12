// Seed: 4067293032
module module_0 (
    id_1
);
  input logic [7:0] id_1;
  uwire id_2;
  assign id_2 = 1;
  assign id_2 = id_1;
  logic id_3;
  parameter id_4 = 1;
  always id_3 = -1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_4;
  module_0 modCall_1 (id_4);
  assign modCall_1.id_3 = 0;
  assign id_4 = id_1;
  always id_4[1] <= id_4;
  logic id_6, id_7;
  assign id_7 = (id_6#(
      .id_3(-1),
      .id_2(1),
      .id_1(1)
  ));
endmodule
