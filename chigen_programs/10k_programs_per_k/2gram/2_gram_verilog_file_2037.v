// Seed: 2817625399
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire  id_13;
  logic id_14;
endmodule
module module_1 #(
    parameter id_3 = 32'd62
) (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  inout wire id_1;
  localparam id_3 = 1;
  id_4 :
  assert property (@(-1) id_1)
  else;
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_1
  );
  assign id_2[id_3] = 1;
  uwire id_5 = -1;
endmodule
