// Seed: 981038881
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
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_15;
  assign id_5 = 1;
  wire id_16;
  wire id_17;
  assign module_1.id_4 = 0;
  initial #1 $display;
endmodule
module module_1 (
    output uwire id_0,
    output wand  id_1
);
  wire id_3;
  supply0 id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_3 = id_3;
  id_5(
      .id_0(1'b0),
      .id_1(1),
      .id_2(id_4),
      .id_3(id_3),
      .id_4(id_1),
      .id_5({~id_1, id_1}),
      .id_6(id_1),
      .id_7(id_0 != id_4),
      .id_8(1),
      .id_9(id_6),
      .id_10(id_0),
      .id_11(id_0),
      .id_12(1)
  );
endmodule
