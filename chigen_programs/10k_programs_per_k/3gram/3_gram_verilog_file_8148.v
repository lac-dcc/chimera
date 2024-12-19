// Seed: 510845335
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1'h0 - id_8;
  wire id_9;
  wire id_10 = id_5;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_10,
      id_9,
      id_9,
      id_8,
      id_7
  );
  assign id_9 = id_7;
  integer id_11 (
      .id_0(id_5),
      .id_1(1),
      .id_2(id_8),
      .id_3(id_3[1+~1]),
      .id_4(id_1),
      .id_5(id_7),
      .id_6(1),
      .id_7(1),
      .id_8(id_2),
      .id_9(id_9)
  );
endmodule
