// Seed: 790715598
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
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13, id_14, id_15;
  wire id_16;
  assign id_13 = id_16;
  logic [7:0][-1 : 1] id_17 (-1);
  assign id_8 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(
        .id_8 (id_7),
        .id_9 (id_9[1][1]),
        .id_10(-1),
        .id_11(id_7),
        .id_12(1 + 1)
    )
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  localparam id_13 = id_7;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_5,
      id_5,
      id_2,
      id_13,
      id_13,
      id_13,
      id_4,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_8 = 0;
  wire id_14;
endmodule
