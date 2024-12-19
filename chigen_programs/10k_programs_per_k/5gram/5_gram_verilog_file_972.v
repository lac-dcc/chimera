// Seed: 1039293184
module module_0 (
    input wire id_0,
    input wor  id_1,
    input wor  id_2,
    input tri0 id_3,
    input wand id_4
);
  wor  id_6;
  wire id_7;
  wire id_8;
  assign id_6 = 1;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    output tri id_4,
    input wand id_5
);
  supply0 id_7;
  wand id_8;
  assign id_3 = 1;
  wire id_9;
  wor  id_10 = 1;
  initial begin : LABEL_0
    id_0 <= id_5 << !id_10;
  end
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_5
  );
  assign modCall_1.type_9 = 0;
  assign id_7 = 1;
  id_11(
      .id_0(1),
      .id_1(id_9),
      .id_2(1),
      .id_3(1),
      .id_4(id_5),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_0++ == id_7),
      .id_8(1),
      .id_9((1)),
      .id_10(id_1(1 !=? 1, 1 - id_5))
  );
  wire id_12;
  wire id_13 = id_8 ==? 1'd0 + 1;
  wire id_14;
  wire id_15 = id_10;
endmodule
