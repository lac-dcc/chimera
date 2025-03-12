// Seed: 3382754762
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  not primCall (id_1, id_3);
  output wire id_2;
  module_0 modCall_1 (id_4);
  inout wire id_1;
  integer [1 : ""] id_6 = -1;
endmodule
module module_2 #(
    parameter id_5 = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  input wire id_6;
  input wire _id_5;
  output reg id_4;
  inout wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  always_latch id_4 <= id_1[id_5] <-> (1'h0);
  module_0 modCall_1 (id_6);
endmodule
