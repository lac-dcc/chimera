// Seed: 731260105
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
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout supply1 id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4 (1),
        .id_5 (-1),
        .id_6 (1),
        .id_7 (1),
        .id_8 (1),
        .id_9 (1),
        .id_10(1),
        .id_11(1)
    ),
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_15,
      id_1,
      id_14,
      id_7,
      id_12,
      id_4,
      id_15,
      id_16
  );
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_17;
  ;
  assign id_14 = 1;
  assign id_5[-1'b0*-1][1'd0] = {1, -1, id_7 ? 1 <-> id_2 : -1, 1};
endmodule
