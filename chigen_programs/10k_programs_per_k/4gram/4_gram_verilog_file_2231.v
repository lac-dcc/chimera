// Seed: 2671240387
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
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_17(
      .id_0(1 * 1), .id_1(id_9), .id_2(id_8), .id_3(id_1)
  );
  tri1 id_18;
  supply0 id_19;
  assign id_2  = id_8;
  assign id_18 = 1 + id_3 ? id_13 & 1'b0 & 1 & 1 : 1 * id_14 - id_19;
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4 = id_4;
  id_5(
      .id_0(~(id_1 * id_1 ? 1 : 1)), .id_1(1), .id_2(1), .id_3(id_1), .id_4(id_1)
  );
  wire id_6;
  assign id_2[1] = 1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_6,
      id_3,
      id_6,
      id_6,
      id_1,
      id_3,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_18 = 0;
endmodule
