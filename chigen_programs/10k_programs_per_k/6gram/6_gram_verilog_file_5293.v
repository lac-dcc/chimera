// Seed: 388754229
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output tri1 id_2
);
  assign id_2 = 1 ? id_1 : ~1 == id_0;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    input logic id_2,
    input logic id_3,
    output logic id_4,
    output tri0 id_5
);
  reg id_7;
  always id_4 = #1 id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5
  );
  assign modCall_1.id_2 = 0;
  wand id_8;
  wand id_9 = $display(1, id_8 == 1, 1, 1'b0 == id_9);
  id_10(
      .id_0(id_0 * 1 + id_8),
      .id_1(id_8),
      .id_2(1),
      .id_3(),
      .id_4(id_8),
      .id_5(id_1),
      .id_6(""),
      .id_7(id_1),
      .id_8(id_8),
      .id_9(1),
      .id_10(1)
  );
endmodule
