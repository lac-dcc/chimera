// Seed: 3910744031
macromodule module_0 (
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
    id_13
);
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_7;
  id_14(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_6), .id_4(id_8)
  );
  wire id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_8();
  assign id_7 = $display(-1, id_7);
  wire id_9;
  assign id_5 = id_7;
  initial id_7 <= 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_9,
      id_6,
      id_2
  );
  assign id_4 = id_6;
endmodule
