// Seed: 1446433985
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 (1),
        .id_8 (1'b0),
        .id_9 (1),
        .id_10(1'b0 || 1'b0),
        .id_11(1)
    ),
    id_12,
    id_13,
    id_14
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_15;
  assign id_6 = {1'b0 - id_14{1 * 1}};
  id_16(
      .id_0(1)
  ); id_17(
      .id_0(1), .id_1(id_13)
  );
  assign module_1.id_4 = 0;
  final id_11 = (id_12);
  wire id_18;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  wire id_3, id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3
  );
  assign id_3 = id_2;
  assign id_1 = id_2;
  wire id_5;
endmodule
