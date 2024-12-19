// Seed: 252605992
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  final $display;
  assign id_2 = (id_5) * id_1;
  logic [7:0] id_8, id_9;
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(1),
      .id_2(),
      .id_3(),
      .id_4(1),
      .id_5(id_6 == id_4),
      .id_6(1),
      .id_7(1),
      .id_8(1),
      .id_9(),
      .id_10(1),
      .id_11(id_5),
      .id_12(id_8[1] - id_5),
      .id_13(1)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_1 = id_3[1] == 1'd0;
  logic [7:0] id_4;
  assign id_4[1] = 1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
