// Seed: 861799321
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri1 id_4,
    output wor id_5
);
  assign id_0 = id_2;
  wire id_7;
  wor id_8, id_9;
  always id_0 = id_1;
  assign module_1.id_6 = 0;
  assign id_5 = id_8;
  assign id_0 = 1;
  id_10(
      .id_0(id_2.id_8),
      .id_1(id_9),
      .id_2(1 | 1),
      .id_3(id_3),
      .id_4(id_4 & id_1),
      .id_5(1'd0),
      .id_6(id_3),
      .id_7(id_0)
  );
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input  logic id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  wire  id_3
);
  assign id_1 = 1;
  assign id_2 = 1;
  wand id_5, id_6 = 1 ** id_3;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2
  );
  reg id_7;
  always_ff id_7 <= id_0;
endmodule
