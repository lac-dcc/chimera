// Seed: 630941563
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  id_8(
      .id_0(id_1), .id_1(1'b0), .id_2(1), .id_3(id_3), .id_4(1)
  );
  assign id_1 = id_8;
  assign id_6 = id_3;
  wire id_9 = id_4;
endmodule
module module_1 (
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
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7 = id_17;
  id_20(
      .product(1), .id_0(id_17 & ~id_6 == id_3)
  );
  wor  id_21 = id_9 ? (id_12[1'b0]) : id_14;
  wire id_22;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_10,
      id_4,
      id_1
  );
  always force id_18 = 1 == id_21;
  assign id_5 = id_20;
endmodule
