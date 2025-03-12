// Seed: 419984265
module module_0 #(
    parameter id_9 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 (-1),
        .id_8 (-1'b0),
        ._id_9(1)
    ),
    id_10,
    id_11
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire [-1 : id_9] id_12, id_13;
  wire id_14, id_15;
  logic id_16, id_17 = id_13 - id_17, id_18;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1
  );
  always id_3 <= 1 || id_2;
endmodule
