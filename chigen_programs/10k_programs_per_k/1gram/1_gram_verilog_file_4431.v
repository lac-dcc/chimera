// Seed: 3512453539
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4(-1),
        .id_5(-1),
        .id_6(1'd0 - id_7)
    ),
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_7;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_4
  );
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  assign id_3[(1)?-1 : 1][1][-1] = (id_4 | id_9[-1'b0]);
endmodule
