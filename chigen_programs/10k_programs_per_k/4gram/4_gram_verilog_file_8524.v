// Seed: 348213867
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      id_3, id_1, id_2
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wand id_3, id_4;
  module_0(
      id_3, id_3, id_4
  ); id_5(
      .id_0(id_6),
      .id_1(id_4 * id_2),
      .id_2(id_6),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1'b0),
      .id_7(id_6),
      .id_8(1),
      .id_9(id_3),
      .id_10((1) - id_6),
      .id_11(id_4 - 1),
      .id_12(1),
      .id_13(id_1)
  );
endmodule
