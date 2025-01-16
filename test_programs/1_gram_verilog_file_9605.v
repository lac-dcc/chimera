// Seed: 4155813583
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_8(
      .id_0(1), .id_1(1)
  );
  wire id_9;
  wire id_10;
  assign id_1 = id_2;
  wire id_11;
  wire id_12;
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
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  assign id_8 = 1;
  nor primCall (
      id_8,
      id_14,
      id_1,
      id_11,
      id_12,
      id_16,
      id_17,
      id_6,
      id_9,
      id_5,
      id_7,
      id_3,
      id_13,
      id_15,
      id_4,
      id_2,
      id_10
  );
  wire id_10;
  assign id_2 = 1;
  assign id_4 = -1 | id_7;
  wire id_11, id_12 = id_5;
  wire id_13;
  wire id_14 = id_1, id_15, id_16, id_17;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_3,
      id_5,
      id_10,
      id_4,
      id_8
  );
  always deassign id_9;
  wire id_18, id_19, id_20, id_21, id_22, id_23;
  assign id_8 = -1;
endmodule
