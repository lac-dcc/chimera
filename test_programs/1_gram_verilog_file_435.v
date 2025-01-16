// Seed: 145509423
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = 1;
  id_7(
      .id_0(1),
      .id_1(-1),
      .id_2(id_6),
      .id_3(id_2),
      .id_4(""),
      .id_5(-1),
      .id_6(id_2 && id_1),
      .id_7(id_3),
      .id_8(1),
      .id_9("" - 1),
      .id_10(-1),
      .id_11(id_5),
      .id_12(1)
  );
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    output tri id_2,
    input tri1 id_3
);
  wire id_5;
  localparam id_6 = 1'b0;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_6,
      id_6
  );
endmodule
