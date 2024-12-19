// Seed: 1490934930
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output tri0 id_5,
    output tri1 id_6
);
  logic [7:0] id_8;
  always @(*) id_8[!1] = id_3;
  string id_9;
  assign id_9 = "";
  wire id_10;
  assign id_6 = 1;
  wire id_11;
  wire id_12;
  assign module_1.type_19 = 0;
  wire id_13;
  id_14(
      .id_0(1),
      .id_1(id_5),
      .id_2(1),
      .id_3(1),
      .id_4(id_10),
      .id_5((1 ==? !id_3)),
      .id_6(1),
      .id_7(1)
  );
  assign id_6 = 1;
  rpmos (id_6, 1);
  wire id_15;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output wor id_2,
    input tri1 id_3,
    output tri id_4,
    output supply0 id_5,
    input supply1 id_6,
    output wand id_7
    , id_14,
    output supply1 id_8,
    output supply0 id_9,
    input wor id_10,
    input wire id_11,
    input wand id_12
);
  initial begin : LABEL_0
    #0;
  end
  id_15(
      .id_0(id_10),
      .id_1(id_14),
      .id_2(1),
      .id_3(1),
      .id_4(1 == id_12),
      .id_5(1),
      .id_6(),
      .id_7(1),
      .id_8(1),
      .id_9(id_7),
      .id_10(id_6),
      .id_11(id_7)
  );
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_6,
      id_10,
      id_4,
      id_7
  );
endmodule
