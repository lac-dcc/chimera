// Seed: 1883954898
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  logic [7:0][""] id_3 (
      .id_0(1),
      .id_1(id_4),
      .id_2(1 - id_4),
      .id_3(1),
      .id_4(id_4),
      .id_5(""),
      .id_6(id_1),
      .id_7(id_1),
      .id_8(),
      .id_9(id_4)
  );
  wire id_5;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  tri id_3, id_4;
  wire id_5;
  assign id_3 = 1'b0;
  wand id_6;
  wire id_7;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_7
  );
  assign modCall_1.id_4 = 0;
endmodule
