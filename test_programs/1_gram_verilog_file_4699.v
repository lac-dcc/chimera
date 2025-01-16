// Seed: 195433534
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
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_16 = ~id_4;
  genvar id_17;
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
    id_11
);
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_12(
      .id_0(1), .id_1(id_13), .id_2(id_10), .id_3(id_10 & -1'b0 + 1)
  );
  assign id_12 = id_7;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_2,
      id_6,
      id_4,
      id_4,
      id_9,
      id_2,
      id_2,
      id_2,
      id_11,
      id_10,
      id_10,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
