// Seed: 2673708050
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = -1;
  id_5(
      .id_0(id_2),
      .id_1(1),
      .id_2(1),
      .id_3(id_1),
      .id_4(1),
      .id_5(1 == -1),
      .id_6(-1),
      .id_7(id_1),
      .id_8(id_3),
      .id_9(id_2),
      .id_10(id_4 & 1),
      .id_11(1),
      .sum(-1)
  );
  bit id_6, id_7, id_8;
  always id_6 <= id_7;
  assign module_1.id_10 = 0;
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
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
  wire id_14;
  supply1 id_15, id_16;
  wire id_17, id_18;
  module_0 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_4
  );
  assign id_16 = 1'b0;
  nor primCall (
      id_4, id_15, id_18, id_17, id_9, id_6, id_13, id_10, id_7, id_1, id_5, id_16, id_11, id_14
  );
  reg id_19, id_20, id_21;
  always id_19 <= id_10;
endmodule
