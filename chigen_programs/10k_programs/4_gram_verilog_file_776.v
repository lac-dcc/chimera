// Seed: 3319669885
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
    module_0
);
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  wire id_13;
  wire id_14, id_15;
  always force id_14 = 1'd0;
  wire id_16;
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
    id_19,
    id_20
);
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  id_21(
      .id_0((id_8)), .id_1(1), .id_2(1), .sum(1 | id_20)
  );
  nor (
      id_16,
      id_21,
      id_11,
      id_4,
      id_17,
      id_20,
      id_7,
      id_15,
      id_9,
      id_19,
      id_2,
      id_10,
      id_18,
      id_6,
      id_5,
      id_8,
      id_3
  );
  module_0(
      id_18, id_16, id_7, id_8, id_9, id_8, id_15, id_13, id_15, id_17, id_15, id_16
  );
  always #1 id_19 = #(1) id_3;
endmodule
