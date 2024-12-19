// Seed: 4212072179
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_6(
      .id_0(id_5),
      .id_1(id_4),
      .id_2(id_1),
      .id_3(1),
      .id_4(1),
      .id_5(id_1),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_3),
      .id_9(id_5),
      .id_10(1)
  );
  wire id_7 = 1;
  wire id_8;
  id_9(
      .id_0(1), .id_1(1), .id_2(id_2), .id_3(id_1[1])
  );
  wire id_10;
  wire id_11;
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
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[1] = id_1 % 1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_7
  );
endmodule
