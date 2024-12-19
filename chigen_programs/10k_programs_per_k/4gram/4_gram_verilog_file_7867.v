// Seed: 3964230050
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1[{1{1}}] = id_2;
  assign id_3 = 1'b0;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1[1] = id_2;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_4
  );
  wire id_7;
  id_8(
      .id_0(1'b0),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_7),
      .id_4(1),
      .id_5(id_3),
      .id_6(1'b0),
      .id_7(1),
      .id_8(id_6[1]),
      .id_9(id_1),
      .id_10(id_6)
  );
  tri id_9 = id_2 << 1;
  assign id_3 = "";
endmodule
