// Seed: 3608255646
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
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  tri0 id_17, id_18 = id_3;
  supply1 id_19;
  tri0 id_20;
  assign id_19 = 1;
  pmos (1 + id_10);
  for (id_21 = 1'b0; {1, id_13, !id_21}; id_19 = (id_20)) genvar id_22;
  always if (1) id_6 = 1;
  assign id_17 = (id_20);
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input tri1 id_2,
    output uwire id_3,
    input logic id_4,
    output tri1 id_5,
    output logic id_6,
    input uwire id_7,
    output tri id_8,
    output supply1 id_9,
    input supply1 id_10,
    input wand id_11,
    input uwire id_12,
    output uwire id_13,
    input wire id_14
);
  always_latch if (1 == 1'b0) id_6 <= id_4;
  wand id_16, id_17 = 1, id_18;
  id_19(
      1
  );
  module_0 modCall_1 (
      id_18,
      id_17,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18,
      id_17,
      id_16,
      id_18,
      id_17,
      id_18,
      id_16,
      id_17,
      id_16,
      id_17
  );
endmodule
