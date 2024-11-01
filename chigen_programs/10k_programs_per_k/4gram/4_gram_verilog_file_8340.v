// Seed: 3776081723
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  integer id_12;
  assign id_12 = id_10 && id_11 ? id_10 : id_5 ? 1 : (id_8);
  id_13(
      .id_0(1), .sum(1'b0), .id_1(id_6), .id_2(1), .id_3(1), .id_4(id_6), .id_5(1)
  );
  generate
    wire id_14;
  endgenerate
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_10[1'b0];
  nand (id_3, id_16, id_15, id_2, id_8, id_1, id_10, id_11, id_7, id_4, id_14, id_9);
  module_0(
      id_6, id_11, id_15, id_5, id_14, id_3, id_12, id_4, id_15, id_16, id_13
  );
  wire id_17;
  wire id_18;
  assign id_16 = 1'b0;
endmodule
