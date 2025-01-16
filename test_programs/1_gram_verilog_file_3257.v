// Seed: 604396386
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
    id_10#(.id_11(1)),
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_18, id_19;
  assign id_1 = id_18;
  id_20(
      .id_0(id_7 - 1), .id_1(-1), .id_2(id_4), .id_3(-1), .id_4('b0)
  );
  wire id_21;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4
  );
  wire id_5, id_6, id_7;
  id_8(
      .id_0(1), .id_1(id_5)
  );
endmodule
